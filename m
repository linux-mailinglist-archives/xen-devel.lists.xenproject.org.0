Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B73854DD8D3
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 12:18:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291979.495919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVAcE-0004dM-Rf; Fri, 18 Mar 2022 11:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291979.495919; Fri, 18 Mar 2022 11:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVAcE-0004b4-OF; Fri, 18 Mar 2022 11:17:54 +0000
Received: by outflank-mailman (input) for mailman id 291979;
 Fri, 18 Mar 2022 11:17:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNnc=T5=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nVAcC-0004ay-VJ
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 11:17:52 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe08::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0bb5f72-a6ac-11ec-853c-5f4723681683;
 Fri, 18 Mar 2022 12:16:38 +0100 (CET)
Received: from DB6PR0802CA0027.eurprd08.prod.outlook.com (2603:10a6:4:a3::13)
 by AM6PR08MB4245.eurprd08.prod.outlook.com (2603:10a6:20b:b4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Fri, 18 Mar
 2022 11:17:48 +0000
Received: from DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::ab) by DB6PR0802CA0027.outlook.office365.com
 (2603:10a6:4:a3::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14 via Frontend
 Transport; Fri, 18 Mar 2022 11:17:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT019.mail.protection.outlook.com (10.152.20.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Fri, 18 Mar 2022 11:17:48 +0000
Received: ("Tessian outbound 2877e54fe176:v113");
 Fri, 18 Mar 2022 11:17:48 +0000
Received: from 9e1ed5f023a5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DDF217C2-B569-4EBF-96A2-B2715555DB44.1; 
 Fri, 18 Mar 2022 11:17:42 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9e1ed5f023a5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Mar 2022 11:17:42 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by DB6PR0802MB2615.eurprd08.prod.outlook.com (2603:10a6:4:a2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Fri, 18 Mar
 2022 11:17:39 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008%7]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 11:17:39 +0000
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
X-Inumbo-ID: e0bb5f72-a6ac-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxD8qoc3j142vo8VImibf6wxIOFhRXMvVs6fjUqQ1YY=;
 b=nqeErthNairkPwExD6G14ADkW02EpYX/p2cZUAn/InFk+bvLA6fXsSnuyOH+1HARMuJLs3sKjau1YCQ03yRHgrRgWSYBFIvUw7ZCaFDmNedIIcDfwJCcweL00nAmTZ/65b0LX7NohDpQxZcSI6IFCnx0JteMUlsX0tWVyKbXOeQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8b86f7bb41d69098
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWuw8krY0Uux6y55TYEGFLXLRV6o6e++emmd+tgHHCtp50s4Gqj6ruLOeg00JfgeSRjXudHiZ9q0ReX+2Q7DDh9iP3xZdzZfGPZXLsX3t6uqfazlCX+qe42UPySzBAPsCJs9FkjspQmKgauBSXd8YyyDRKuaQ0LsxV4xQSvEcrfBrsID0QKqjSOizSa13eq5w1J3AbTd7p4AFsEiVhct/XsGp7PYc8g1AmCpUZQ7vUyl4js040h0F/7biB+mHqJul7t1ks9IC6pPGvnVx0WRQfJ6SHPTIXOh6549A13yvWWjV2RXeB/L1FM2bQfOS4dgyqGoT2i/nWXG3q7CPsxzWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxD8qoc3j142vo8VImibf6wxIOFhRXMvVs6fjUqQ1YY=;
 b=TGzVNxsEzv2PTEKDgcfeSgkAe0jteFHDF2bRksfAMGWCH9yOxZAXLhBR+S9iEzgREKtaltqMH3Qls8blCp5QeRH2BNnn0k/XyDIJ/sBTAjmVMIiHsidU2V1FXKAq4BHCzO+nuJvx9y/NUZL6iZ47956eQTdmLhdl5EFpFZQjnlS3p/MHnn0fHrWa2yqbn9RuE9939JkBIB9v1u7u+vuxvin7bpolHiAFd5/XTO7u9iCLczXFZF2rdBsAHCCm/pBTLeKd7NfesfYE9mgMdwHatO9IziLQoSP0SiR0EfHmncMPGQJSNAwyZimKS10+Vs8CxsRl9pucs8zcVtxJSEQNIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxD8qoc3j142vo8VImibf6wxIOFhRXMvVs6fjUqQ1YY=;
 b=nqeErthNairkPwExD6G14ADkW02EpYX/p2cZUAn/InFk+bvLA6fXsSnuyOH+1HARMuJLs3sKjau1YCQ03yRHgrRgWSYBFIvUw7ZCaFDmNedIIcDfwJCcweL00nAmTZ/65b0LX7NohDpQxZcSI6IFCnx0JteMUlsX0tWVyKbXOeQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julia Lawall <Julia.Lawall@inria.fr>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Russell
 King <linux@armlinux.org.uk>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] xen/arm: fix typos in comments
Thread-Topic: [PATCH] xen/arm: fix typos in comments
Thread-Index: AQHYOrRFpXZxY2VxTE6A18TUxTYzZqzE/iWA
Date: Fri, 18 Mar 2022 11:17:39 +0000
Message-ID: <50B35A3D-9848-4B89-8935-AD3A1330D7CF@arm.com>
References: <20220318103729.157574-15-Julia.Lawall@inria.fr>
In-Reply-To: <20220318103729.157574-15-Julia.Lawall@inria.fr>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 63d2cf53-573d-4be3-0f3d-08da08d0ef36
x-ms-traffictypediagnostic:
	DB6PR0802MB2615:EE_|DB5EUR03FT019:EE_|AM6PR08MB4245:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4245C8BD5C149E48A146F4F1E4139@AM6PR08MB4245.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 roIuxdexesj1Jt3l1qWKRM68lFIGT+RQcVdu2y5EDDYI0DiI/kjjDFhuyVx54w+znfLyHFh0336y2M+QP/QuPXvL1LowC2Mu7E5wF1Zxdwl0uYgZ5y7mZqF3YiRwjSPE0ci8+T8kt5f4elYJZhBDpBnwMsDWPNOsGsBNPNHq6/oG3++vVpXZP5OLwc7vjiAhF4ld1UpG/3HFYWNAqIbif6e7K3xy9/XV8SZAJem42gfwFRU+ucl3VS2G1yqYZFq0pngVumGWlCEOh99I5K2QK8uNY7seYIwCj1pR/zeZpb5ihVuRTxWMPhJhBxktFuIAudO2mQ94o3NpifJPjB6dLrc9AOPhJpAKqOVjDSsZYQqJwWq6v5BmgEWIteicmsnLXyStm4Fsae4OBeyTgXs/9ziF1FOGzvicEajXDuGkfQqTgo54ZA3ruMgLf8toecAJ5iPsYcVLruy8ziodTO2fThJlEaBjqmHo96gOUfxJVaEzVng/hgJ9KaBHzVv/A/x9Ktl/mYgawxbepZi3jX99oYCiUMR/KsGNqxJ5y6tLOLbZTN1zmyXpg0qzSEHipxE2Wf/2jC6pfOhYRoUvN5SPYOAd6zv6y5EwGPyId21QjjqMZ7ybcf7eN+l/qAIEeGeb0qaoyY42QhD73RzxY/a5Bjb+jIFoQnuuAQL3UtUzLCdZq/mNjiRb6qXco1ChsttY2I5ueB2Uw9wR9Nf2zqQTa+1FZ4FGCgm/4XGCDPN/vLqnHIOVJQx57iiurS+Vqh29
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(8676002)(76116006)(38100700002)(122000001)(91956017)(54906003)(6916009)(66556008)(316002)(66476007)(66946007)(186003)(86362001)(5660300002)(4744005)(38070700005)(64756008)(8936002)(66446008)(2906002)(26005)(53546011)(2616005)(6506007)(6512007)(6486002)(71200400001)(508600001)(83380400001)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CD707C99DDB2274FB68AF74B602F08B4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2615
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0e77dfda-39dd-4142-2ad9-08da08d0e9b7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YqRz9LqPlyVtVd4fLpgLB78OEn9TE4OSvLc/+xDCm8WYQCtmc5r4Jko0LZxSp4AQZGs6Py11euaXxQuT000xk2iBwUUlayeOjLCa7lMgyBk4RxVodhYA13MDebQKORYD1FEg4VhjYRlS01K4FlkP8x3dH0lfihfVZHRhoCcMNxO8GSC8jD/PTqvpHznNERjYcAEx+FPb74zOnGJX5RGdgB++u1H+SJAKlyi78xiRqujG9gpezG0j7Pr6IIofC5NjnFLOpff9bWvLqVdOq+X11ugod3YqTKYjNPb+PP6r+pJ83HF69oVCusLD2EoVzn/0UwmUbdWxLeqz3rUVJM1QowXfY5i788DXsCUTvUs+noY3lhTXuX+fQNe05Ai4TgTTdsxwmGiwKjJdQvXnj2qi2Bcj8iGqnFW9n3QVUDlh+zwJaZez7PdPvJr6nYouzLPXb4rPdugse+mTmbUUydkZSD6gdqV0EuU6u4p2RqqN6at5LiZz75tNgglzPFgl5ESmw8RDq3RGMtgo14ux4tk+n6vwFwgzktRN42aHKj7QduA9827W8VobAsPUAZ1dFjDoxMqd2y1a7EQ4WyOCd853vc+Y23TF4mSZtgxzel57FcdBkS/EWE664pMk7pdAf58fyi8Ne09hXLnjUhLHjGmlwTSb/I6m4uUuKBtqYOS5FqUM7ptb1529bbe0DT6+PVfN
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(508600001)(47076005)(336012)(36860700001)(5660300002)(8936002)(40460700003)(6486002)(2906002)(316002)(6862004)(70586007)(70206006)(81166007)(54906003)(82310400004)(4326008)(83380400001)(26005)(107886003)(6512007)(2616005)(186003)(33656002)(86362001)(36756003)(8676002)(53546011)(6506007)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 11:17:48.5863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d2cf53-573d-4be3-0f3d-08da08d0ef36
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4245



> On 18 Mar 2022, at 10:37, Julia Lawall <Julia.Lawall@inria.fr> wrote:
>=20
> Various spelling mistakes in comments.
> Detected with the help of Coccinelle.
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca

>=20
> ---
> arch/arm/xen/mm.c |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
> index a7e54a087b80..607c1a557ccc 100644
> --- a/arch/arm/xen/mm.c
> +++ b/arch/arm/xen/mm.c
> @@ -105,7 +105,7 @@ bool xen_arch_need_swiotlb(struct device *dev,
> 	 *	- The Linux page refers to foreign memory
> 	 *	- The device doesn't support coherent DMA request
> 	 *
> -	 * The Linux page may be spanned acrros multiple Xen page, although
> +	 * The Linux page may be spanned across multiple Xen page, although
> 	 * it's not possible to have a mix of local and foreign Xen page.
> 	 * Furthermore, range_straddles_page_boundary is already checking
> 	 * if buffer is physically contiguous in the host RAM.
>=20
>=20


