Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B62D6A913C
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 07:52:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505549.778376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXzHW-0007Ax-4Q; Fri, 03 Mar 2023 06:52:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505549.778376; Fri, 03 Mar 2023 06:52:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXzHW-00078P-1R; Fri, 03 Mar 2023 06:52:42 +0000
Received: by outflank-mailman (input) for mailman id 505549;
 Fri, 03 Mar 2023 06:52:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pvdj=63=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1pXzHU-00078E-PY
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 06:52:41 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7d00::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fad3e6af-b98f-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 07:52:37 +0100 (CET)
Received: from AM5PR1001CA0067.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::44) by GV1PR08MB8084.eurprd08.prod.outlook.com
 (2603:10a6:150:94::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Fri, 3 Mar
 2023 06:52:34 +0000
Received: from VI1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::f1) by AM5PR1001CA0067.outlook.office365.com
 (2603:10a6:206:15::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.21 via Frontend
 Transport; Fri, 3 Mar 2023 06:52:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT063.mail.protection.outlook.com (100.127.144.155) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.19 via Frontend Transport; Fri, 3 Mar 2023 06:52:33 +0000
Received: ("Tessian outbound fcd8b5fba459:v135");
 Fri, 03 Mar 2023 06:52:32 +0000
Received: from fa19302d2589.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ACAB323F-4FCB-4994-8B23-EFBD5D7CF39E.1; 
 Fri, 03 Mar 2023 06:52:26 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fa19302d2589.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 03 Mar 2023 06:52:26 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11)
 by AM0PR08MB5396.eurprd08.prod.outlook.com (2603:10a6:208:182::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 06:52:25 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::f0ae:a3f2:8c03:2e06]) by AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::f0ae:a3f2:8c03:2e06%4]) with mapi id 15.20.6156.017; Fri, 3 Mar 2023
 06:52:25 +0000
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
X-Inumbo-ID: fad3e6af-b98f-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYFFCGtcBKrAZ0uQoYiDJmQkrYQpjyT7IP5oFKtIFRE=;
 b=YCqPoZm16WdKiSVFYrwP5q14jI7Ptjxmwnp97FZjeOiFLxooskTpcLFAAi21Z+Y6YlGvxhQFcIpwxwHUclM08xO5iT5IaxmO+av23R/P2ZvUoZcNQzL/8bHA+RQ9674VSKCuRSd3burlglLcD7vyyJwB1QoivLuSVWraWd8g8h4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cf536KWQoBxk94elYLVX8gRB36jNEiHSK1z5jqkBsUMNEzuPAUGv6pw7WjoRlHAuJfY9ke+9Nd652mkbsGM6/JgN2bALC+/h0AbAXt+nB6aHib+SyKppGtkLSp5UfvSg0qZUKc2+Azs95+/Ol72b4Efv9MCdb0s6fVWvqbgj5HtJmZZXd3wiTneB5et+dSkaNG7EO9f63Fd5n5i+/PhIolnb6GazAa3Kt3K3xyWpRGKmipNxqi5WnnYZA7WH86FGA5CxfXsTSnMjW3ZcPZLi6CkuGayndK9WutUY1u0Vbj9oDAKgXvhtnnGqt+yKc8bKGmOtQ12cnjUd72NRkeIN+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYFFCGtcBKrAZ0uQoYiDJmQkrYQpjyT7IP5oFKtIFRE=;
 b=djmN0F7/+4MS8OuzL9fL2VH0n3PXT4twJavuh4ySS0hDXA1H+0mDdD8PFHhuk/6m7+PQ8Z2XsL4CYD+6pKrUC5gCv1wn8q9mh6bZQYQul5BMInMkQHZkrPhkX57IDvi9rGKirUdanmz0C5lB6F/2Ux1h+z1F7XLTZxlPei5zotPSHGkQfkF4btS96FmdUyUDX/6+3NAHKCdzGPJUKQaytjt9f0TL92oGqhPkGtainSYqw3+qxnYT5U1H0RXcvhyivZCYSqASqM2OPByeiZeJM/4dTKLBm0ZgsmZ5ZbH9SfkX0n0XtWMK89dyMSxqGfs3/L+hBjaVQ0OJOh7lNKD8kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYFFCGtcBKrAZ0uQoYiDJmQkrYQpjyT7IP5oFKtIFRE=;
 b=YCqPoZm16WdKiSVFYrwP5q14jI7Ptjxmwnp97FZjeOiFLxooskTpcLFAAi21Z+Y6YlGvxhQFcIpwxwHUclM08xO5iT5IaxmO+av23R/P2ZvUoZcNQzL/8bHA+RQ9674VSKCuRSd3burlglLcD7vyyJwB1QoivLuSVWraWd8g8h4=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Chen <Wei.Chen@arm.com>
