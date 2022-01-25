Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 987FC49B656
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 15:36:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260393.449785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCMv1-0000h1-JV; Tue, 25 Jan 2022 14:35:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260393.449785; Tue, 25 Jan 2022 14:35:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCMv1-0000fB-FY; Tue, 25 Jan 2022 14:35:35 +0000
Received: by outflank-mailman (input) for mailman id 260393;
 Tue, 25 Jan 2022 14:35:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JA8I=SJ=epam.com=prvs=30242beabd=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nCMuz-0000f5-3X
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 14:35:33 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b986d53-7dec-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 15:35:31 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20PE8kbh027570;
 Tue, 25 Jan 2022 14:35:20 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3dtjq703e7-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 14:35:20 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AM9PR03MB7268.eurprd03.prod.outlook.com (2603:10a6:20b:262::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Tue, 25 Jan
 2022 14:35:16 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::711f:a15e:91c1:6d43]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::711f:a15e:91c1:6d43%4]) with mapi id 15.20.4930.015; Tue, 25 Jan 2022
 14:35:16 +0000
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
X-Inumbo-ID: 0b986d53-7dec-11ec-8fa7-f31e035a9116
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNHcPxQJSir6kpQLAZ39GFbcQkb85yNraDGovONUVIRl8W6F9FKnjG1RWJ9q7XpPVIOY1ulBkgoXW49rS9cWwypG5gwq6zNHEuyliYN0BRfwGGY3YAWnKIV2+4nRKCUZvqqH+jeVOjFDrbAsQXmu/GuDZXrQvrixqEy4TzaHL9fDs05L6uY5ZHrt+2GLuDRnIM9A+O+Gmt3Kv6DwfMFQMipqwITUEI5luHNCCMUluPTRLUsPzZI8DjH153xERZ9nxECo2S24taZzYVshBwQagea5dGOSyzTCprbG/oHx9jInBppCY01EPh7nYjDvGi+U+vf1qAhQ0OYwbqDXZJZ6Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4OItFEEou2ijl4hNZRg6OdsiIV6cGGNLI7GmZI/iDw=;
 b=nNFLdfNRguOpqlqBPaj1nyI2plrrMpYQdiCgRYrNeBSlXXqCqZ9P9dECPL0nxeq15cVZCyXuOrguifS53zFFDBZFFoi1tHZO92vqK7zwX+KRU4lcwTGchOEBBs8RQSd270rHqmmiyzocDpW3Y0A5peacGH/toPFCnBuNFaYezrXETlcqkAmGnIHoK33uBltfxSJ2I37LfOwSxR+O58LW3KJsAfU4D7sm7cYtreDL6sxndIJttV3rWbl2OvlauIK8vbmqTlnlCmibIhjUOT485N9CQGXMLEiplOODpWZwYi3MQQ6n9Fzt5p1I4Uvoi1TVdE8cnEQ1f7gkJgFK1SzbVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4OItFEEou2ijl4hNZRg6OdsiIV6cGGNLI7GmZI/iDw=;
 b=AnlgE10Aom6tCUGdjaw+MNoh18UUBPEJo/fqnN+1N0p+7QVAnCUYbbOyxVIRtbDQIauRFiojw3QmF4DeyaSc0WDGgJ/nYPXc+RTVkraEb/fq7IqU1NeYTkJtG7stCXxF3fwVmgRC+gvx3+GVlKBLs4MR0g8RQSAhwjoWSW2s5PmBPbe/Y/iujgzz6bGY6ESAlVlnxaJnDUefVo7+OOKFHdUxPxDK6zArX+ae1dB+OcN301Z5bckjD4PSf44dkmEr7/5nzCEwDbpJNdf7WHfKokzI8g3ythOv0c296VfZ0y8V3D5LErxx/pOsDFofhUFeqiMaBRkTDwFnV1WRxCgqeQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
