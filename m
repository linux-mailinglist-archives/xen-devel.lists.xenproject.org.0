Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E762349EA2A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 19:12:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261688.453304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD9FN-0006hX-23; Thu, 27 Jan 2022 18:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261688.453304; Thu, 27 Jan 2022 18:11:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD9FM-0006f1-V7; Thu, 27 Jan 2022 18:11:48 +0000
Received: by outflank-mailman (input) for mailman id 261688;
 Thu, 27 Jan 2022 18:11:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OqAq=SL=epam.com=prvs=3026f1f2df=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nD9FL-0006eu-0f
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 18:11:47 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 952bf4db-7f9c-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 19:11:44 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20RGjMxw024158;
 Thu, 27 Jan 2022 18:11:41 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3duy6n0adh-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 18:11:41 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AM0PR03MB5057.eurprd03.prod.outlook.com (2603:10a6:208:108::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 18:11:35 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::711f:a15e:91c1:6d43]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::711f:a15e:91c1:6d43%4]) with mapi id 15.20.4930.015; Thu, 27 Jan 2022
 18:11:33 +0000
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
X-Inumbo-ID: 952bf4db-7f9c-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YgGewTgBgKSpRFGow3/7MvlFiVkk3jKIflnG7F7s/qXhYD3ZAxAG5KEVk0ulQjJxrvoEuT8egzz6MS2BNyNe4cYK+d2yLmI4vRTNS+xh/ij3XYK+orI8Vlv/VnyQ9PFbneq6EUOSEmM9v2mb9LCsQhkGEAjinAzIOxRyxAdvuwb4GMmz/PUzHOAc94J8vBaYdcECCf5Ww9TT1ZTTtm8sCXgPfH8OaMM1WD063F4TLOddM53RI1BMITP0NCmG7ukWHGOi98eYv95wxfcsVoPUi+dukAIbxD50KkVyQC312DTTWrV4Svo7zfCguez7SuUHFUF5oTs3euHj6F2a/q1Ckg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDJsrAySHBWKqPNTbFsG4+WCaf3I2MPm8vprHWNjg/o=;
 b=X1LmD6aslwkj9WyjK0b6GAQp4+5eAbRsl9MEkhY/F0eOITNItm8pt62yzKVYVGGznz8i0sR6wz/ak37VTg7DG4VXCA0aBKlzT7Ikl0qHBThOoqARMYckpdksmwwqFJZYrPjlMVrz9olTgcgzEBXC8E+V6S23sZ8TMS2nIwKjz1ptMZxdfYhoSSPm30ID799X3hR+Ptr7O1qInUxBqaFFsQgn59EyE2VSPojaaKskwWpRnBAL3ERAaaF3UzqH1qhA+uxMUEkPErx/MPR+jjlypDbgyRrKLaBVDXLEVP0D4iozl6uCfZe5YSsrnKl7yWO8+bm4vujqd9Q1RjyQs5wTCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDJsrAySHBWKqPNTbFsG4+WCaf3I2MPm8vprHWNjg/o=;
 b=QeOGFtCcgZcSeucivGSJv8r2b6sPdBaFDzOv5Bf4AGKRbGhoDhr+23XPaXVnyRHyy2z86n8rKkCLg9hP9U+YDU7BpJAr1t7FjbbVLvrBG2ZabseFeuqOTHXWilPnrEs+bcUDcixdjN4jkbywxHhha90ShxayjK2WoBm7cVDcOmJzKzrNX+NNoNB36BqIGQA9UhDIQB50mkHTko9DtSi7InRSVEyMCSLfj/DQNs6lgX9SgdXdZHuDuRDieF0IKJuwtz2YVMKFyvo+CROqYSLb37uei2xFuz5z3fPZ/NrivxDp+CidOiH+cfD4s0H1BNyjucdtV3L659tDHpkbWsLAPw==
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
 AQHX8M3JF7Ng56/tV0+8/7pODiaWfKw3iHyAgAQwJICAAG+xgIABQZuAgAAWSACAAOV/AIABANAAgCsRKgCAAOC8gIAAlQqAgADLX4CAARblgIAAX5CAgASN5YCAAAwYAIAABamAgAAvCoCAARH1gIAAcQYAgALwEgA=
