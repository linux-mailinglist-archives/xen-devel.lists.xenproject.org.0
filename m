Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D3147E7BA
	for <lists+xen-devel@lfdr.de>; Thu, 23 Dec 2021 19:47:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251133.432384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0T64-0008B8-Q1; Thu, 23 Dec 2021 18:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251133.432384; Thu, 23 Dec 2021 18:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0T64-00089L-N0; Thu, 23 Dec 2021 18:45:48 +0000
Received: by outflank-mailman (input) for mailman id 251133;
 Thu, 23 Dec 2021 18:45:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PZJx=RI=epam.com=prvs=2991c9dd67=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1n0T62-00089F-Sn
 for xen-devel@lists.xenproject.org; Thu, 23 Dec 2021 18:45:47 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87c76f62-6420-11ec-9e60-abaf8a552007;
 Thu, 23 Dec 2021 19:45:44 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BNIS13e025316;
 Thu, 23 Dec 2021 18:45:34 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3d4wp284pw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 18:45:34 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com (2603:10a6:102:201::14)
 by PAXPR03MB8029.eurprd03.prod.outlook.com (2603:10a6:102:21c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Thu, 23 Dec
 2021 18:45:30 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::157a:fb23:aa6c:f0f6]) by PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::157a:fb23:aa6c:f0f6%6]) with mapi id 15.20.4823.018; Thu, 23 Dec 2021
 18:45:30 +0000
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
X-Inumbo-ID: 87c76f62-6420-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e30j+Y2lQqWzkl4HXVcwlSeyIDXIwP79EWi+qdS93xUtEMASXU1nQ4yrkm7dEWB0SxfmAVcNAHIA8DrIdh4cw9P+yQnQsKHON2T3n2RHPEy1S5bd6s2Rpk/o5P5QlH2ue5nLFF0eNXt6g3+gK9i3GtP/vzfxjsR+03xOKdDxYjfP0f/hUGDPMCmVsvJY+bCLumCmeKi4b5CokULOIeDSEmEU05vSuavhuLrnyVrax0hlrD6tb9Z/faaCPmI9qNRTVZizSHAudUfmdzKwv/7ZNkggUqozCJdx5fXYRv7FjHxISum2eWk73LF7UoyBEXWT6QS8kRWFnFZzI3NgD+eagA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CjkalpuwVcZrwKM7sU7cMK/1kZAsZmV2tUaPNn+OW6o=;
 b=VhfwnzTuI0gn2JE/x8PSQKWVjmWHddAfi76zJWt/NP5C4CmUy1BN1fJZn6aXRiUnl6TqX6hOLSsTV/y2mHKMMPl1DI96BN99Exxd9tt3Z0O6MtXMLhJGseOsc11ZW0NxxT0aEQhwJoFI+dgZauu39ucUr7jusIkSvhs7rTPMH94XyooYAPsuZcLE9Tcd5T+HnaMZpcRz+Gex2+eN0NIk2qSlsJJT7Ygp4EmFyskScrBy4yZ+p8h8Co4VnNh/i4LFFlomH7upCL8peFTN380Yc4PeoLWwdIVXmbv8qY04V6esRT+o//2caM1eNhfWFMdfoJrsDgF7G1+cTNvsmuNMUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjkalpuwVcZrwKM7sU7cMK/1kZAsZmV2tUaPNn+OW6o=;
 b=lI+4DjjDsmrXOAJkT+5rj4mbCQ9+f3+Rur+f4ymbF0Fn5X5EVVAN56UVdkiBKpYqITBEBL9fVBoqMi3yKoDO2hnOvUzo4QcSmYVabx371xBdWLKgMY24Y8qDTa3AaSabPLTADI7M9H7jYGaMvLreMttaV7houPzFVZt5K0Y2VILp+EhAniWWuCIMIDiwLygu+ptnVtDK7HEni5pmWWblTtvDI+V9POnOzAzIbBYVzIOP0Fpzog6mI4wANKEzG2SdhR465trYQZpHB9C7/PvEzcqK5fE9IYsnrnAumFh6YLYIAmtPBh/1wZQrQIJwa8nNgEUXpQjtBzyulORXgUw1Rg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Julien
 Grall <julien@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
Thread-Topic: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
Thread-Index: 
 AQHX8M3KlDaIxIuwGU2+lSkQB5aT3aw3iHyAgAQwJQCAAG+wgIABQZwAgAAWRwCAAOWAgIABAM8AgAEPOwA=