Thread-Topic: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
Thread-Index: 
 AQHX8M3JF7Ng56/tV0+8/7pODiaWfKw3iHyAgAQwJICAAG+xgIABQZuAgAAWSACAAOV/AIABANAAgCsRKgCAAOC8gIAAlQqAgADLX4CAARblgIAAX5CAgASN5YCAAAwYAIAABamAgAAvCoCAARH1gA==
Date: Tue, 25 Jan 2022 14:35:16 +0000
Message-ID: <20220125143515.GA2803662@EPUAKYIW015D>
References: <20220119120400.GA3779126@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2201191644400.19362@ubuntu-linux-20-04-desktop>
 <20220120102147.GA4153317@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2201201230480.27308@ubuntu-linux-20-04-desktop>
 <20220121150753.GA898010@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2201211236060.27308@ubuntu-linux-20-04-desktop>
 <20220124182249.GA2485483@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2201241056290.27308@ubuntu-linux-20-04-desktop>
 <d5c84296-79a6-5698-802d-4d9ba60dbf24@xen.org>
 <alpine.DEB.2.22.394.2201241403240.27308@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2201241403240.27308@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72f04dd6-0453-40f1-382a-08d9e00fe776
x-ms-traffictypediagnostic: AM9PR03MB7268:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB7268C49DE8A010797CA23791E35F9@AM9PR03MB7268.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kIoySpruwMszqetre9eCHLLQtEjZtVfBSckRQhS05wetEjhYn4YjT82FMNnelq2UIjcxl8nGDzq3UYpWLbDwvWNJB3z5KTX9NZFxYn/efJJQeAX2W2hB8GWRkhw6E/IifkI6wfFn2hF7xkmIspirsWYG3vSo7LXu5EhurxPzY+rZb9uURgzj8J2itjyGNKL4rwIQEQqfqZySOybG97YNcFBlqBlsyBJzPCEDOyk3CiRaM9HIVaWR/V8Gc5hID69orU6yQQqw4ranlNk2Cc9lw1O9drYX7ZFnUuCcOQQMDpaBI2t9WLuUU+fxXxqsf6opdqZnhjk50M35fnY1MXdPj8TmOBs7pA/7vljP8xet13GO9hhBvkLyJE0kyE7vqYkAjihFQzQ/Iz14FPmtTycqx+CyOK93PJ8DHV0ENFjW9Wws1yX8ChKxShb4Nrax4/NssaZ+3pKyTcvJ3gMS/G5SVHSbQnBIsqH9om7aQVjud+n5HvPs31CfakwNb3JgVdd6U0/6L4UFxD9usAB3rH7vAdAmHme46XLcUw1i7lHU++Gaqp28Wutk7viqBnYba4Havf6O/R3jHPyazGkRILlXzchWDkA80CFix0OvlqvQpzblle09eI+zrl3Xj0TDJNpPMIkZi0LZsMO2PzAlRJyPvs8zXPB5Fz2MjgluuXSXP6NJDl0tmOEYECbRGhhCPp3lanWOxNB+9JQjGbIx+AI0dSAEK+kvr0DqP2PilskO41NhE0Z6z6es+I/rOYFugK+AQrOMFcdqQ+nT42p2WJtTuG/cPucAPgkn+vE7GegRAjE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(186003)(1076003)(38100700002)(26005)(91956017)(8676002)(66476007)(76116006)(2906002)(66556008)(64756008)(33716001)(66946007)(66446008)(5660300002)(33656002)(8936002)(4326008)(508600001)(9686003)(54906003)(316002)(86362001)(6506007)(6512007)(38070700005)(71200400001)(6916009)(53546011)(83380400001)(122000001)(6486002)(966005)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?rtff31+zhtGWOZMDzg8mQx92IH0HGgUqzLFScwxHL0f/Ik6OLzhhJT7hGVB8?=
 =?us-ascii?Q?7jxKvX4n3iuiQR/LQJ+FruabvqJ8UT8yqr+O/YPuZ6Ao/HtJmPuRl+zULRI+?=
 =?us-ascii?Q?ahjeDwl7XombkKD+1ZNoFrrSoTHILaLU9wSBAvATG+VM5T1Pvq8VaJL5JKi3?=
 =?us-ascii?Q?RBjfyjEoBzqUVPjfnb1GdRbXyXxQ2ZtVcwjSlgf3RHwTwJ1vgriH1BuwjFV9?=
 =?us-ascii?Q?uj2KA7fsruwCDTt1x78q6S0QFgoQ2xk64kKrGBqqcV5irCgeAe+9w/OQQDtp?=
 =?us-ascii?Q?BVoJH68ERiAOzTQbsTgvrjaLiakQy7rs9577y60T0715Qy6h9BkYYOW7cyGv?=
 =?us-ascii?Q?WSIMCsoBTI/YPIJVp9hxSfvGwOM90MGvW/W2RPZwo57YOHWfJ5oWdriFgOoh?=
 =?us-ascii?Q?LtzCiIndgfp6D5s+5iHwMZqp1XAfr0ZNCHayucKcduzs26ETf1xpGyBOxiQ2?=
 =?us-ascii?Q?8ZtqKdUggnrSxuZP/4dxI4yjDcR56L489FM0IAkjssaSCg9fksPFNG2qGzXQ?=
 =?us-ascii?Q?3GNzuGvVxkm/zUC3TywZ4Rrw+lM5yAgFNV4+WyeVc3QDES2tl66B+1HoTx3t?=
 =?us-ascii?Q?mRckyAvJxscYBEFauCfWZRddzRSKePzQDlTQa3KLATh6fDPakbmVyf4kKe6k?=
 =?us-ascii?Q?/MMnSQe+USFksFlBdfksA1ynw1V3THFULF2YkAgoEFJPqE172XcNkqEQqL8I?=
 =?us-ascii?Q?NM812e2ogdRsLRryotPmUSiSyiHMjIVoS5li3EKt+NSyV5nrsrIlFBw3rJ7e?=
 =?us-ascii?Q?nMv7rbo0i0fHLySkAS67ficIzfZViCzblCIJY078aK9ZLWIJIHew3hkek8zR?=
 =?us-ascii?Q?jpt2mh5v8UNV7mYC0geS5WW5C+C8RNjfvBhQSkS9wdsMeoOijEK5naGDwvut?=
 =?us-ascii?Q?t69AkDW1mTruuOvyV9bdURYRosMEwE2f46kUos2X4E9ZXZUJsrijg85PGzdB?=
 =?us-ascii?Q?3sPsfYBk7fD74ARUl2tCuuYyQxEwfQRgr8NEPG7U8qAWELdsBXhdi598wOI2?=
 =?us-ascii?Q?imY94SxJg95s4ipsRfZnA9fwwh9caXj3DIlz86Ng64Do3HERt4lc6bvTiW90?=
 =?us-ascii?Q?YAcCSQDUnFVeaJvdWVkj+cSOVW2/C8iwJ5AGNUjJPM8MctXcQmboI7PTXA8t?=
 =?us-ascii?Q?/WCIsCnzPj+1CCZdfHHO1G53KClR1MxLh/hJnfiQT/Es45oVWqA8Gi4ow2ay?=
 =?us-ascii?Q?AMZb9F1O1iHKZe0GhCMBsHHPTuIc8Wlh8Y0lhRbhIq28M7gk1WQYT0N6hOTu?=
 =?us-ascii?Q?PbOeuvcVLUcoW5mP5XQFXAL/3GzLIJ48tnZulVaZCCxHvuCml6P6opDgKX/D?=
 =?us-ascii?Q?HAJbVTg5q+uMezZXBVhbbsExMwgaGWJN8NoO04PRKnMJIdCEQSdzto5Ggs8f?=
 =?us-ascii?Q?RYxCtrT6DsySzVnvMkyKjhZi//FgkCClQMWB+MHniaePVPGmBi469xW+b5MF?=
 =?us-ascii?Q?l9bQUdHrp8fCKrGss2/D+Yp96D1LxjapXUqNEdzzgfOakO3GYHzRjuZ7C2+d?=
 =?us-ascii?Q?jIqgA6VqMzywNtKsvYJk+8rnVNDYaspa4pheiUro3OJnLIfDk0Ly+INLdbYm?=
 =?us-ascii?Q?O6/i6LTRCfj1Dao+Hyw54ZpkHXXmrEQYTBTUXNjGwv1cL1pCdHZkTQJHkfIT?=
 =?us-ascii?Q?qwEEYW7ZTfWWOtigLhhANRgNYIQ3ZVx+x6uML7x80layX8DZb0+oIttE8PbP?=
 =?us-ascii?Q?xO9nsIFQPjGkhfJsLlI9bQ2H/PQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <46117CC40C7E7A48A5C87D7AF370E363@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f04dd6-0453-40f1-382a-08d9e00fe776
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2022 14:35:16.1114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A8NrTmS9vIO5JgqoPCjMUMGkw6Kkj3aDRIzmyi+FSHSGY2dOYyos7VwEaLbD2n6R697hPoVd7x6GO7PpG3F/vCQ9ek+0arGPnNOCTIe6z3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7268
X-Proofpoint-GUID: VOpm3G-odBmNOLEXo2O4SDGFtaBP79aI
X-Proofpoint-ORIG-GUID: VOpm3G-odBmNOLEXo2O4SDGFtaBP79aI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-25_02,2022-01-25_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=603 bulkscore=0
 phishscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201250094