Date: Thu, 27 Jan 2022 18:11:33 +0000
Message-ID: <20220127181132.GA149448@EPUAKYIW015D>
References: <20220120102147.GA4153317@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2201201230480.27308@ubuntu-linux-20-04-desktop>
 <20220121150753.GA898010@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2201211236060.27308@ubuntu-linux-20-04-desktop>
 <20220124182249.GA2485483@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2201241056290.27308@ubuntu-linux-20-04-desktop>
 <d5c84296-79a6-5698-802d-4d9ba60dbf24@xen.org>
 <alpine.DEB.2.22.394.2201241403240.27308@ubuntu-linux-20-04-desktop>
 <20220125143515.GA2803662@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2201251245120.27308@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2201251245120.27308@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c66e833c-04d6-401b-22d0-08d9e1c07355
x-ms-traffictypediagnostic: AM0PR03MB5057:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB505795145CD25E6A65160064E3219@AM0PR03MB5057.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 RaEOAUOfFa5PpRRpl4Z0A6z1bhNeEhSsUjZEEvwLb686l1QQyS0kqM3Me04SuxTeupW6MteCBjU8H3AikSRbPdsLC+o3ysuxcVWijg+1YTN+WcInJDF2swNMZwCWkPy/hpGZ5cGqHSJNg/WDHULQk5CKzdthyUV1LbjeTKh9nzFFgb3GL0/wJ5NjqnMEP/45L1xZNrERBgKmrukowoRIZ8AmcmBycpSv2R1Uf6z6PQ1oMU/05N9HB3uIZ51K0ue1Nc/rC5h2jGeBm9u3+hboCSIERKjusI5cyBBBeyagsdArY01nCBC2v1+TBpSEfa/v69eNpl5T4rHWzPR6ycceROJzIMd1ib0ZwOOg/+Lp5aXbWIYTQUr7ZTLfRJSLpnR7QkVJPzucKe2rrzCmALy53AWA3PrYHmFhnAtSBtJ6ScRqyHx926Bo9a6BFfhjnWfel0cVqZmHtea7CYBCT12IvhOS76tlDftZCHNREU9C3U4GNmmcaFRnfHNN3uYlrRWR8BaxzU+vAvnIVczNRQVqB+sI2exPy6EUNpBaH9tF4dBKkbzMaD9H+i2oQ9Adu0i1BVHjUT/l447ld90KtCiA4dBJboYt65fPxEgdUeqA47D73XpqHFih/vmFDnSI6rEyGhzzjioX7hdimokcQawxDMrnMEjGYKcCTgp6OER1ByyIT4srU2o4t+oO/oQxgbICravwjcwhdU2Fj46nDDDnAUlNxuq6HmAQgHGMGJFm7RRWFfv24G6kbSFJHIgh1XBsclDh8AMcJCeQI+Io2fAIS1J0uRMpYx7tk0PUJe8tYXk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(66946007)(76116006)(66556008)(64756008)(66446008)(66476007)(8936002)(8676002)(5660300002)(54906003)(38100700002)(33656002)(4326008)(71200400001)(122000001)(2906002)(91956017)(316002)(6916009)(9686003)(6486002)(33716001)(6512007)(6506007)(83380400001)(186003)(508600001)(1076003)(38070700005)(26005)(53546011)(966005)(86362001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?iRd+UOgtQABxK5ssrwU2Io1Rc4oSTty8MrPDCCwfVpt57qXiXVJHEQETpC+Q?=
 =?us-ascii?Q?I+O1Yb/fCymdqhuPL3pUgrZpnjcVNDhY3yKuVgtFpyo1j8cuDFC+hzKJRkr1?=
 =?us-ascii?Q?KTNtOkFl0yx3pnsdI1vu8ZmiHywEZQgNuozqcoWYXTbDliRS4hhNcgJQg5Ca?=
 =?us-ascii?Q?XtFKeoKJh6rkBUJH7ryONLOnnwqtlaGnHe4gHWur3ZdK/mexR1drGYkFl6zM?=
 =?us-ascii?Q?FfbtR+xoxAFBVM55oRoZgMd/HhPw5JnAPi4lFJh5XzyzFlgLejBh1jV8KmgW?=
 =?us-ascii?Q?OhP3+6NLtbFEXtLdq6FpcTzyoGYU7ykkWP0LSaCiCD9ML1X1p70VweG6GywK?=
 =?us-ascii?Q?8ZMqqnErKip4hq7FlsQddwSd3++vO+xIe7iCnktzTsuFVVT2uHHXWn9jRbFW?=
 =?us-ascii?Q?Tv2k++0wpHTUFGpYp+eRRZvY1k1d6NLwp9Ahg6btIl9stD9zmxWF2i0e+Fu7?=
 =?us-ascii?Q?uA5LfZdKOgIp+/FJKaskaYxWmamYKLVo7HzjQf53+DoGUgUAa8nr37rPYQzW?=
 =?us-ascii?Q?nPPvzdbaWLc6Oo01x/I5gi73WNeK8O+zwAFPBwWzf5JbiP3qONgcHtSSinIJ?=
 =?us-ascii?Q?zCaknCewyYHm1HfQUAVlZapt2CHl5MW2wufeV+JEe8wMzrjjCVvu3gz7hCLe?=
 =?us-ascii?Q?9ojPXmbML6BxAG1h27LBCPGL96q9Y2eCK6Dfxr6FsJBFSpUgSXCENxpjNtp8?=
 =?us-ascii?Q?yxhYDJTdzkT+gkoSObqsqED2+kzbubASLdGRySxHgBpslB/dP5XrZmSET/Ji?=
 =?us-ascii?Q?/XKP+jMeWmVlZGBwttK5rbh/RW0zgUmgyhWFUSWMlaod/xNG9tpjgNijjdwR?=
 =?us-ascii?Q?sjduobVPpBi9az89bj7AfQjp6NEf1c7gaupBdi4K8NOm9pQUly3gBNdnl1Tg?=
 =?us-ascii?Q?JU4QAyFQAzRZqRJXXfqEYra0k9mJ06Vnj6bVr5x4/2jGX5yMHTdI8yT68m6K?=
 =?us-ascii?Q?2bJ9I5NeQ5ahDFWSTBct2OOnLgpjoyofe8bXN7rLh1Tg8Bn+jOCk6h8aBP36?=
 =?us-ascii?Q?D10tHdV7+OVwFH0+U02K9oZ43N9pzJTHJsZEiXCXs+1WGe4eAHW8L3s/8zvA?=
 =?us-ascii?Q?L3+RMeM90s7sZVp+vBtr7O/wN1hPU4gwovnmLolzSJWg9Fci9ONBHQ7rXnfa?=
 =?us-ascii?Q?tYJA+sdsvee9yfIbIwcZ1OOuupLYnNwAWVFWMjIiwl/yQHN6Im5yAJgPva/k?=
 =?us-ascii?Q?tCM3sZEe0thvPDd7hVikl5PLTgMhkxTdF92UsTfxzwVoRfIT0yI/uNiaGjsp?=
 =?us-ascii?Q?pFuj0vL6tIn5wDcV0Emh9AeDjxCZjoyfRaknyiyka/mGID2ktkEL8gDqu6NH?=
 =?us-ascii?Q?HaZJRZmU1b+5GXouijCNjLsBu0ViKtrMD5QnP1JYYHapN/CZ7W0ScBFOjIw/?=
 =?us-ascii?Q?ag70rlwtPmElhT6EAC7q5FsyTv41ZYTOTvLTQiqtUDI8A8MxSMsMQimwn1JI?=
 =?us-ascii?Q?sM22qxomIDbQlSSE8nm7ElJroXy2QVp9o20YVl6U/jQ6mETo6jo84/+plz62?=
 =?us-ascii?Q?vfUTxDa29n5HFobkfQ6wDC/fKFVvx8ceq5X0zTdXtydvJVKHyU5XBHxVCViq?=
 =?us-ascii?Q?+laSWBETKmp2/7jgCpl4mCZLfhbTTZ7uFQ253d+OOweTMfBP1YbNTcsZLdeC?=
 =?us-ascii?Q?IoOhsQGO5g5WVyEzwDUBL9K5FThGjxYghDJdr6GalkGDBskrxO4Htx5hL2Rc?=
 =?us-ascii?Q?UUmRJz3tZwQXj2QNG9/737W9Lt8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C26942C880AC7A48B26D034D5C37A3F8@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c66e833c-04d6-401b-22d0-08d9e1c07355
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2022 18:11:33.3784
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6v+A8Fm4xjvJzA/d0N/VuZtJLCCSU4kHArrahzPZr2GrZQ2Eh8zzB0I0SmAZfip1LCMlgevMvdQ3KXHyNzs/uT+Cv2IezIiyj6mFDebgJwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5057
X-Proofpoint-ORIG-GUID: MqJApzUtF7ZFnWq6qfE60B5EFiKdKsfY
X-Proofpoint-GUID: MqJApzUtF7ZFnWq6qfE60B5EFiKdKsfY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_03,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxlogscore=788 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201270105

On Tue, Jan 25, 2022 at 01:19:46PM -0800, Stefano Stabellini wrote:
> On Tue, 25 Jan 2022, Oleksii Moisieiev wrote:
> > On Mon, Jan 24, 2022 at 02:14:43PM -0800, Stefano Stabellini wrote:
> > > On Mon, 24 Jan 2022, Julien Grall wrote:
> > > > On 24/01/2022 19:06, Stefano Stabellini wrote:
> > > > > It looks like XEN_DOMCTL_host_node_by_path and
> > > > > XEN_DOMCTL_find_host_compatible_node would also solve the problem=
 but I
> > > > > think that a single hypercall that retrieves the entire host DTB =
would
> > > > > be easier to implement
> > > >=20
> > > > DOMCTL should only be used to handle per-domain information. If we =
want to
> > > > create a new sub-hypercall of either __HYPERVISOR_platform_op or
> > > > __HYPERVISOR_sysctl_op (not sure which one).
> > > >=20
> > > > AFAICT, both are versioned.
> > > >=20
> > > > > and more robust in the long term. >
> > > > > hypfs has the advantage that it would create an interface more si=
milar
> > > > > to the one people are already used to on Linux systems
> > > > > (/proc/device-tree). xl/libxl would have to scan the whole hypfs =
tree,
> > > > > which intuitively I think it would be slower.
> > > >=20
> > > > Even if you have the binary blob, you would still have to scan the
> > > > device-tree. That said, it is probably going to be potentially a bi=
t faster
> > > > because you have less hypercall.
> > > >=20
> > > > However, here this is a trade-off between memory use and speed. If =
you want
> > > > speed, then you may have to transfer up to 2MB every time. So the q=
uestion is
> > > > do we care more about speed or memory usage?
> > > >=20
> > > > > Also the feature might be
> > > > > harder to implement but I am not sure.
> > > > >=20
> > > > > I don't have a strong preference and this is not a stable interfa=
ce (we
> > > > > don't have to be extra paranoid about forward and backward
> > > > > compatibility). So I am fine either way. Let's see what the other=
s think
> > > > > as well.
> > > >=20
> > > > My preference would be to use hypfs as this is cleaner than exposin=
g a blob.
> > >=20
> > > That's also fine by me. Probably the hypfs implementation shouldn't b=
e
> > > much more difficult than something like
> > > XEN_DOMCTL_host_node_by_path/XEN_DOMCTL_find_host_compatible_node.
> > >=20
> > >=20
> > > > However, are we sure we can simply copy the content of the host Dev=
ice-Tree to
> > > > the guest Device-Tree for SCMI? For instance, I know that for devic=
e
> > > > passthrough there are some property that needs to be altered for so=
me devices.
> > > > Hence, why it is not present. Although, I vaguely recalled to have =
written a
> > > > PoC, not sure if it was posted on the ML.
> > >=20
> > > The SCMI node cannot be copied "as is" from host to guest. It needs a
> > > couple of changes but they seem feasible as they are limited to the
> > > channels exposed to the guest. (The generic device passthrough case i=
s a
> > > lot more difficult.)
> >=20
> >=20
> > Hi Stefano,
> >=20
> > What I'm thinking about is do we actually need to create SCMI node in D=
omU device-tree?
> > I have this question is because we don't need SCMI node to be present i=
n DomU=20
> > device-tree if it has no passed-through devices, which are using scmi.=
=20
> > So if we don't have passed-through devices or do not provide DomU parti=
al device-tree=20
> > in config, then there is no need to create SCMI node.
> >=20
> > For now I see the following possible domu configurations:
> > 1) If DomU has a lot of passed-through devices and it's easier to inher=
it=20
> > host device-tree and disable not passed-through devices.
> > Partial device tree will looks like this:
> >=20
> > #include "r8a77961-salvator-xs.dts" //include host device tree
> >=20
> > /
> > {
> > 	soc {
> > 		...
> > 	}
> >=20
> > };
> >=20
> > // Disable non passed-through devices
> > &hscif {
> > 	status =3D "disabled";
> > };
> >=20
> > In this case DomU partial device-tree will inherit arm,scmi-smc and=20
> > arm,scmi-shmem nodes and all clock/reset/power-domains which are using =
scmi.=20
> > All this nodes can be copied to DomU device-tree from partial device-tr=
ee.
>=20
> This is an almost dom0 configuration. For this kind of use-cases, I
> think it is enough to handle dom0 automatically correctly. I wouldn't
> ask for anything more than that.
>=20
>=20
> > 2) DomU has few passed-through devices, so it's easier to add the devic=
e nodes=20
> > to the passthrough node of DomU partial device-tree.
> > DomU partial device-tree will look like this:
> > {
> > 	scmi_shmem: scp-shmem@0x53FF0000 {
> > 		compatible =3D "arm,scmi-shmem";
> > 		reg =3D <0x0 0x53FF0000 0x0 0x10000>; =20
> > 	};
> > 	scmi {
> > 		arm,smc-id =3D <....>;
> > 		compatible =3D "arm,scmi-smc";=20
> > 		shmem =3D <&scmi_shmem>;
> > 		scmi_clock: protocol@14 {
> > 			...
> > 		};
> > 		scmi_reset: protocol@16 {
> > 			...
> > 		};
> > 	};=20
> > 	passthrough {
> > 		hscif0: serial@e6540000 {=20
> > 			compatible =3D "renesas,hscif-r8a77961";
> > 			scmi_devid =3D <5>;
> > 			clocks =3D <&scmi_clock 5>;
> > 			resets =3D <&scmi_reset 5>;
> >  			...
> > 		};
> > 	};
> > };
> >=20
> > As you can see in this case we have to manually copy arm,scmi-shmem and=
=20
> > arm,scmi-smc nodes with hscif0 node or the device-tree compilation will=
 fail.
