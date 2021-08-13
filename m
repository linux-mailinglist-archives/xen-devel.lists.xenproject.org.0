Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AA73EB364
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 11:39:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166702.304268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mETeO-0008M6-83; Fri, 13 Aug 2021 09:38:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166702.304268; Fri, 13 Aug 2021 09:38:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mETeO-0008JV-3r; Fri, 13 Aug 2021 09:38:52 +0000
Received: by outflank-mailman (input) for mailman id 166702;
 Fri, 13 Aug 2021 09:38:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=USBj=NE=epam.com=prvs=885989f52f=roman_skakun@srs-us1.protection.inumbo.net>)
 id 1mETeL-0008JP-QV
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 09:38:50 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31cbcf73-e85f-4398-af2c-057d41692d3c;
 Fri, 13 Aug 2021 09:38:46 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17D9aCuV003545; Fri, 13 Aug 2021 09:38:43 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55])
 by mx0a-0039f301.pphosted.com with ESMTP id 3admgc8j03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Aug 2021 09:38:43 +0000
Received: from AM7PR03MB6593.eurprd03.prod.outlook.com (2603:10a6:20b:1b4::10)
 by AM6PR03MB5559.eurprd03.prod.outlook.com (2603:10a6:20b:f3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Fri, 13 Aug
 2021 09:38:39 +0000
Received: from AM7PR03MB6593.eurprd03.prod.outlook.com
 ([fe80::ec7b:2795:206b:9411]) by AM7PR03MB6593.eurprd03.prod.outlook.com
 ([fe80::ec7b:2795:206b:9411%3]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 09:38:39 +0000
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
X-Inumbo-ID: 31cbcf73-e85f-4398-af2c-057d41692d3c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8/XH8z1zQGJfKGbhBYTdIkftBBPs3YJOR9+8CuvqOTSHUUfmp4BhxcMHbnAJkQnN25PvMIo9DrcNSCBFbTl2wFtFmiQl34yhAMo8jrDlRnvQjJAxO+MwGhJbs3QGi46neXNkPegW9Uk5U8etQaD6v8VeNag6NpE+wI1srJKttHdWtkuTjHeE9iCMYWPdn9P2fxynAkgsDGqPbI+Il42PQi1jiHb0zotxdl48Xa4PAQ8mGsD2B4WAeqT+waXZv6OINUL3ce6pdsuqrx8znewOJIGhPckYD/VeFFTo2qLJzBRwcenHU0Xn+xq0SFIyHsFjmlPKf6EoJazDh6Gwy9Evg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lzy7zXXYf7jTDgNIqezDGk9DuL+e8hsSodxBaXVur0s=;
 b=H6+rVH/2qYp4bzOuiyNEaVXcSO/O6Lb2XfAi05wE+DoSkAAfErU/B6LwQT1R9XmJ+MhhlW4IKg/h0oCX7b+aoKZwHBqgudCSgd5l3ZH8aLcWmKszQPcwSNi65rkACbSNVqAiD7fUzd69yhNahbdM3AMnVKRSTq6mVLCTC7ZdMbntaKE8L9rlI8q9XRUXhNlWXW0UsA0j0U8NtZ7nbYc16ZMhYFPRwWbq2q7oGPkfgJa5ihL6sInOiKOXYRGBm4HwDwbbRfi6I9TeQ0471IjDxdNdyCZrBGcUn2LaEg1LtBgXvtENMsXig3d7sZiCveeLbPYxwjvGkuyQtA5kbh0xrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lzy7zXXYf7jTDgNIqezDGk9DuL+e8hsSodxBaXVur0s=;
 b=ExKUoYFcUeA8J4mZdlhB2ReuKGkqTjS0hTUO1OfB58Tk5aebq8pwDChGuGbWgIH7n9Cg8ww5QEbwb63ddy5vLjZWXQ5Wj2dO4jtBdNF4Q9aa5l5nez0QU8/a9mmGsfSXOGQSGvlhqJ7hDdhyQkCikodsbpGLC8PzN1JPMl+zzQXbXwthJkfR2pz6SarzOUcvrZTgnX56cBumNGbJQLyMEJVa5uSfuX7R8kVCAUuTOYAlU/yCE8DZCJ6wenAHhAyi5BIqSvZQue5eZLct3T1P6bd/rIAJF1iOXbmdHYLtOroRo1PMIL0c25vxacTGjC7/EWAu4a+2JGunvK4WCvEF8Q==
From: Roman Skakun <Roman_Skakun@epam.com>
To: Julien Grall <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>,
        Andrii Anisov
	<Andrii_Anisov@epam.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Roman Skakun <rm.skakun@gmail.com>, Jan
 Beulich <jbeulich@suse.com>,
        Roman Skakun <Roman_Skakun@epam.com>
Subject: Re: Disable swiotlb for Dom0
Thread-Topic: Disable swiotlb for Dom0
Thread-Index: 
 AQHXjfwJK3kYIT7XAUWdmOu1AWm+tKts6kUAgAD/OfqAADJaAIAAJhCIgAArBQCAAqGMMQ==
Date: Fri, 13 Aug 2021 09:38:39 +0000
Message-ID: 
 <AM7PR03MB659376E041306352B583060185FA9@AM7PR03MB6593.eurprd03.prod.outlook.com>
References: 
 <AM7PR03MB6593B4461B99297C8650CF1C85F79@AM7PR03MB6593.eurprd03.prod.outlook.com>
 <060b5741-922c-115c-7e8c-97d8aa5f46f4@xen.org>
 <AM7PR03MB65932619505158E3930D8E8785F89@AM7PR03MB6593.eurprd03.prod.outlook.com>
 <d616081a-8c60-dcda-ac54-58c5be0c21ce@xen.org>
 <AM7PR03MB6593834BA54AD8A126EF872185F89@AM7PR03MB6593.eurprd03.prod.outlook.com>
 <691e31db-c79b-9196-53e1-cbbdc9bd3a54@xen.org>
In-Reply-To: <691e31db-c79b-9196-53e1-cbbdc9bd3a54@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7907af9-9951-4b61-6a0e-08d95e3e2178
x-ms-traffictypediagnostic: AM6PR03MB5559:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB5559D1D0E220D322E1EFD7E385FA9@AM6PR03MB5559.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gUyedQmKfi8V35jmlO9akksxfnJUhytX7xI2PGqoo6neHoLjj3vtachLYtmgobvfdO0WU400gOfSwksK2Ho/4/gzCruJR6hsO2XNSbm7d1EJ7u2p/O1EF1Ipl3VgobWDIDeC9x8q7MMnY5Yeb7PXx8SBiMqPJjWih1UgxYhpU/G32VpOvlHsVOvGgv5X+KnadT/vCmZiLzdlq6t67jW+SZIt6yMlT2709Wxxd2pwzRjddahxlMY4Id7AtYo6OtdGGG3l5xBXV0HGZSwQsOY4/DpqlW9sQ8i3ZGwJrXEMolELXwEETlzIobnn1s+0sySTbyGBaYDOnjpNqmoI6FsjlQ3LDkflRhJr9qMtD+VNBTWS91kHqPyFIl6NkFE5M5oMvpWIAKZvd9AVE187CEj5kYaK7jnPSaGhWsEGWEQ7WU5gzFGj383AgXeZ6LTH7Vf59v2aMg4o9+Nq5c/hexO2jE0FZ+ciRf2S/wv8gH5itrdKUHRJ5Zkq7Eza1tlrjJiBKAaEhYO/vZWVbM1I0kP3bPu+hkDYDdW9j3h6o/nkaJqXppQWnvji20A3oUO+3vyEQ2PYXnEC4nKw+8wU1VLDIG4ca92ZjC1fa8QCA61RMYbcug2Lek7+IRndYw1Y13E59edu3VqrHq+EiioEiNI/HUOaJB44LMLNJPO5/u2/hq3Tgey0AFnbIWQfHMBtnu9gyF3PRHBBxidWsC+npOxjig==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6593.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(4326008)(5660300002)(86362001)(19627405001)(55016002)(66556008)(26005)(64756008)(66946007)(83380400001)(71200400001)(66476007)(8676002)(8936002)(122000001)(66446008)(2906002)(38100700002)(478600001)(38070700005)(110136005)(54906003)(30864003)(6506007)(9686003)(53546011)(107886003)(76116006)(91956017)(7696005)(316002)(33656002)(186003)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ejpr9FnBvjnqnFi4FUyEGBXHZyI91g8MivSb9JbjimMaLuEH1+V95dFml/1j?=
 =?us-ascii?Q?tZN1p53SgpI8lYMLte1F9Qd2VBipSeJhiL7gdyz08SbEPp/xjPj4E+EYZ09P?=
 =?us-ascii?Q?Pcs78OGq8fQgeDLyK6Dj5ixDHOrm5VLFTurnuws44bGcarPqLUr54V3CJDbm?=
 =?us-ascii?Q?PZNEkCcBjgOTByckyhxsnDleobbqb6/DK889gjyZPQ/bbSWrRpVQtEVviFeN?=
 =?us-ascii?Q?Y5yG1vgzZr9xBjYr4WJEJFL7i14ppsAaypQbh82pyasEPEUIt6X8kGCULAl/?=
 =?us-ascii?Q?xI21T7/F+6E3DSKfwVUuKVGgMfpVMwE5FrrmMze9V2e/zd7cZJZzCXs7A78e?=
 =?us-ascii?Q?p7S7AICriGQzL7FxcAUBqG+KxlQxD61w0ApcMVRq94Oneod+Qe1RgV5DzdQ1?=
 =?us-ascii?Q?cyFY81zSFXkRdBU7MPyEbRMFnnAEl0LLVJ8awOyq9hLOPcTHZFZRZnixKKCw?=
 =?us-ascii?Q?bV/jTbf0DlTOnvOl92i0zOFJCV7mJsUYSnJSeV0W2axuIp3KBj5zJTBkUcFk?=
 =?us-ascii?Q?GAyESAUjofUFwa59fkhzIpkZHL25Q8FxVHc/DRpwsCzHqGKatXMDNr50CAcO?=
 =?us-ascii?Q?Dj5g+bmiKEx9mqTJQzXnj1zYjTqvJEFdmWn06obCE160yioq98e/zKJTH5KW?=
 =?us-ascii?Q?VJdH7JkpIWbsM895gc7Sy8psI5GvczDG6aAoPUCXlIt2GyxtJdq4w3JipccQ?=
 =?us-ascii?Q?yEJGuClyHDnrYs2rwvVmcjSCRBqH0Te6djvMP6KcojbTxEEO5xAFw+fKOLfv?=
 =?us-ascii?Q?6QbazlD4AaL24ns6wrrhDI2jmFZ66OwEcbsy3Kco/opnXyrsNsKcPvYelR1G?=
 =?us-ascii?Q?3Vw6G1x7F+vmczQIAzgeSqlRvPjItb8+b9cCajtjo8odiKKObYbwIW7ZKXZo?=
 =?us-ascii?Q?84VXOiKkKnwxIiyyb39Fwx1I4odVK6V8tyPLMtxeHHY/DQei1S3kP+s5wDag?=
 =?us-ascii?Q?zSar6k5QiMYVCw2QASMLi/WZyQiAwsulaW7K9bZ16qKtde97Phh2zBMj5pbz?=
 =?us-ascii?Q?ulxmYF2NKU2V4dk/ruAF9J1V9SWziwcihte7DioQCKBzwgAHy6huRo7U6pyW?=
 =?us-ascii?Q?8XYymnq4mXqxlZHLCIq/wiJvagqrZ08aI1XUMsTQN7K5pXOGfT+/S8gn4JFV?=
 =?us-ascii?Q?87E+qXwGHNpwxmXTcH0NKSPMIMAqXAFwpE1/gF2nbnp+pJI5a++47+OBtE/n?=
 =?us-ascii?Q?Y+WY75zMApXK25FE/GZkmPQhv4gd+bgL2HeohG2mcLoXrrAkwm0FsI6Lmg+N?=
 =?us-ascii?Q?jIYk3e96JVdSjIK0X7FMWR1iGWv85VsZIlf6Fh1FGpf2itHD0RZ8n8URASXf?=
 =?us-ascii?Q?yvQ=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AM7PR03MB659376E041306352B583060185FA9AM7PR03MB6593eurp_"
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6593.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7907af9-9951-4b61-6a0e-08d95e3e2178
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2021 09:38:39.1501
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bcd35lleqyZmcs3lRgMHV7cnD2iQEhJwPwvC+nGLcEbcsrJ8JbxcARmlo985b0D//yth7KZGbSRLtPYfIU6GEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB5559
X-Proofpoint-GUID: E7aXWfiBR3XWfIXHQPtyxFzsWmvc4vzY
X-Proofpoint-ORIG-GUID: E7aXWfiBR3XWfIXHQPtyxFzsWmvc4vzY
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-13_03:2021-08-12,2021-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108130057

--_000_AM7PR03MB659376E041306352B583060185FA9AM7PR03MB6593eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

> So 0xb6000000 is most likely the GFN used to mapped the grant from the do=
mU.
>
> swiotlb-xen on Arm will convert it to the MFN because it is not aware
> whether the device is behind an IOMMU.

If I'm understand right, it seems like that swiotlb-xen is not ready to wor=
k properly in case
when we retrieved MFN instead of proper GFN mapped to Dom0 memory.
Maybe you know some ideas to overcome this condition?

>  As the address is too high to be handled by the device, swiotlb will try
>  to bounce it. I think it is correct to bounce the page but I am not sure
>  why it can't. What the size of the DMA transaction?

The DMA map size is 3686400 bytes.

I've added several logs to swiotlb map_single() and see:
[  151.298455] <SWIOTLB> swiotlb_tbl_map_single() origin_addr: 64af97000, n=
eeded: 708,
avail: 7fc0, stride: 2, index: 4160

It's expected because:
....
[  259.468006] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31742]=3D2 sl=
ots < 708 nslots. Continue...
[  259.477070] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31744]=3D80 s=
lots < 708 nslots. Continue...
[  259.486229] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31746]=3D7e s=
lots < 708 nslots. Continue...
[  259.495387] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31748]=3D7c s=
lots < 708 nslots. Continue...
[  259.504546] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31750]=3D7a s=
lots < 708 nslots. Continue...
[  259.513704] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31752]=3D78 s=
lots < 708 nslots. Continue...
[  259.522863] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31754]=3D76 s=
lots < 708 nslots. Continue...
[  259.532021] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31756]=3D74 s=
lots < 708 nslots. Continue...
[  259.541179] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31758]=3D72 s=
lots < 708 nslots. Continue...
[  259.550338] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31760]=3D70 s=
lots < 708 nslots. Continue...
[  259.559496] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31762]=3D6e s=
lots < 708 nslots. Continue...
[  259.568660] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31764]=3D6c s=
lots < 708 nslots. Continue...
[  259.577813] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31766]=3D6a s=
lots < 708 nslots. Continue...
[  259.586972] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31768]=3D68 s=
lots < 708 nslots. Continue...
[  259.596130] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31770]=3D66 s=
lots < 708 nslots. Continue...
[  259.605289] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31772]=3D64 s=
lots < 708 nslots. Continue...
[  259.614447] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31774]=3D62 s=
lots < 708 nslots. Continue...
[  259.623606] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31776]=3D60 s=
lots < 708 nslots. Continue...
[  259.632764] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31778]=3D5e s=
lots < 708 nslots. Continue...
[  259.641922] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31780]=3D5c s=
lots < 708 nslots. Continue...
[  259.651081] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31782]=3D5a s=
lots < 708 nslots. Continue...
[  259.660239] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31784]=3D58 s=
lots < 708 nslots. Continue...
[  259.669398] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31786]=3D56 s=
lots < 708 nslots. Continue...
[  259.678563] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31788]=3D54 s=
lots < 708 nslots. Continue...
[  259.687714] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31790]=3D52 s=
lots < 708 nslots. Continue...
[  259.696873] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31792]=3D50 s=
lots < 708 nslots. Continue...
[  259.706032] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31794]=3D4e s=
lots < 708 nslots. Continue...
[  259.715190] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31796]=3D4c s=
lots < 708 nslots. Continue...
[  259.724348] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31798]=3D4a s=
lots < 708 nslots. Continue...
[  259.733507] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31800]=3D48 s=
lots < 708 nslots. Continue...
[  259.742665] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31802]=3D46 s=
lots < 708 nslots. Continue...
[  259.751824] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31804]=3D44 s=
lots < 708 nslots. Continue...
[  259.760982] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31806]=3D42 s=
lots < 708 nslots. Continue...
[  259.770141] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31808]=3D40 s=
lots < 708 nslots. Continue...
[  259.779299] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31810]=3D3e s=
lots < 708 nslots. Continue...
[  259.788466] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31812]=3D3c s=
lots < 708 nslots. Continue...
[  259.797615] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31814]=3D3a s=
lots < 708 nslots. Continue...
[  259.806774] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31816]=3D38 s=
lots < 708 nslots. Continue...
[  259.815933] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31818]=3D36 s=
lots < 708 nslots. Continue...
[  259.825091] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31820]=3D34 s=
lots < 708 nslots. Continue...
[  259.834249] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31822]=3D32 s=
lots < 708 nslots. Continue...
[  259.843408] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31824]=3D30 s=
lots < 708 nslots. Continue...
[  259.852567] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31826]=3D2e s=
lots < 708 nslots. Continue...
[  259.861725] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31828]=3D2c s=
lots < 708 nslots. Continue...
[  259.870883] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31830]=3D2a s=
lots < 708 nslots. Continue...
[  259.880042] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31832]=3D28 s=
lots < 708 nslots. Continue...
[  259.889200] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31834]=3D26 s=
lots < 708 nslots. Continue...
[  259.898365] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31836]=3D24 s=
lots < 708 nslots. Continue...
[  259.907516] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31838]=3D22 s=
lots < 708 nslots. Continue...
[  259.916676] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31840]=3D20 s=
lots < 708 nslots. Continue...
[  259.925834] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31842]=3D1e s=
lots < 708 nslots. Continue...
[  259.934992] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31844]=3D1c s=
lots < 708 nslots. Continue...
[  259.944151] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31846]=3D1a s=
lots < 708 nslots. Continue...
[  259.953309] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31848]=3D18 s=
lots < 708 nslots. Continue...
[  259.962468] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31850]=3D16 s=
lots < 708 nslots. Continue...
[  259.971626] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31852]=3D14 s=
lots < 708 nslots. Continue...
[  259.980784] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31854]=3D12 s=
lots < 708 nslots. Continue...
[  259.989943] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31856]=3D10 s=
lots < 708 nslots. Continue...
[  259.999102] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31858]=3De sl=
ots < 708 nslots. Continue...
[  260.008181] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31860]=3Dc sl=
ots < 708 nslots. Continue...
[  260.017245] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31862]=3Da sl=
ots < 708 nslots. Continue...
[  260.026318] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31864]=3D8 sl=
ots < 708 nslots. Continue...
[  260.035389] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31866]=3D6 sl=
ots < 708 nslots. Continue...
[  260.044461] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31868]=3D4 sl=
ots < 708 nslots. Continue...
[  260.053533] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31870]=3D2 sl=
ots < 708 nslots. Continue...
[  260.062606] <SWIOTLB> swiotlb_tbl_map_single() io_tlb_list[31872]=3D80 s=
lots < 708 nslots. Continue...
....