On Mon, Jan 24, 2022 at 02:14:43PM -0800, Stefano Stabellini wrote:
> On Mon, 24 Jan 2022, Julien Grall wrote:
> > On 24/01/2022 19:06, Stefano Stabellini wrote:
> > > It looks like XEN_DOMCTL_host_node_by_path and
> > > XEN_DOMCTL_find_host_compatible_node would also solve the problem but=
 I
> > > think that a single hypercall that retrieves the entire host DTB woul=
d
> > > be easier to implement
> >=20
> > DOMCTL should only be used to handle per-domain information. If we want=
 to
> > create a new sub-hypercall of either __HYPERVISOR_platform_op or
> > __HYPERVISOR_sysctl_op (not sure which one).
> >=20
> > AFAICT, both are versioned.
> >=20
> > > and more robust in the long term. >
> > > hypfs has the advantage that it would create an interface more simila=
r
> > > to the one people are already used to on Linux systems
> > > (/proc/device-tree). xl/libxl would have to scan the whole hypfs tree=
,
> > > which intuitively I think it would be slower.
> >=20
> > Even if you have the binary blob, you would still have to scan the
> > device-tree. That said, it is probably going to be potentially a bit fa=
ster
> > because you have less hypercall.
> >=20
> > However, here this is a trade-off between memory use and speed. If you =
want
> > speed, then you may have to transfer up to 2MB every time. So the quest=
ion is
> > do we care more about speed or memory usage?
> >=20
> > > Also the feature might be
> > > harder to implement but I am not sure.
> > >=20
> > > I don't have a strong preference and this is not a stable interface (=
we
> > > don't have to be extra paranoid about forward and backward
> > > compatibility). So I am fine either way. Let's see what the others th=
ink
> > > as well.
> >=20
> > My preference would be to use hypfs as this is cleaner than exposing a =
blob.
>=20
> That's also fine by me. Probably the hypfs implementation shouldn't be
> much more difficult than something like
> XEN_DOMCTL_host_node_by_path/XEN_DOMCTL_find_host_compatible_node.
>=20
>=20
> > However, are we sure we can simply copy the content of the host Device-=
Tree to
> > the guest Device-Tree for SCMI? For instance, I know that for device
> > passthrough there are some property that needs to be altered for some d=
evices.
> > Hence, why it is not present. Although, I vaguely recalled to have writ=
ten a
> > PoC, not sure if it was posted on the ML.
>=20
> The SCMI node cannot be copied "as is" from host to guest. It needs a
> couple of changes but they seem feasible as they are limited to the
> channels exposed to the guest. (The generic device passthrough case is a
> lot more difficult.)