> > We can use 0x53FF0000, provided in arm,scmi-shmem node and map domain c=
hannel=20
> > to this address and copy scmi related nodes to the DomU device-tree.
> > This is useful when we need to expose only certain protocols to the Dom=
U.=20
> > Also it's easy to modify DomU scmi node, as we need for stm32mp1 for ex=
ample=20
> > when different smc-id should be set for DomU.
>=20
> I think this is the most interesting case that should be automated and
> not require manual intervention. Let me explain why.
>=20
> Currently we require partial device trees to be manually written because
> there is no easy way to automatically generate them. (I have some ideas
> on how to automatically generate partial device trees but that is a
> separate discussion.)
>=20
> Unfortunately, it has become increasingly clear that it is too difficult
> for users (even advanced users!) to come up with the appropriate partial
> device trees. Thus, I am reluctant to introduce more things that rely on
> the user having to manually specify partial device tree information.
> This is why I would like the SCMI nodes to be automatically added for
> domUs.
>=20
> Of course, if a user provides the scmi and scmi_shmem nodes in the
> partial device tree we could just use them. But ideally we should also
> be able to automatically generated them based on the host device tree
> nodes, so that the user only needs to provide serial@e6540000 (in your
> example, scmi_devid would need to be populated too) and the rest would
> be done automatically as we do today for the gic and vuart nodes.
>=20
> At the same time I don't want to scope-creep this patch series too much
> and I don't mean to ask you to add a huge new infrastructure to Xen and
> the Xen tools just to get SCMI support in. I would rather have a
> not-great automatic generation of the domU SCMI nodes than nothing (e.g.
> using your suggested XEN_DOMCTL_host_node_by_path and
> XEN_DOMCTL_find_host_compatible_node hypercalls althought they would
> need to be platform_op as Julien suggested).
>=20
> It looks like the generation of scmi_shmem and scmi should be easy
> enough that could be handled without difficulty in xl/libxl. But if that
> turns out to be too difficult, we could have a small independent
> bash/python script that from the host device tree generates the partial
> device tree with the SCMI nodes. From Xen point of view we are would
> still be using the partial device tree, but the partial device tree
> itself would be generated instead of manually written. As this workflow
> requires a separate tool I think it is a worse option than the one
> above. Still better than nothing though.
>=20
Hi Stefano,