Swiotlb did not fit requested slots because the maximum slot size equals IO=
_TLB_SEGSIZE=3D128 by default.
But I think, we cannot use 64af97000 address in the swiotlb_bounce() direct=
ly.

________________________________
From: Julien Grall <julien@xen.org>
Sent: Wednesday, August 11, 2021 6:20 PM
To: Roman Skakun <Roman_Skakun@epam.com>; sstabellini@kernel.org <sstabelli=
ni@kernel.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>; Andrii Anisov <Andrii_Anis=
ov@epam.com>; Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Oleksandr Tys=
hchenko <Oleksandr_Tyshchenko@epam.com>; Oleksandr Andrushchenko <Oleksandr=
_Andrushchenko@epam.com>; xen-devel@lists.xenproject.org <xen-devel@lists.x=
enproject.org>; Roman Skakun <rm.skakun@gmail.com>; Jan Beulich <jbeulich@s=
use.com>
Subject: Re: Disable swiotlb for Dom0

Hi,

On 11/08/2021 15:13, Roman Skakun wrote:
>> > Also, I added the log in xen_swiotlb_detect() and can see that swiotlb
>> > still used (other devices within dom0 used too), when dom0 is direct
> mapped:
>> >
>> > [    1.870363] xen_swiotlb_detect() dev: rcar-fcp,
>> > XENFEAT_direct_mapped, use swiotlb
>> > [    1.878352] xen_swiotlb_detect() dev: rcar-fcp,
>> > XENFEAT_direct_mapped, use swiotlb
>> > [    1.886309] xen_swiotlb_detect() dev: rcar-fcp,
>> > XENFEAT_direct_mapped, use swiotlb
>> >
>>> This means, that all  devices are using swiotlb-xen DMA fops.
>> > By the way, before applying this patches, dom0 always used swiotlb-xen
>> > fops for initial domain by design.
>
>> >This is expected because your domain is direct mapped.
>
> May be, I don't understand right, Stefano reported the same issue when
> dom0 is not direct mapped,
> but I have direct mapped dom0 and problem still exists.