Hi Stefano,

What I'm thinking about is do we actually need to create SCMI node in DomU =
device-tree?
I have this question is because we don't need SCMI node to be present in Do=
mU=20
device-tree if it has no passed-through devices, which are using scmi.=20
So if we don't have passed-through devices or do not provide DomU partial d=
evice-tree=20
in config, then there is no need to create SCMI node.

For now I see the following possible domu configurations:
1) If DomU has a lot of passed-through devices and it's easier to inherit=20
host device-tree and disable not passed-through devices.
Partial device tree will looks like this:

#include "r8a77961-salvator-xs.dts" //include host device tree

/
{
	soc {
		...
	}

};

// Disable non passed-through devices
&hscif {
	status =3D "disabled";
};

In this case DomU partial device-tree will inherit arm,scmi-smc and=20
arm,scmi-shmem nodes and all clock/reset/power-domains which are using scmi=
.=20
All this nodes can be copied to DomU device-tree from partial device-tree.

2) DomU has few passed-through devices, so it's easier to add the device no=
des=20
to the passthrough node of DomU partial device-tree.
DomU partial device-tree will look like this:
{
	scmi_shmem: scp-shmem@0x53FF0000 {
		compatible =3D "arm,scmi-shmem";
		reg =3D <0x0 0x53FF0000 0x0 0x10000>; =20
	};
	scmi {
		arm,smc-id =3D <....>;
		compatible =3D "arm,scmi-smc";=20
		shmem =3D <&scmi_shmem>;
		scmi_clock: protocol@14 {
			...
		};
		scmi_reset: protocol@16 {
			...
		};
	};=20
	passthrough {
		hscif0: serial@e6540000 {=20
			compatible =3D "renesas,hscif-r8a77961";
			scmi_devid =3D <5>;
			clocks =3D <&scmi_clock 5>;
			resets =3D <&scmi_reset 5>;
 			...
		};
	};
};

