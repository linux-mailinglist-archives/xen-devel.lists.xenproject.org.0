Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79786519F25
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 14:22:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320675.541524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmE0z-0001wu-N6; Wed, 04 May 2022 12:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320675.541524; Wed, 04 May 2022 12:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmE0z-0001tP-JK; Wed, 04 May 2022 12:21:57 +0000
Received: by outflank-mailman (input) for mailman id 320675;
 Wed, 04 May 2022 12:21:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mWz8=VM=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1nmE0y-0001tJ-11
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 12:21:56 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe08::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c81a50c7-cba4-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 14:21:53 +0200 (CEST)
Received: from AM6PR0502CA0050.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::27) by AM6PR08MB3638.eurprd08.prod.outlook.com
 (2603:10a6:20b:4b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Wed, 4 May
 2022 12:21:52 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::80) by AM6PR0502CA0050.outlook.office365.com
 (2603:10a6:20b:56::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25 via Frontend
 Transport; Wed, 4 May 2022 12:21:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Wed, 4 May 2022 12:21:51 +0000
Received: ("Tessian outbound ab7864ef57f2:v118");
 Wed, 04 May 2022 12:21:51 +0000
Received: from d62a3791ed95.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9D9AC6B8-BDA0-4959-A596-7012BAA79B5D.1; 
 Wed, 04 May 2022 12:21:39 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d62a3791ed95.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 May 2022 12:21:39 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by DB7PR08MB3578.eurprd08.prod.outlook.com
 (2603:10a6:10:50::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Wed, 4 May
 2022 12:21:36 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::6c39:76a0:c05c:2938]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::6c39:76a0:c05c:2938%11]) with mapi id 15.20.5206.024; Wed, 4 May 2022
 12:21:35 +0000
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
X-Inumbo-ID: c81a50c7-cba4-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=QAw4A3ql79FmKia3EbNbDjTpo/5Lxx+ssUn2OOjRZz2WG+ocD/dYthrIH74oh62RRkZQw2q/i1E6pwAGZnteaDPYNlqRUiUNp4o8cTLodbXbI/KZ9ADyu6p7iFWWTAEhJ3rmq8NA/mYvf8Rcp4+EzpQf1owEfZbJTZuR0toqNEMEBwCthZaDZyJ4gI9s2tJhXtnwcOOS5Z8vYsCI8DzjHIsZn6tvbfXlVXHX50mEJk5ISho6ROo6pVAlPOhztb9zxjjc/KektrbDSh2tbWvWIXIiFHnqHuuriK/sPxsgFEBtvRuMS56jz6Bog616tTQPGc2mgYtKJXb/JeeE41rMdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXi5+ByetQA4DsgMU9oucBblz1aUs+i897kCw50ipuA=;
 b=Ne1nbgg3mZSgTOL1fhFoaRQRlV3A8QLBZWJQ4KifpmkN1M55QwydAu51bcJgbFG/EbR/AEDu+fM4ijw5suwKccXkYSzQqM3LFc08sTgve8J9Qa0mdIPsRV3+DRRm6pRWQtI2RZ5iHWDGV644mmv9liwCa4h3ofAO37X1h2ibpOYgUSACto17QATRpHzXPl3uMfJA1NvnEM66b/P3KMjq325+ZODNwMZ06I+HZ9+emgM7EckwJNM2GyNGdKVE42bjOpvHwM5wcCqrbP+64eeTEGUWVz0k1n/Vt4cciNSedckavHFU1KNCXCSHL38EZNzaoz6VOguaunNxJGDPwa9UtQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXi5+ByetQA4DsgMU9oucBblz1aUs+i897kCw50ipuA=;
 b=eTOdwOoG/1iuAxZulLSg0JXxlZs1iYoj/dX/za3xKxDZ4kvMZoDQgQqLm2jWed1FzdB4cEo++g9NP0UKb5VEZbQ0Vr6T02U2jaez0UXyi/dppSIxTabHepC6wl3CChxtTI3epe15oGPTQwy+mfeZSaxaexOwpcWWFtfQPmos5qA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f9449c6b2f052471
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqhukKvyl0IiNt/IKDFFIxjW9dtn8whQIrP6HHFLtyyAbx5j97ppRE3AmitupaTfGzyi2TKRL4Q4l94MGTAFQr6bfxtIHw5OEpm6fkb5iZLw0DAISk31M2MtJApxVAwseRKOoqy4d+Np8uZnhx2Zk6OSfm+o2U31sz0/eGJeCoRJA2tX8nJQH9ibyip/WobgtePhRfI+pna1lSy73UD7h/QbNBueVgLkZ/l000ghCzgIV5aMGxPGX5BY1WZ10CiNSqz60Fw206HCgAYLDio3nN9jCS9LMQHofsmJ49bVunuJiJpvVEtycpRXKfEa+We/EKp1tqc87AFy6a4kPblaJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXi5+ByetQA4DsgMU9oucBblz1aUs+i897kCw50ipuA=;
 b=nH1dB2nTPPkZGzjpe01Wa77DFJPoFFtKjH2HlSwQYczK7dcFFhw6ukTAmUytqP/vM1I2CAZRQLWl4VDSGM9u4+SDtM7h+N9qN7fNa9Zy59R9DPGxEeGYqJJxq7ytW+79vRGrV+fK3sBH08wa1h1niZsZ788XC4cxi0OzySDZKhH5QXfPMXKtXMub6LpuuEaM9EdMI9bdo4FN+qxKqCteOwr+MwuczBbP+t1JA4ylm0PcMXqHAsIDLjcTAJVaBZzR+vbqZbo0GrMKrdOUeBed+Yq6hXd+4QVCX+aKvje81LGl2LP9p2+vjZ6vfsepGYRbBoQeGtaj81WFkJV0wjs1sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXi5+ByetQA4DsgMU9oucBblz1aUs+i897kCw50ipuA=;
 b=eTOdwOoG/1iuAxZulLSg0JXxlZs1iYoj/dX/za3xKxDZ4kvMZoDQgQqLm2jWed1FzdB4cEo++g9NP0UKb5VEZbQ0Vr6T02U2jaez0UXyi/dppSIxTabHepC6wl3CChxtTI3epe15oGPTQwy+mfeZSaxaexOwpcWWFtfQPmos5qA=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] arm/its: enable LPIs before mapping the collection table