I am not entirely sure why you think this is the same problem as
Stefano. He asked to bypass the swiotlb, but AFAIK, this is not because
the buffer get bounced.

Instead, it is because swiotlb-xen on Arm has been relying on its RAM to
be direct-mapped (GFN =3D=3D MFN). With cache coloring, the memory will not
be direct-mapped, hence it will be broken.

>
>>Ok. Would you be able to provide more information on where the dom0
>>memory is allocated  and the list of host RAM?
>
> Host memory:
> DRAM:  7.9 GiB
> Bank #0: 0x048000000 - 0x0bfffffff, 1.9 GiB
> Bank #1: 0x500000000 - 0x57fffffff, 2 GiB
> Bank #2: 0x600000000 - 0x67fffffff, 2 GiB
> Bank #3: 0x700000000 - 0x77fffffff, 2 GiB
>
> dom0 memory map:
> (XEN) Allocating 1:1 mappings totalling 2048MB for dom0:
> (XEN) BANK[0] 0x00000048000000-0x00000050000000 (128MB)
> (XEN) BANK[1] 0x00000058000000-0x000000c0000000 (1664MB)
> (XEN) BANK[2] 0x00000510000000-0x00000520000000 (256MB)

Thanks! So you have some memory assigned above 4GB to dom0 as well.