Subject: RE: [ImageBuilder][PATCH 1/2] uboot-script-gen: Add support for
 static heap
Thread-Topic: [ImageBuilder][PATCH 1/2] uboot-script-gen: Add support for
 static heap
Thread-Index: AQHZTMH9rCgFY/whfU6dVhdcVu6kMa7naF6AgAC/KoCAAHerMA==
Date: Fri, 3 Mar 2023 06:52:24 +0000
Message-ID:
 <AS8PR08MB769680F4F89382C3C72DCE8592B39@AS8PR08MB7696.eurprd08.prod.outlook.com>
References: <20230302044606.136130-1-jiamei.xie@arm.com>
 <20230302044606.136130-2-jiamei.xie@arm.com>
 <f480d3c5-e18a-7863-b2a0-9ba95f7e678b@amd.com>
 <alpine.DEB.2.22.394.2303021541090.863724@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2303021541090.863724@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 17AF062E1DDD214B9A4DA82F9E94ABE9.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7696:EE_|AM0PR08MB5396:EE_|VI1EUR03FT063:EE_|GV1PR08MB8084:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c6ab1a8-3209-4ae1-ef35-08db1bb3dd70
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 drFVtipWxxSrChYvu++c0x1lX7Sn9hNSeTmoLFo6Ze6H/RquMG16hfKTwcbYLBwqwebF3zy1LXQX5OLWMbckrimb4d66O4I65Ofx33KR+mL23efGAEqz8Lf/8HwohtoB0AGJZU7ZC9WFqg8tH4aP/cGuafopltFzOWB97YOOY9Bd57ObLPGqUBsCaZp2a5mY1SZbf0LKVAQT9Z8fan2C2YIDgPqP2sfo1wf4HE9ZDbTbTWnDd4q1UOwyvKnyeDloBqoALjiC7c/lvSLUNxCvBiumWs6q0JmSJEEf9C6Y1GNhOKdHJKe4fvIoXIRZHNmmjo46PPDMqz1lfz7PUDgVyZvEChICOiagrdPeZ0rrHM59Yp4l38MrUAWAWx1DQ+jxQx8RIkp3UnKIixV9NptN4BAlWJhs2N2wnGnk3jT4B9AEVwYDAvOyZ1IzZcSwZ12w4F3fbIF4Np2BvWN+YG0m9hZAEykQxZkQEZN6T43Ebpkp0RfxuA3LlnfWErHxXfJ/qr3E2mDaZQR3eZlbE9IoS0pvas8GfEm/0wyHeKUZHVXx091WQqt5zHJJcStqdRznn2EdYj6TpXh9U76r0R9MltCbImppFYAMEOB97rwzSYv9z/+RAGPu8VBrr7JPgTag7i/wv3dGsQcIAbZYa0CnpKMaGjZ8VRCYr7kmvf3yMJUUrunTLOLCsjw/4JfqRGBcoKoop0a0WtK7qRz9w3X7aA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(396003)(366004)(376002)(39860400002)(451199018)(7696005)(186003)(26005)(71200400001)(9686003)(478600001)(54906003)(83380400001)(316002)(76116006)(66946007)(66556008)(66446008)(64756008)(66476007)(4326008)(8676002)(53546011)(6506007)(110136005)(41300700001)(52536014)(8936002)(5660300002)(122000001)(38100700002)(2906002)(55016003)(86362001)(38070700005)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5396
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	57fa48da-0498-4a90-4919-08db1bb3d88c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CbkW90ToJ5Ch1E0GyodSVMyllDqRJCBz95/+4yDCEUN0Vu642jisiZpsqvxRstYWN0XR7q5nF0sOfeuWW6lvqdJKV2/sR37lVCzMzlv8GjXssOBJmgUpbn9iy4Eu37tpi0Dzp/0SwNeZd78+5cgQM60irhuKBNV1MXKxGYwM6mKxkYlF8DuWAmByubvaoaIvQeSKHxUhD95DhgrvRBjVsRgHY3OXkduIay1rfj0sYy8Bk3Pi078t63KZ7KK/1+k0EWxguG2T2tKi5wo5foX0qsN9ZEVGI71SC/1uqu2YHsLadevB+iNdU2iBPSpLAgd1Xrx+mPAJC8r+zMeHK7ur5HaphLJAljxCM7egcQuj7uDuuxV0dlHDwco9+Z6gTDR4YX1M8+0XQ5ladBpq0AW7eoB7MpE2MwhX1t0UHf4Nrrg3F5fCXm0iWFMYVFrp9uClTy7iPXAcyDKvGwNZC9V3GDGHTJ8nVA1KZPLFEzriBxqPPvwwn8ZcvgiJwW5vRiXQ/rCFkJXYwuw9iTDGfT1mi1zvtyGsnrjpKV8vokdqXKcVTG//aq/1kLwxI7BL0+e0Nm9T0wWQWJwrHI0WoZrqZXq7yQxGtWqv1yS8luSC/xCIXFt1dnCRdWOhkvj2Tzu25nNrGy4bn60ViCSrkLxcP7UJ/mTs+0BEbX05CttCGojcStT5sDcYE+kX24JmI6ObiFs0YlghTBt801ToITVeow==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199018)(46966006)(40470700004)(36840700001)(478600001)(33656002)(7696005)(356005)(86362001)(8936002)(8676002)(55016003)(40480700001)(4326008)(5660300002)(41300700001)(70206006)(82740400003)(36860700001)(81166007)(52536014)(316002)(54906003)(9686003)(47076005)(70586007)(82310400005)(110136005)(2906002)(83380400001)(26005)(186003)(336012)(6506007)(40460700003)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 06:52:33.0225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c6ab1a8-3209-4ae1-ef35-08db1bb3dd70
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8084