Thread-Topic: [PATCH] arm/its: enable LPIs before mapping the collection table
Thread-Index: AQHYWlHsf41jIOfeQ0mX6M++noloAq0NWJOAgAFGKQCAAAlngIAABjSA
Date: Wed, 4 May 2022 12:21:35 +0000
Message-ID: <DAF4E8C1-3C22-47FC-8E36-1FDB91A9FE95@arm.com>
References:
 <7762e8e35be1f99f2a7ca81aa8cf8fc502030e7b.1651075773.git.rahul.singh@arm.com>
 <ea7e891a-6e4c-50e2-dc3f-82f373640784@xen.org>
 <66A4F1AF-9539-497E-A777-316D1C21E1F4@arm.com>
 <0bab2226-fcce-6525-323f-c95d951e6696@xen.org>
In-Reply-To: <0bab2226-fcce-6525-323f-c95d951e6696@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ce756cee-aec0-449b-1477-08da2dc8ab33
x-ms-traffictypediagnostic:
	DB7PR08MB3578:EE_|VE1EUR03FT049:EE_|AM6PR08MB3638:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB363856E9523408115121C914FCC39@AM6PR08MB3638.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LlOPiwC2VoNSCLdl0IaskwHc1F4l6kCapgKMf63l5OaaMjihghzItSjAg+6BkAwyvnJlFuPgYl3QZeq4UfEEDSPGrKF1KEPGkEG2ePpXktAkZ173ZsirYZxN4/GQ3M9OBSt+S4LfLGnl8Grz9eMNtbONWxSVDH0Lt9p27xkdhwrnPNz3bfJN3mWGBa47EwqiigUPKwLUzqsA50redIyKSYjF3Az7d/jdi6WE/zg7eLJm2zfOBoyFleL+L5cXdXTqSxx/br+OvDCbG49PmlQruUvfnudR2vl6f/I8oW7PsKVz3lENlop2mmvdukyvnf5cejK1jeswk6UPm/XglIszUx1cshbjSd4KVlCWJRqBxJqO15Mj3oJBzAVl6vrWKFYxl+/P1Bk6re4m9tvNv+gPhlntTsLl1yoo1WaaLEegkaG1KdilkfTFCNfMEexEo4qfLTR0j5JTLq4svKs5ohfhAKjSUSZjnX661BwzfmIIEDwTjpmJu1BHer/m4bUtVFD+7aRyfdH6bnqjh9Eya5MvYrNk/naxEkyH6Hql7HGFZjDtxLEUilb3Qdh2ctLJYl0R0b0kHi5ST/qxKpBPHshe35QonAzy3vUF4nEfKVteb4lGQsaH+inkV9VEX5oR2RAcUWoi+F9XW83wKwyH5aUJCpm3znTriIW0zOwjwu/bhIlM+n/nX0n1MdKSRr9df7vIE482DnaUXOkdcHEGx8bUwy6x1MkACvMuhYuMYUK6nV24GjIMaXaQ1XxU1jVpbA5P
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(66446008)(64756008)(8936002)(83380400001)(66556008)(76116006)(8676002)(26005)(66476007)(4326008)(66946007)(6512007)(33656002)(38100700002)(38070700005)(6916009)(316002)(54906003)(53546011)(6506007)(71200400001)(5660300002)(6486002)(2906002)(86362001)(36756003)(508600001)(186003)(2616005)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9F1C286DA2D3D448B93A90C5F528A00B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3578
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5f204800-54bf-40a2-838d-08da2dc8a1e8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DWPBnEPqKzeyGoZ3Enm3kjdJnu8Z+Y2yXW+BVM9g5ngyTytHIadS2DSc94k8lak5vgh7uinX0bzMw+n/L1b9BwNIlJ5WGLX+cDKGHX+cnKnQ3m/rIRzmPFCSEWQFeBG+DTZ+Ac84OEpNO1ZwvBZadPh5CgX7vOH/jaeWYmxTWTMpgfdh6cxlqmt3msNHewVGkdIC/UlqXIpFRx2lAuTAUR0C6+Hw3vRfw/GibEnOSkepEXBJnwglDl+/TPAjL8CvXV8n7hy7dYuX4AaRcrOB4Sp/Qk9KY7N+UDAI/1J4NrxyWDz7y1oUQrOr2HuADP4H52rmmcCLq6DgWLeszK4jAELgrEQw1n9akTx+31WLbmDkZC+rz9ABexWt/Db6Z8myxxMpoUO18ZJAXRqB29V4zKczr88BBoX1fJv6jxW2cYaaneA+1HnWMqwxw26s1fMLJUDoJxVD+ZcNj/xHFNDs+GxSNWhDriYeNYHtAhgsMxcu+LY2JiRqyQ3gp+RuMD4fcQdSwx4/e+eQJ8r22LBCFSbjP6qtDi0IZ7NbAwWH8WIknQSBhpaNfCxOy2Se9VgeZcjuzeq9WZr+aWXd01zkVZClhdcYP49OKY4B1FxnGpTTZosleIIYUmn4NkngkEtk4LSXKoOFuiOc7Hku2t9QJhEXDC52bynaGNvKg5IAGwrfJVimQOI/RjZPxp9HMtEm
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(5660300002)(356005)(8936002)(81166007)(86362001)(508600001)(36756003)(6486002)(2906002)(186003)(33656002)(2616005)(336012)(82310400005)(107886003)(6512007)(83380400001)(40460700003)(6506007)(26005)(47076005)(53546011)(36860700001)(4326008)(6862004)(316002)(70206006)(54906003)(70586007)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 12:21:51.4369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce756cee-aec0-449b-1477-08da2dc8ab33
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3638