>>> We retrieved dev_addr(64b1d0000)  + size > 32bit mask, but fcp driver
>>> wants to use only  32 bit boundary address, but that's consequence.
>>>
>> Ok. So your device is only capable to do a 32-bit DMA. Is that correct?
>
> Yes.
>
>> > I think, the main reason of using bounce buffer is MFN address, not DM=
A
>> > phys address.
>> >
>>I don't understand this sentence. Can you clarify it?
>
> This address looks like theMFN because I'm using mapped grant tables
> from domU.
>
> I've added the log and see the following:
> with swiotlb:
> [   78.620386] dma_map_sg_attrs() dev: rcar-du swiotlb, sg_page:
> fffffe0001b80000, page_to_phy: b6000000, xen_phys_to_dma: 64b1d0000
>
> without swiotlb (worked fine):
> [   74.456426] dma_map_sg_attrs() dev: rcar-du direct map, sg_page:
> fffffe0001b80000, page_to_phy: b6000000, xen_phys_to_dma:b6000000
>
> I guess, need to figure out why we got a normal dom0 DMA address
> (b6000000) and why 64b1d0000 when using swiotlb.

So 0xb6000000 is most likely the GFN used to mapped the grant from the domU=
.

swiotlb-xen on Arm will convert it to the MFN because it is not aware
whether the device is behind an IOMMU.