Date: Thu, 23 Dec 2021 18:45:29 +0000
Message-ID: <877dbvw46v.fsf@epam.com>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <e9dadd96aa5b64b9232e10a083ce393af620adde.1639472078.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2112171709140.2060010@ubuntu-linux-20-04-desktop>
 <20211220181215.GA1702335@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112201613210.2060010@ubuntu-linux-20-04-desktop>
 <20211221200305.GA2460476@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112211310000.2060010@ubuntu-linux-20-04-desktop>
 <20211222110414.GA2883815@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112221627190.2060010@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2112221627190.2060010@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.6.5; emacs 27.2
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4270e1c6-dc3e-4061-b0d8-08d9c64464d0
x-ms-traffictypediagnostic: PAXPR03MB8029:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PAXPR03MB80291805361FBE140B21F3F9E67E9@PAXPR03MB8029.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 goOfJusJ4aUn6xgk5t+WB72pDnyANfhxpThszUwG1GIeN08Sbd5worjFsQIzOr6R4E4G1KCscWQ4jt8em84pwKJKJy1e5Knw46m9F/RrNoZoYvaiQgnLmyHvorKxZhFixYY1EK61ulz1XxFYUKm0iOviXyzdLgx6a0vsSnt18jPZsYSsRah87MaPF38Dk+NeyJNkxZxW4Y3aln3UyuacFk+B2Uh74AhWYig7cHZ0aTcrZ3y8ORtiBeno8z5XY5mgQf5c/a3ghAJiNtSHO0v4nWWWyVZKRn1W7MlX9wBp+wpyIuyXB8anwSxcPRTLQ/pz4YKxlfCk6HUifYKishkcE1+5LzS8YAtAkw9Gz+2mxAgq6uGiE4A7L+FlBbIapyc8L7/ytolcVjQHzsc87cOq1yoiO1lWW2iqE4QxKjmgo1eRJoTP8m3TfUb2q214hGCpzheuDvcUxs0c1IR5TixvB8xbdACXLaL0Ag7UHDibYzSR+JyNoQKnPKCr2fLqkBbTQqHHhz3O7+FtTVSX11E5lpFYUJQZkDKvzpZgBdUbooccyu1rmM1ptagpnVfb1fBA8ilIqBcnOfg+3Q23RzQPPcyUcztx/PDz0c/M4hGzSYcv8ABAMT8mzylAf8nN/lLLKg/nvl5tY0fVlyvwg9mn/KOdZJJeQHujZjF2fJzkeMFwWXphxtNiH6meYYBzjM4CJegDWIpi4v4PcyvcMLaBdjGGSBQ0GXFiY2NjfU0/BS1hHu4zMCuL4VsvpYJILqnF0Qe2PVcUE+zMbRXhCbmuFCuIHrbP+RGEHmpULq8PUFs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR03MB7594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(64756008)(316002)(2906002)(86362001)(36756003)(38070700005)(66556008)(76116006)(54906003)(5660300002)(6916009)(508600001)(66446008)(71200400001)(83380400001)(2616005)(66476007)(8676002)(186003)(6512007)(966005)(38100700002)(4326008)(91956017)(55236004)(8936002)(6506007)(6486002)(122000001)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?sq1E20+/vfSGl9zgRvz1d74U0rXtZriEuU3eovv+vj1nlqQKcGIyxGMUsH?=
 =?iso-8859-1?Q?qYRFiKp8bnxmMdabN6S9UlSzZ/KbPNxZ/JVoSTSYnQvh1OiDexwI+l+N9W?=
 =?iso-8859-1?Q?OauR0+ueUobKHYXyA9UzZjoFQTcA1HETHLmNeomFDEoxztui8SFpGZmed1?=
 =?iso-8859-1?Q?PJKyYSvPaqWWGCFkgd0KZ1eSGSgEI0r49ky252J0vGDHS+///NAK+kMEXc?=
 =?iso-8859-1?Q?fAIEfMBIq4doUMw0dfsRA0K8E+sKu3wvmJr9535e0IZyErSSnSW0wX9DLl?=
 =?iso-8859-1?Q?+3ryhMyomukj5kDdTgv9ob3YQFyoTAzW3c3vYKNRu5fakZLMNDql1HxikW?=
 =?iso-8859-1?Q?mejXFTWxQ06FfjNtBh9UblpN1Y9DIw+I7KlF0Z6yghoEGbyO7Phypnlrup?=
 =?iso-8859-1?Q?+FYkI9TnqJSm0l+J3vqwi8v61/intEUiws7cFdi3P0u0tg4mpjxtteyKQF?=
 =?iso-8859-1?Q?htm4guNsE31Q8WqlKXCbo3BcNH+GWwwIOp8VZz6w7619NDtuKuPpzQqCkJ?=
 =?iso-8859-1?Q?PDjKQFfS7NeqkguBCe+d1NDqwVnfXxZD+ONA67EUMmJrXzra1t2bekFmxb?=
 =?iso-8859-1?Q?7KR2JQ3LRAEvv1uIK/mSs232f6NW4goGkWmG2WUMO1UUyBL2XEvGQSSlRY?=
 =?iso-8859-1?Q?PhHrQKtFSAgaVOsKU+51x3CW2GJ/Co/NLG+zURd0koPx/NOkrJlH+3wcnQ?=
 =?iso-8859-1?Q?zymF5WK0vqZ9CCNXQiIH0yKeYCwcavx9Xn5eNXvP9+p6m6Db838rtmWwus?=
 =?iso-8859-1?Q?2YQS37GuCRXYib54wW2Nxu5bMDRURxjdxkR4EYfHDIbYaXXQyzNbhNRC2Y?=
 =?iso-8859-1?Q?ZxP8c8PvpEW+C6j7FauxxHwDUfalqvpAHXCKoGw/cPAplp4y7bvX78aeJm?=
 =?iso-8859-1?Q?sYatpW/hOKNcZd2AdZGzUur2VFT5g3v+qsjQbnXqDDItsPHOhEuQw6hQYz?=
 =?iso-8859-1?Q?qX9Fospp/bf4W7a0E1C5qTyoQDmR+xG6jwyNeMFvBdUiG05dTuVcfYuk5n?=
 =?iso-8859-1?Q?jNMXRxC4gK+GAXqGuxvDmmWYyRfgmvikXyinjck3VN0fyNeGHOaRrldrW+?=
 =?iso-8859-1?Q?5LIg8bnEPVi07vmvNVxRqO728iuOPgIrDCPEJEmEbAsCG4KEIowVdYZoUd?=
 =?iso-8859-1?Q?jOob2vp4v9NdYv5VnNBg2DFAXaNffQQhvTeCIRWsETaqAAlTBv2EorODKq?=
 =?iso-8859-1?Q?4uhP/0Qlxslgsph153gxeB5c03ZNALMBw63h9CHO3MLyExJIlWuVWyUZGE?=
 =?iso-8859-1?Q?kOjQRida9iDI5mvdv7C/ardtazgqRYTRXGGfuMlKFq8C99mC4M1bjo5YBD?=
 =?iso-8859-1?Q?qLuH7/j2H4nKQWGvjbY5BgFQjbHqSvEwDok1CCE9GXZWWeJjxD9Q32I271?=
 =?iso-8859-1?Q?pWRfCTUJfTVHBWbrBglDgygENaxCHahyU+oQJ783RRRNkAR6kfYipCzXBD?=
 =?iso-8859-1?Q?yNZ4AnQ1yUk6L5UuedamHfxEfiZcW/fm9Q5nELD6SZnudf63iYSi3bsRG3?=
 =?iso-8859-1?Q?hrPrg2meg8Oy4dLgox2vXkV5Ubj3xOR+5xHSXpz/dpDWJgL4LgApukpe6O?=
 =?iso-8859-1?Q?fCnRjrxDWsUWoKX+pVpBw0U/WvqgqOLAQMiNFwMMVTaiCRIVFCpEZPEp9C?=
 =?iso-8859-1?Q?l1JjQInARhqi1UpNs31ofQomCXxkT0T0HgoqGl50bBYzTxLrFYhC27nReO?=
 =?iso-8859-1?Q?ty89Mdk2j5KcUirS3YPte91jBv/q+58eA9docF/vhTnX/Cu04pdC57XiOt?=
 =?iso-8859-1?Q?SqKZj/cM+zNnCqgi5K0yRhU/g=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR03MB7594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4270e1c6-dc3e-4061-b0d8-08d9c64464d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2021 18:45:30.0172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eoZ7pyGTPE+ld263LUX5hREiJzqkKk3Ad0BZMBo+WH19S0Xx1j7Z2UxogUU1qMWvbg2uNVB0Ivz+PDLpcPx8Rc53yHDdmLomxAGELHfCF0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8029