Hi Julien,

> On 4 May 2022, at 12:59 pm, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> On 04/05/2022 12:25, Rahul Singh wrote:
>>> On 3 May 2022, at 4:58 pm, Julien Grall <julien@xen.org> wrote:
>>> On 27/04/2022 17:14, Rahul Singh wrote:
>>>> MAPC_LPI_OFF ITS command error can be reported to software if LPIs are
>>>> not enabled before mapping the collection table using MAPC command.
>>>> Enable the LPIs using GICR_CTLR.EnableLPIs before mapping the collecti=
on
>>>> table.
>>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>>> ---
>>>> xen/arch/arm/gic-v3.c | 4 ++--
>>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>>>> index 3c472ed768..8fb0014b16 100644
>>>> --- a/xen/arch/arm/gic-v3.c
>>>> +++ b/xen/arch/arm/gic-v3.c
>>>> @@ -812,11 +812,11 @@ static int gicv3_cpu_init(void)
>>>> /* If the host has any ITSes, enable LPIs now. */
>>>> if ( gicv3_its_host_has_its() )
>>>> {
>>>> + if ( !gicv3_enable_lpis() )
>>>> + return -EBUSY;
>>>=20
>>> gicv3_enable_lpis() is using writel_relaxed(). So in theory, the write =
may not be visible before gicv3_its_setup_collection() send the command.
>> Agree.
>>>=20
>>> So I think we need to add an smp_wmb() to ensure the ordering with a co=
mment explaning why this is necessary.
>> Or maybe be we can change the writer_relaxed() to writel() that will als=
o work.
>> -    writel_relaxed(val | GICR_CTLR_ENABLE_LPIS, GICD_RDIST_BASE + GICR_=
CTLR);
>> +    writel(val | GICR_CTLR_ENABLE_LPIS, GICD_RDIST_BASE + GICR_CTLR);
>=20
> writel() guarantees the previous writes are observed before this write. B=
ut it would not guarantee that the write will be observed before the ones a=
fter.
>=20
> Also, after further thoughts, I think this wants to be wmb() (system-wide=
) rather than smp_wmb() (innershearable).
>=20

Ok. I will use the wmb() and will send the next version.

Regards,
Rahul