As the address is too high to be handled by the device, swiotlb will try
to bounce it. I think it is correct to bounce the page but I am not sure
why it can't. What the size of the DMA transaction?

However, even if you disable xen-swiotlb, you are likely going to face
the same issue sooner or later because the grant can be mapped anywhere
in the memory of dom0 (the balloon code doesn't look to restrict where
the memory can be allocated). So it is possible for the grant to be
mapped in the dom0 memory above 4GB.

Oleksandr is also looking to provide a safe range which would be outside
of the existing RAM. So, I believe, you will have to bounce the DMA
buffer unless we always force the grant/foreign mapping to be mapped
below 4GB.

Cheers,

--
Julien Grall

--_000_AM7PR03MB659376E041306352B583060185FA9AM7PR03MB6593eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi&nbsp;Julien,<br>
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;&nbsp;</span>So
 0xb6000000 is most likely the GFN used to mapped the grant from the domU.<=
/span><br>
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important">&gt;</span><br style=
=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&qu=
ot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot=
;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(=
255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;&nbsp;</span>sw=
iotlb-xen
 on Arm will convert it to the MFN because it is not aware</span><br style=
=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&qu=
ot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot=
;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(=
255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;&nbsp;</span>wh=
ether
 the device is behind an IOMMU.<br>
</span><br>
If I'm understand right, it seems like that swiotlb-xen is not ready to wor=
k properly in case&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
when we retrieved MFN instead of proper GFN mapped to Dom0 memory.<br>
Maybe you know some ideas to overcome this condition?<br>
<br>
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;&nbsp;&nbsp;</s=
pan>As
 the address is too high to be handled by the device, swiotlb will try</spa=
n><br>
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;&nbsp;&nbsp;</s=
pan>to
 bounce it. I think it is correct to bounce the page but I am not sure</spa=
n><br style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;&nbsp;&nbsp;</s=
pan>why
 it can't. What the size of the DMA transaction?<br>
</span><br>
<span style=3D"background-color:rgb(255, 255, 255);display:inline !importan=
t">The DMA map size is 3686400 bytes.<br>
</span><br>
I've added several logs to swiotlb <span style=3D"background-color:rgb(255,=
 255, 255);display:inline !important">
map_single() and see:</span><br>
[ &nbsp;151.298455] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() origin_addr: 6=
4af97000, needed: 708,&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
avail: 7fc0, stride: 2, index: 4160<br>
<br>
It's expected because:<br>
....<br>
[ &nbsp;259.468006] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_list[31=
742]=3D2 slots &lt; 708 nslots. Continue...
<div>[ &nbsp;259.477070] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31744]=3D80 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.486229] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31746]=3D7e slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.495387] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31748]=3D7c slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.504546] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31750]=3D7a slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.513704] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31752]=3D78 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.522863] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31754]=3D76 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.532021] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31756]=3D74 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.541179] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31758]=3D72 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.550338] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31760]=3D70 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.559496] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31762]=3D6e slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.568660] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31764]=3D6c slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.577813] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31766]=3D6a slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.586972] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31768]=3D68 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.596130] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31770]=3D66 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.605289] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31772]=3D64 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.614447] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31774]=3D62 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.623606] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31776]=3D60 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.632764] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31778]=3D5e slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.641922] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31780]=3D5c slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.651081] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31782]=3D5a slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.660239] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31784]=3D58 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.669398] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31786]=3D56 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.678563] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31788]=3D54 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.687714] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31790]=3D52 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.696873] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31792]=3D50 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.706032] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31794]=3D4e slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.715190] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31796]=3D4c slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.724348] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31798]=3D4a slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.733507] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31800]=3D48 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.742665] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31802]=3D46 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.751824] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31804]=3D44 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.760982] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31806]=3D42 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.770141] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31808]=3D40 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.779299] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31810]=3D3e slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.788466] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31812]=3D3c slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.797615] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31814]=3D3a slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.806774] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31816]=3D38 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.815933] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31818]=3D36 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.825091] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31820]=3D34 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.834249] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31822]=3D32 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.843408] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31824]=3D30 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.852567] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31826]=3D2e slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.861725] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31828]=3D2c slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.870883] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31830]=3D2a slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.880042] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31832]=3D28 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.889200] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31834]=3D26 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.898365] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31836]=3D24 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.907516] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31838]=3D22 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.916676] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31840]=3D20 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.925834] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31842]=3D1e slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.934992] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31844]=3D1c slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.944151] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31846]=3D1a slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.953309] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31848]=3D18 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.962468] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31850]=3D16 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.971626] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31852]=3D14 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.980784] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31854]=3D12 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.989943] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31856]=3D10 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;259.999102] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31858]=3De slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;260.008181] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31860]=3Dc slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;260.017245] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31862]=3Da slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;260.026318] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31864]=3D8 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;260.035389] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31866]=3D6 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;260.044461] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31868]=3D4 slots &lt; 708 nslots. Continue...</div>
<div>[ &nbsp;260.053533] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_li=
st[31870]=3D2 slots &lt; 708 nslots. Continue...</div>
[ &nbsp;260.062606] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() io_tlb_list[31=
872]=3D80 slots &lt; 708 nslots. Continue...<br>
....<br>
<br>
Swiotlb did not fit requested slots because the maximum slot size equals IO=
_TLB_SEGSIZE=3D128 by default.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);"><span style=3D"background-color:rgb(255, 255=
, 255);display:inline !important">But I think, we cannot use<span>&nbsp;</s=
pan></span><span style=3D"margin:0px;background-color:rgb(255, 255, 255);di=
splay:inline !important">64af97000
 address&nbsp;</span><span style=3D"background-color:rgb(255, 255, 255);dis=