As you can see in this case we have to manually copy arm,scmi-shmem and=20
arm,scmi-smc nodes with hscif0 node or the device-tree compilation will fai=
l.
We can use 0x53FF0000, provided in arm,scmi-shmem node and map domain chann=
el=20
to this address and copy scmi related nodes to the DomU device-tree.
This is useful when we need to expose only certain protocols to the DomU.=20
Also it's easy to modify DomU scmi node, as we need for stm32mp1 for exampl=
e=20
when different smc-id should be set for DomU.

3) DomU doesn't have any passthrough nodes, which are using scmi.
In this case we don't want SCMI nodes to be in the DomU device-tree.

I see only one use-case when we may need scmi nodes to be generated by xl i=
n=20
DomU device-tree:
Xen generates psci node to handle cpu_on and cpu_off.=20
According to the Section 4.3.2.5 of the DEN0056C [1]:
> For these power domains, this protocol can be used to implement PSCI CPU_=
SUSPEND, CPU_ON, CPU_FREEZE, CPU_DEFAULT_SUSPEND and CPU_OFF functions.

So in theory psci node can use scmi to control cpu state. But this is not o=
ur=20
use-case because we don't want to give DomU ability to stop physical CPU.=20
Xen can't intercept and handle CPU_ON and CPU_OFF requests when mailbox tra=
nsport=20
is used for SCMI communication.

[1] "SCMI Specification DEN0056C," [Online]. Available: https://developer.a=
rm.com/documentation/den0056/latest=20

Best regards,
Oleksii.