X-Proofpoint-GUID: FRYWGeg67_LCNnyZVVoeFtRyymIxiZ1G
X-Proofpoint-ORIG-GUID: FRYWGeg67_LCNnyZVVoeFtRyymIxiZ1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-23_04,2021-12-22_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112230097


Hi Stefano, Oleksii,

Stefano Stabellini <sstabellini@kernel.org> writes:

> On Wed, 22 Dec 2021, Oleksii Moisieiev wrote:
>> On Tue, Dec 21, 2021 at 01:22:50PM -0800, Stefano Stabellini wrote:
>> > On Tue, 21 Dec 2021, Oleksii Moisieiev wrote:
>> > > Hi Stefano,
>> > >=20
>> > > On Mon, Dec 20, 2021 at 04:52:01PM -0800, Stefano Stabellini wrote:
>> > > > On Mon, 20 Dec 2021, Oleksii Moisieiev wrote:
>> > > > > Hi Stefano,
>> > > > >=20
>> > > > > On Fri, Dec 17, 2021 at 06:14:55PM -0800, Stefano Stabellini wro=
te:
>> > > > > > On Tue, 14 Dec 2021, Oleksii Moisieiev wrote:

[...]

>> > > > In general we can't use properties that are not part of the device=
 tree
>> > > > spec, either
>> > > > https://urldefense.com/v3/__https://www.devicetree.org/specificati=
ons/__;!!GF_29dbcQIUBPA!kNodtgmOQBc1iO76_6vTK-O1SoLxee_ChowYQiQYC595rMOsrnm=
of2zmk7BnhXCSnJPN$
>> > > > [devicetree[.]org] or
>> > > > https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/k=
ernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings__;!!GF_=
29dbcQIUBPA!kNodtgmOQBc1iO76_6vTK-O1SoLxee_ChowYQiQYC595rMOsrnmof2zmk7BnhXl=
oYUaj$
>> > > > [git[.]kernel[.]org]
>> > > >=20
>> > > > "linux,scmi_mem" is currently absent. Are you aware of any upstrea=
ming
>> > > > activities to get "linux,scmi_mem" upstream under
>> > > > Documentation/devicetree/bindings in Linux?
>> > > >=20
>> > > > If "linux,scmi_mem" is going upstream in Linux, then we could use =
it.
>> > > > Otherwise, first "linux,scmi_mem" needs to be added somewhere unde=
r
>> > > > Documentation/devicetree/bindings (probably
>> > > > Documentation/devicetree/bindings/firmware/arm,scmi.yaml), then we=
 can