play:inline !important">in the&nbsp;swiotlb_bounce() directly.</span><br>
<br>
</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Julien Grall &lt;juli=
en@xen.org&gt;<br>
<b>Sent:</b> Wednesday, August 11, 2021 6:20 PM<br>
<b>To:</b> Roman Skakun &lt;Roman_Skakun@epam.com&gt;; sstabellini@kernel.o=
rg &lt;sstabellini@kernel.org&gt;<br>
<b>Cc:</b> Bertrand Marquis &lt;bertrand.marquis@arm.com&gt;; Andrii Anisov=
 &lt;Andrii_Anisov@epam.com&gt;; Volodymyr Babchuk &lt;Volodymyr_Babchuk@ep=
am.com&gt;; Oleksandr Tyshchenko &lt;Oleksandr_Tyshchenko@epam.com&gt;; Ole=
ksandr Andrushchenko &lt;Oleksandr_Andrushchenko@epam.com&gt;;
 xen-devel@lists.xenproject.org &lt;xen-devel@lists.xenproject.org&gt;; Rom=
an Skakun &lt;rm.skakun@gmail.com&gt;; Jan Beulich &lt;jbeulich@suse.com&gt=
;<br>
<b>Subject:</b> Re: Disable swiotlb for Dom0</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi,<br>
<br>
On 11/08/2021 15:13, Roman Skakun wrote:<br>
&gt;&gt; &gt; Also, I added the log in xen_swiotlb_detect() and can see tha=
t swiotlb<br>
&gt;&gt; &gt; still used (other devices within dom0 used too), when dom0 is=
 direct <br>