Thank you for the detail answer. I went through hypfs and will try to
export host device_tree. Then xl will be able to use hypfs data to
generate arm,scmi-smc node if arm,scmi-smc node was not provided in
DomU partial device-tree. Unfortunately, some changes should be done
to hypfs because it seems not ready to handle nested dynamic dirs.

I'll see if I can update hypfs without breaking the original
functionality. If not, I will have to create all hypfs dir structure on
start. For now I'm working on making dynamically created hypfs tree
structure, based on host device-tree.

Best regards,
Oleksii.
>=20
> > 3) DomU doesn't have any passthrough nodes, which are using scmi.
> > In this case we don't want SCMI nodes to be in the DomU device-tree.
> >=20
> > I see only one use-case when we may need scmi nodes to be generated by =
xl in=20
> > DomU device-tree:
> > Xen generates psci node to handle cpu_on and cpu_off.=20
> > According to the Section 4.3.2.5 of the DEN0056C [1]:
> > > For these power domains, this protocol can be used to implement PSCI =
CPU_SUSPEND, CPU_ON, CPU_FREEZE, CPU_DEFAULT_SUSPEND and CPU_OFF functions.
> >=20
> > So in theory psci node can use scmi to control cpu state. But this is n=
ot our=20
> > use-case because we don't want to give DomU ability to stop physical CP=
U.=20
> > Xen can't intercept and handle CPU_ON and CPU_OFF requests when mailbox=
 transport=20
> > is used for SCMI communication.
> >=20
> > [1] "SCMI Specification DEN0056C," [Online]. Available: https://urldefe=
nse.com/v3/__https://developer.arm.com/documentation/den0056/latest__;!!GF_=
29dbcQIUBPA!k5oB4BpbIN-hU5jrWvNy9FLXi3Kavu3qTr5lESjK8NnlS261E0Nuqg2_pUQWxb2=
hDdLa$ [developer[.]arm[.]com]=20
>=20
> I agree with you on this one; I am not worried about this case.=