>> > > > work on the Xen code that makes use of it.
>> > > >=20
>> > > > Does it make sense?
>> > > >=20
>> > >=20
>> > > Yes I agree. I think linux,scmi_mem and scmi_devid should be upstrea=
med.
>> > > I will add those properties to arm,scmi.yaml, mark them as related t=
o XEN and send patch.
>> >=20
>> > I didn't realize that linux,scmi_mem and scmi_devid are supposed to be
>> > Xen specific. In general, it would be best not to introduce Xen specif=
ic
>> > properties into generic bindings. It is a problem both from a
>> > specification perspective (because it has hard to handle Xen specific
>> > cases in fully generic bindings, especially as those bindings are
>> > maintained as part of the Linux kernel) and from a user perspective
>> > (because now the user has to deal with a Xen-specific dtb, or has to
>> > modify the host dtb to add Xen-specific information by hand.)
>> >=20
>> >=20
>> > Let me start from scmi_devid.  Why would scmi_devid be Xen-specific? I=
t
>> > looks like a generic property that should be needed for the Linux SCMI
>> > driver too. Why the Linux driver doesn't need it?
>> >=20
>>=20
>> scmi_devid used during domain build. It passed as input parameter for SC=
MI_BASE_SET_DEVICE_PERMISSIONS message.
>> On non-virtualized systems - there is no need of this call, because OS
>> is the only one entity, running on the system.
>
> OK. Even if it is only required for virtualized systems, I think that
> scmi_devid is important enough that should be part of the upstream
> binding. I think it is worth starting an email thread on the LKML with
> Rob Herring and the SCMI maintainers to discuss the addition of
> scmi_devid to the binding.

Agree there. Also I want to point that there are other hypervisors, like
KVM, which may benefit from this.

Another approach is to name this node "xen,scmdi_devid", but I don't
like it.

>> I've chatted with Volodymyr_Babchuk and he gave a great idea to add a
>> list of device_ids to dom.cfg, such as:
>> sci_devs =3D [ 0, 1, 15, 35 ];
>>

Well, yes. We discussed this possibility, but personally I stick to
idea of re-using dt_dev, as we discussed in the different thread.

>> Using this approach, we can remove scmi_devid from the device tree and
>> just pass a list of scmi_devids to XEN using additional hypercall.
>> We can probably make hypercall taking devid list as input parameter.
>> This will take only 1 hypercall to setup sci permissions.
>
> But how would a user know which are the right SCMI IDs to add to the
> sci_devs list? Would the user have to go and read the reference manual
> of the platform to find the SCMI IDs and then write sci_devs by hand?
> If that is the case, then I think that it would be better to add
> scmi_devid to device tree.
>

Yes, ideally this needs to be done by BSP vendor in the device tree.


--=20
Volodymyr Babchuk at EPAM=