&gt; mapped:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; [ &nbsp; &nbsp;1.870363] xen_swiotlb_detect() dev: rcar-fcp,<=
br>
&gt;&gt; &gt; XENFEAT_direct_mapped, use swiotlb<br>
&gt;&gt; &gt; [ &nbsp; &nbsp;1.878352] xen_swiotlb_detect() dev: rcar-fcp,<=
br>
&gt;&gt; &gt; XENFEAT_direct_mapped, use swiotlb<br>
&gt;&gt; &gt; [ &nbsp; &nbsp;1.886309] xen_swiotlb_detect() dev: rcar-fcp,<=
br>
&gt;&gt; &gt; XENFEAT_direct_mapped, use swiotlb<br>
&gt;&gt; &gt;<br>
&gt;&gt;&gt; This means, that all&nbsp; devices are using swiotlb-xen DMA f=
ops.<br>
&gt;&gt; &gt; By the way, before applying this patches, dom0 always used sw=
iotlb-xen<br>
&gt;&gt; &gt; fops for initial domain by design.<br>
&gt; <br>
&gt;&gt; &gt;This is expected because your domain is direct mapped.<br>
&gt; <br>
&gt; May be, I don't understand right, Stefano reported the same issue when=
 <br>
&gt; dom0 is not direct mapped,<br>
&gt; but I have direct mapped dom0 and problem still exists.<br>
<br>
I am not entirely sure why you think this is the same problem as <br>
Stefano. He asked to bypass the swiotlb, but AFAIK, this is not because <br=
>
the buffer get bounced.<br>
<br>
Instead, it is because swiotlb-xen on Arm has been relying on its RAM to <b=
r>
be direct-mapped (GFN =3D=3D MFN). With cache coloring, the memory will not=
 <br>