Hi Stefano and Michal,

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Sent: Friday, March 3, 2023 7:42 AM
> To: Michal Orzel <michal.orzel@amd.com>
> Cc: Jiamei Xie <Jiamei.Xie@arm.com>; xen-devel@lists.xenproject.org; Wei
> Chen <Wei.Chen@arm.com>; sstabellini@kernel.org
> Subject: Re: [ImageBuilder][PATCH 1/2] uboot-script-gen: Add support for
> static heap
>=20
> On Thu, 2 Mar 2023, Michal Orzel wrote:
> > Hi Jiamei,
> >
> > Patch looks good apart from minor comments down below.
>=20
> Just wanted to add that the patch looks OK to me too and don't have any
> further comments beyond the ones Michal's already made
>=20
>=20
> > On 02/03/2023 05:46, jiamei.xie wrote:
> > >
> > >
> > > From: jiamei Xie <jiamei.xie@arm.com>
> > >
> > > Add a new config parameter to configure static heap.
> > > STATIC_HEAP=3D"baseaddr1 size1 ... baseaddrN sizeN"
> > > if specified, indicates the host physical address regions
> > > [baseaddr, baseaddr + size) to be reserved as static heap.
> > >
> > > For instance, STATIC_HEAP=3D"0x50000000 0x30000000", if specified,
> > > indicates the host memory region starting from paddr 0x50000000
> > > with a size of 0x30000000 to be reserved as static heap.
> > >
> > > Signed-off-by: jiamei Xie <jiamei.xie@arm.com>
> > > ---
> > >  README.md                |  4 ++++
> > >  scripts/uboot-script-gen | 20 ++++++++++++++++++++
> > >  2 files changed, 24 insertions(+)
> > >
> > > diff --git a/README.md b/README.md
> > > index 814a004..787f413 100644
> > > --- a/README.md
> > > +++ b/README.md
> > > @@ -256,6 +256,10 @@ Where:
> > >
> > >  - NUM_CPUPOOLS specifies the number of boot-time cpupools to create.
> > >
> > > +- STATIC_HEAP=3D"baseaddr1 size1 ... baseaddrN sizeN"
> > > +  if specified, indicates the host physical address regions
> > > +  [baseaddr, baseaddr + size) to be reserved as static heap.
> > As this option impacts Xen and not domUs, please call it XEN_STATIC_HEA=
P
> and move
> > it right after XEN_CMD documentation.
Thanks for your comments . Ack
> >
> > > +
> > >  Then you can invoke uboot-script-gen as follows:
> > >
> > >  ```
> > > diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> > > index f07e334..4775293 100755
> > > --- a/scripts/uboot-script-gen
> > > +++ b/scripts/uboot-script-gen
> > > @@ -189,6 +189,21 @@ function add_device_tree_static_mem()
> > >      dt_set "$path" "xen,static-mem" "hex" "${cells[*]}"
> > >  }
> > >
> > > +function add_device_tree_static_heap()
> > > +{
> > > +    local path=3D$1
> > > +    local regions=3D$2
> > > +    local cells=3D()
> > > +    local val
> > > +
> > > +    for val in ${regions[@]}
> > > +    do
> > > +        cells+=3D("$(printf "0x%x 0x%x" $(($val >> 32)) $(($val & ((=
1 << 32) -
> 1))))")
> > Please use split_value function instead of opencoding it.
> > It will then become:
> > cells+=3D("$(split_value $val)")

Thanks for your comments . Ack.
> >
> > ~Michal
> >

