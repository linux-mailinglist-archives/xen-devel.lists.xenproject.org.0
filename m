Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0759D478C7D
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 14:40:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248648.428882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myDTD-0002bg-6d; Fri, 17 Dec 2021 13:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248648.428882; Fri, 17 Dec 2021 13:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myDTD-0002Yi-3d; Fri, 17 Dec 2021 13:40:23 +0000
Received: by outflank-mailman (input) for mailman id 248648;
 Fri, 17 Dec 2021 13:40:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qsGH=RC=epam.com=prvs=29854569c1=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1myDTB-0002Yc-Rb
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 13:40:21 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfb05162-5f3e-11ec-9e60-abaf8a552007;
 Fri, 17 Dec 2021 14:40:20 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BHC974K024282;
 Fri, 17 Dec 2021 13:40:16 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3d0t9w8ccj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Dec 2021 13:40:15 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PR2PR03MB5419.eurprd03.prod.outlook.com (2603:10a6:101:20::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Fri, 17 Dec
 2021 13:40:12 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4778.019; Fri, 17 Dec 2021
 13:40:12 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: dfb05162-5f3e-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a52w2df6wD0x3W5ef9TVC67xbR6CkiZKfDX1rzlVRAvt7SRrCFCQlLDzs/Et95ovT9tvfcAKqqqA1RAlxXQyk1QD84W4Gi4mfVpcbCNzGtZJ7j6sM85oqn6KN/ogAmubZseSQgt62XMZp+/wTGVHr0hrnrOvYW1mlKxNDVh8ULoJvu6PRvG0qSzOdtgyIaEHMVdHRa42ta58ezfbFmaQHlYGzeamEaCMisO1hSgg2n7XWreG3wns3LmLUic+FcnZhvlK3AxfPJ40U0A/N6o5HVyQhjFWs9PZC+HlrfF/08JwfW3U1ltheqaHg2EIqJpwEjksW0c3vOE2LT+0l4oR6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E5mhhUT6+36aJ6DOKmaJJI17X6TlMsM4nh5bF5/mN3E=;
 b=W1/7WNOi9RB1S6NsJzh6jWM4yltE33loLJWIwV/PFyIJuW2D85XwnA89FRNLnTvf38puCSPa7M9PyRXojs94gYRQUb/MaJUITasJhOLi54NCvEUNBiWtCt/KcLevJub0h2p5WbNwxAzy6OnEWQK8Vx3d1H8toPpSWPkrHjFRQctjR//lFMPMIjqwFUjb92/6TcuIurmWMoJufFAOYqBlkVhtL7F12uIiECKDQm+jEfmH+Dwj58hJ3wRG+WGPWDYQe3P1hSD5Fv/vb7nqx6h43JlshSdvPW9+9hu0w1aTiZwkRPC4M3DeFwmrFbfyVZrsH7fg/VGi9k5oHIziBnuT8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5mhhUT6+36aJ6DOKmaJJI17X6TlMsM4nh5bF5/mN3E=;
 b=Dwjr6coByq09z9TW19GFqgSFkSS+w9oZW9jrGObbBbv54HGukIMuzmHg9o4QodO6UWU0wmSuBph5Kg07isjZ0kJmdvqiOw4iuRBGELpPuSIjU1FtERVPQQffrSsRMAfdZrx0tjoUhoTRBzs7NR66OkW558qUrgLEr1HydynE3EdGODsPFfxJIaRVG1RBM+LnQdVJC6FwWN/X6OBl47pHenqaOWoLooWYkMBvjhYzCjzzuBE7PooPYkol2x/p1/5hZHKAlv+upSI+e2PhtgRGuHU0SoLb5Rw/M9GkWjmHMdCtZfWFzAn0j7AOY7mykewalurk0h9ekStGLyc3J45j8w==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Julien
 Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony
 PERARD <anthony.perard@citrix.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
Thread-Topic: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
Thread-Index: AQHX8M3LpzWz4l8PQUiIA2nAUV0H+qwxu+8AgAOpWoCAAOP7gIAAAQmAgABrUYA=
Date: Fri, 17 Dec 2021 13:40:12 +0000
Message-ID: <20211217134011.GA4065065@EPUAKYIW015D>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <4469cdf05051bd691a8adff2657d27f6a5f0cefb.1639472078.git.oleksii_moisieiev@epam.com>
 <5876e66a-9a12-6a69-989f-a5ba6709886c@suse.com>
 <20211216173625.GA3623693@EPUAKYIW015D>
 <08488d6e-3bb5-71e3-2e07-aafb912d69f5@suse.com>
 <e86974f6-dde3-20dc-1748-962d9122a05e@suse.com>
In-Reply-To: <e86974f6-dde3-20dc-1748-962d9122a05e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5e057ea-25bc-40ed-e96e-08d9c162c02e
x-ms-traffictypediagnostic: PR2PR03MB5419:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PR2PR03MB5419911F3C30AAB3D21B2CBBE3789@PR2PR03MB5419.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gn0lYFP6UEnjg9Mhy+LK47fJwVknTTF61QxA0gB6Y6sAd+RZO+jLmUIaCeH8j6fl7Uy0vAOCCTVv1fwXeQnC9nKcngDBJhs5E84w7/maYmNRdO/WExQ7vb6C/mrlooZlFjJN9sUCB+OsqJxIGEycbilTjRYWeBg0iGeWRyrqH9914t3vqKY55OX+Z3T3ggNyEz7KaH1PQAudHtx8L+Tma2w+L9caP8hnlWkkCJraxc56sR26cxIm8+AwEWSqAiC5Qkq19lxlsHNP9ttQGMIlZfv0VjsXJ3/paQYpqhRFsx88AYJhCVnOeoqK233jEqYCxtXsNVZvUIxttgiPe9JqQFsvS4WdmDy0yCxJ/DH8HuucVdmFA5G/8wGLPRA53jx478f+niIWFsgzsNE2QEl6IT910ikjHyOuw/0MQBbfaPZ+7GweFzx69ifBPsHF7557DwJhM11Km+AQ74Iu5iLGg3nZ7E1gyyaHRRb5aQmh07r088G26Z8xsw5WBdDu2Im3Lo7ABpJoQrP1H2hbUTrlxOfS8zsJjppJ2+A2I2vn8wr4TatqaoANOmzFolBjdIDSZg2KY6bvkHfrHvNJ/ftogLGVWpHVoxf0aqHUzbue1HGvTzAEen3/ty5525SRdh1uQgoYddi2/n3TryA0ierUAauY3vM4Zed73IXlM3SX02UU3aAD3kfCT58ZLew5+8H+TK7pi+oaaUg78YCLo/O/+w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(1076003)(66476007)(6506007)(66946007)(66556008)(64756008)(66446008)(38070700005)(122000001)(53546011)(4326008)(38100700002)(76116006)(91956017)(71200400001)(83380400001)(2906002)(33656002)(26005)(186003)(8676002)(86362001)(8936002)(33716001)(9686003)(7416002)(6512007)(508600001)(6916009)(5660300002)(316002)(6486002)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?9y6+MM+0v4eVq97M4oOyJIO72RMVvANFpMo1AcZKh2+/a+I6QlhacGGJ1Adz?=
 =?us-ascii?Q?i7+P9fY5NA7z9vAq/chAsmyqennN7OMCx0ORQBw5KU/571HqVcf6CvGdF71d?=
 =?us-ascii?Q?EQ3DKAN/I7wbUGdz1CKWd2VG+vn459BsSaI5TFxDvi7WkSGCPLTfs049I0oC?=
 =?us-ascii?Q?WdapDUoLR2dNrX90yNuEB3QJf6mfqOvTi+gXX3EoCvnfzzDZns44fWMeqrwd?=
 =?us-ascii?Q?eX9I8ngk1JM2fOxPyolCPdNHlqF66mnEI0YbjpGav/+ITRuwF/jZ9GWa5I5e?=
 =?us-ascii?Q?AXm38CZQX6TlCjNkabSEx13KQiowLzKsWPgCyN55+RxLRMx7E5+HLD9JZ/9j?=
 =?us-ascii?Q?fb6G2crFbR6fz5bO3okRKQP5iU5nNPaEwQC3C/94mOoTStvZFNrhb1AM8szG?=
 =?us-ascii?Q?zqAcs1hvsu3LkRTqGcoPu6O6s4Ad10pOtnR3P3Uvy1sbkEkTcGEow7H5PdL8?=
 =?us-ascii?Q?5wBZRzBApcL+vvxjBDC2V4EBerovDmSJPwR/ySRbEhmjHYhYE0Tvcqfpf1Qf?=
 =?us-ascii?Q?Jw2PayLxulTzDJs920VNavoj46QN5mZyi5nXbsfqLR9QFJNYkFxxPYondsh0?=
 =?us-ascii?Q?wFcqOwcNkxxOedvjouxg+yQTBR6ZAQcf+2t0x7TlI6LXL/nS7LqmNKifvUs6?=
 =?us-ascii?Q?5v+CiD9rhTRmAqRvHYYuFNrXFMkWihM1eRFpeUpoH6lJbOZLr/5iHJ8EG5ln?=
 =?us-ascii?Q?eKRwGaUjua53cv5EBEKHfenk8RsjY297PtlRuzCReo1NoJuECU/1trvuaP9Q?=
 =?us-ascii?Q?1RWMcLYhJwnvdDXMHMPUMQKR0vrEabQtE8s8mJc63yemhjhretzW3c/vLrMh?=
 =?us-ascii?Q?2AlWU+vmIjAQee/2TqtTmJphEndYUSImMePH/B1lKD6IusFnACnvzI+GP64P?=
 =?us-ascii?Q?tCL25D3bgqICjMRJEBw7dV5Boh1sKrJKjrsfjqjyM6lhSSLLMTZKB7rnNDQ6?=
 =?us-ascii?Q?Hy13dNfM5UeQo3v1LMzVz2BHBAYS011d4BG4dsTgTfc3IsU7VLCz1sg7/aw+?=
 =?us-ascii?Q?8L0PUp+VUULZ+HJRPwx8995H6njwK68ZCis7C5H9n6Y6x7rFLjcKg3u+hA8C?=
 =?us-ascii?Q?AYtqDJP3AQ9hSbiWsB9wXUNb2GiO9OaU/BVkXrOUpoqllZJWffzICDYCxywz?=
 =?us-ascii?Q?TLS9djnV8RTCek/w2Ywtm8i4tt9vXmcEJ8Rbe7Px7MYjlksl1qVTQn3O6n+x?=
 =?us-ascii?Q?cZP76zGiwerqAwX+KCEnCdDc/Zf8Ge8ruN9xZ5itM54NowV2+2peRmI7febi?=
 =?us-ascii?Q?t6XNRZUgqxenqUGciYBCxUBxFa09t2jeVTdQPdfcH1hXgLeAsC0M8HHoyZeP?=
 =?us-ascii?Q?9y5ihmECMAfo3B5da5vLgDqKutqOR/UvXK+QSeNQfkH6aSRPVtwWazcYISjB?=
 =?us-ascii?Q?c1zjdlHClXCj788IP1GrkW8hr6SvqBgVJNJD9Zns6MJToqUzsmfBtxg6AS7q?=
 =?us-ascii?Q?FeBW/iTNTjAVgu+cWBdIGRNSY0UA5lhsPR63FuUUylyjGIpVQsQCdLqvHjMN?=
 =?us-ascii?Q?gMybAZznDdyPChxsrjkcrDJm/LF7pMa1KwTtr1SLuLrzPqNHOQ5TZhexnlzG?=
 =?us-ascii?Q?g0PYt8CS5lrSwhZV7EqUPOF3VWyEam/ao/ewj0/fr51OOHqg7/SfPvd8AoiO?=
 =?us-ascii?Q?GRD3dfzvVZc46VVn0Cx+WLYKW/jnvetSIWpD3nbOupsfq8oI1q8S+obKT1qs?=
 =?us-ascii?Q?TNv19UNxkEFkqLr3nXjR7K+V+Eo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D9C80DACF7843742A10906831A3ED202@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e057ea-25bc-40ed-e96e-08d9c162c02e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 13:40:12.4266
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PqQw/pWjFJaC5i0H863r343cGNPf5y5+6Ujn6SCFcjalrpwf+0ImKRjbGfqcV7qjmnlHmfVxWmhhqmHGjwSs0CE0fsuX/GNEmJot/6Sq6XE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR03MB5419
X-Proofpoint-GUID: 9cfbSjKRXJbiru3r3O4iR-1MvKTQX6Dw
X-Proofpoint-ORIG-GUID: 9cfbSjKRXJbiru3r3O4iR-1MvKTQX6Dw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-17_05,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 mlxlogscore=969
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112170079

Hi Jan,

On Fri, Dec 17, 2021 at 08:16:05AM +0100, Jan Beulich wrote:
> On 17.12.2021 08:12, Jan Beulich wrote:
> > On 16.12.2021 18:36, Oleksii Moisieiev wrote:
> >> On Tue, Dec 14, 2021 at 10:41:30AM +0100, Jan Beulich wrote:
> >>> On 14.12.2021 10:34, Oleksii Moisieiev wrote:
> >>>> --- a/xen/include/public/domctl.h
> >>>> +++ b/xen/include/public/domctl.h
> >>>> @@ -1177,6 +1177,13 @@ struct xen_domctl_vmtrace_op {
> >>>>  #define XEN_DOMCTL_vmtrace_get_option         5
> >>>>  #define XEN_DOMCTL_vmtrace_set_option         6
> >>>>  };
> >>>> +
> >>>> +/* XEN_DOMCTL_add_sci_device: set sci device permissions */
> >>>> +struct xen_domctl_sci_device_op {
> >>>> +    uint32_t size; /* Length of the path */
> >>>> +    XEN_GUEST_HANDLE_64(char) path; /* path to the device tree node=
 */
> >>>> +};
> >>>
> >>> This being - aiui - Arm-only, please enclose it by respective #if,
> >>> just like we do for certain x86-only ops.
> >>>
> >>
> >> I agree. I will add #ifdefs in v2.
> >>
> >>> I'm further afraid the term "SCI" is ambiguous with ACPI's System
> >>> Control Interrupt, so there's some further tag needed in the names
> >>> used here.
> >>>
> >>
> >> Thank you for remark. I'm thinking about SC as System Control.
> >> What do you think?
> >=20
> > I guess "SC" could even more so stand for various things. Even the
> > spelled out "System Control" looks overly generic. If this isn't
> > Arm-specific (in which case adding "arm" into the name might at least
> > help the situation a little), then I guess some further disambiguation
> > is going to be wanted. Since I don't know any of the context of this,
> > I'm afraid you're in a far better position than me to come up with a
> > non-ambiguous name.
>=20
> Actually, looking at the title again - any reason not to add "mediator"
> into the name? While I have no idea whether there could be other
> mediators with an ambiguous acronym, this would at least address the
> ACPI related concern (I don't expect anything mediator-like to appear
> there, but then again I might be wrong).
>=20
> Jan
>=20

I wanted the name to be abbriveation. Also tee option in xen doesn't
have "mediator" in it's name either. As for the SC - the only 2 uses I
found are - Spreadsheet Calculator and some script name for
traffic-shaper.
But I think name still need to be discussed.

--
Oleksii.=