be direct-mapped, hence it will be broken.<br>
<br>
&gt; <br>
&gt;&gt;Ok. Would you be able to provide more information on where the dom0=
<br>
&gt;&gt;memory is allocated&nbsp; and the list of host RAM?<br>
&gt; <br>
&gt; Host memory:<br>
&gt; DRAM: &nbsp;7.9 GiB<br>
&gt; Bank #0: 0x048000000 - 0x0bfffffff, 1.9 GiB<br>
&gt; Bank #1: 0x500000000 - 0x57fffffff, 2 GiB<br>
&gt; Bank #2: 0x600000000 - 0x67fffffff, 2 GiB<br>
&gt; Bank #3: 0x700000000 - 0x77fffffff, 2 GiB<br>
&gt; <br>
&gt; dom0 memory map:<br>
&gt; (XEN) Allocating 1:1 mappings totalling 2048MB for dom0:<br>
&gt; (XEN) BANK[0] 0x00000048000000-0x00000050000000 (128MB)<br>
&gt; (XEN) BANK[1] 0x00000058000000-0x000000c0000000 (1664MB)<br>
&gt; (XEN) BANK[2] 0x00000510000000-0x00000520000000 (256MB)<br>
<br>
Thanks! So you have some memory assigned above 4GB to dom0 as well.<br>
<br>
&gt;&gt;&gt; We retrieved dev_addr(64b1d0000)&nbsp; + size &gt; 32bit mask,=
 but fcp driver<br>
&gt;&gt;&gt; wants to use only&nbsp; 32 bit boundary address, but that's co=
nsequence.<br>
&gt;&gt;&gt;<br>
&gt;&gt; Ok. So your device is only capable to do a 32-bit DMA. Is that cor=
rect?<br>
&gt; <br>
&gt; Yes.<br>
&gt; <br>
&gt;&gt; &gt; I think, the main reason of using bounce buffer is&nbsp;MFN a=
ddress, not DMA<br>
&gt;&gt; &gt; phys address.<br>
&gt;&gt; &gt;<br>
&gt;&gt;I don't understand this sentence. Can you clarify it?<br>
&gt; <br>
&gt; This address looks like theMFN because I'm using mapped grant tables <=
br>
&gt; from domU.<br>
&gt; <br>
&gt; I've added the log and see the following:<br>
&gt; with swiotlb:<br>
&gt; [ &nbsp; 78.620386] dma_map_sg_attrs() dev: rcar-du swiotlb, sg_page: =
<br>
&gt; fffffe0001b80000, page_to_phy: b6000000, xen_phys_to_dma: 64b1d0000<br=
>
&gt; <br>
&gt; without swiotlb (worked fine):<br>
&gt; [ &nbsp; 74.456426] dma_map_sg_attrs() dev: rcar-du direct map, sg_pag=
e: <br>
&gt; fffffe0001b80000, page_to_phy: b6000000, xen_phys_to_dma:b6000000<br>
&gt; <br>
&gt; I guess, need to figure out why we got a normal dom0 DMA address <br>
&gt; (b6000000) and why 64b1d0000 when using swiotlb.<br>
<br>
So 0xb6000000 is most likely the GFN used to mapped the grant from the domU=
.<br>
<br>
swiotlb-xen on Arm will convert it to the MFN because it is not aware <br>
whether the device is behind an IOMMU.<br>
<br>
As the address is too high to be handled by the device, swiotlb will try <b=
r>
to bounce it. I think it is correct to bounce the page but I am not sure <b=
r>
why it can't. What the size of the DMA transaction?<br>
<br>
However, even if you disable xen-swiotlb, you are likely going to face <br>
the same issue sooner or later because the grant can be mapped anywhere <br=
>
in the memory of dom0 (the balloon code doesn't look to restrict where <br>
the memory can be allocated). So it is possible for the grant to be <br>
mapped in the dom0 memory above 4GB.<br>
<br>
Oleksandr is also looking to provide a safe range which would be outside <b=
r>
of the existing RAM. So, I believe, you will have to bounce the DMA <br>
buffer unless we always force the grant/foreign mapping to be mapped <br>
below 4GB.<br>
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM7PR03MB659376E041306352B583060185FA9AM7PR03MB6593eurp_--

