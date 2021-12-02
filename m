Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 271A5466674
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 16:25:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236763.410641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msnxF-00020S-Cj; Thu, 02 Dec 2021 15:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236763.410641; Thu, 02 Dec 2021 15:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msnxF-0001yL-91; Thu, 02 Dec 2021 15:25:01 +0000
Received: by outflank-mailman (input) for mailman id 236763;
 Thu, 02 Dec 2021 15:25:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cBvN=QT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1msnxE-0001yF-Cu
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 15:25:00 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 031a241e-5384-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 16:24:59 +0100 (CET)
Received: from DB6PR1001CA0037.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::23)
 by AS8PR08MB7354.eurprd08.prod.outlook.com (2603:10a6:20b:445::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Thu, 2 Dec
 2021 15:24:58 +0000
Received: from DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::bb) by DB6PR1001CA0037.outlook.office365.com
 (2603:10a6:4:55::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Thu, 2 Dec 2021 15:24:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT059.mail.protection.outlook.com (10.152.21.175) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Thu, 2 Dec 2021 15:24:57 +0000
Received: ("Tessian outbound de6049708a0a:v110");
 Thu, 02 Dec 2021 15:24:57 +0000
Received: from d07d045da3f0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2558DBB0-AC96-4651-8AAD-F0841A115CB4.1; 
 Thu, 02 Dec 2021 15:24:44 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d07d045da3f0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 Dec 2021 15:24:44 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB3990.eurprd08.prod.outlook.com (2603:10a6:20b:a3::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Thu, 2 Dec
 2021 15:24:40 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4734.028; Thu, 2 Dec 2021
 15:24:40 +0000
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
X-Inumbo-ID: 031a241e-5384-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMut5AUiKFNEZm+rPzI75XxpolMLFaHvrDxTGjbU9Ps=;
 b=ghsOOW+C6w9zuRmsQsgcSpRx9qv6l3AyCsJMtFihDefwSsw7nx/UaoEWLZBeMA0tT/duN/biM7t3krhH/ks3aFVn4Ww49NLPs4pVHWC30EnbkWJYqGqSWu5kOaR8ijgP5vu7Z7+n0KdI1IDGtVjir7xt/o9DNvx12hkX4rsL+Tk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 52b9efb9995c3028
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j6WGvaaqlmVMQbjVT6eZfztFCbW6RZwIGdmjA/IQ9gXFkeAMRK2AOGyzzPn0av/Sy7y+dIZg5YPiK5hTzJMbLNxV9fLty5NW4D0NfyUNj7VREov+dc3MYgc1zqGWN+zC00gR6XAO8F+Lwf3+IXcHQNCVebqKUo3m9Yz/qKAPWT17JS9myxQLbitphq/vpH7P1u5bn+phARJZR9NkwCixK+fOXsqkx70oitgGeZ5mlX773Mfb76/FK1lrnIq+dYVk478ESxyguMrRuUK4UNtFRtCzm0FA1bhjOW/Lu/xUX0etybBmdNtcST2LhJi6Q+rVDkgMaYQPRrz6pPyzt4C7BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMut5AUiKFNEZm+rPzI75XxpolMLFaHvrDxTGjbU9Ps=;
 b=UbXHsWqFMMrOCtmDmYGeXetEsHwUMJplInvvJRSIwqS1FOx9muJ2M8KJ8yqQZzzKVwnwuYtjglsMBTUlA1KQFDKg45jzznWiU0kuBBufcDm0xmwfR+NRblEivFHQRUVgOdcTv+G9Kt5WcXqtogsJpPsq31URS/rmTGp0FbCA6O5SAT4jhbNrTK7nysM+eDUoLRNk7R+innNHwh0msnIdSBtUDseZIG0O5T5K1RCMD99gHnKmB+je+qf+wE8TP3Clq0ORO5iH74AnBwVQdvZ74wYd93yum8l61x9/FjPjNp6ZEQCkA43n8C7ineHM/XRWWd4Y2bQbTcinyBHXu+5Utg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMut5AUiKFNEZm+rPzI75XxpolMLFaHvrDxTGjbU9Ps=;
 b=ghsOOW+C6w9zuRmsQsgcSpRx9qv6l3AyCsJMtFihDefwSsw7nx/UaoEWLZBeMA0tT/duN/biM7t3krhH/ks3aFVn4Ww49NLPs4pVHWC30EnbkWJYqGqSWu5kOaR8ijgP5vu7Z7+n0KdI1IDGtVjir7xt/o9DNvx12hkX4rsL+Tk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] docs/efi: Fix wrong compatible in dts example
Thread-Topic: [PATCH] docs/efi: Fix wrong compatible in dts example
Thread-Index: AQHX544UfhMBQb0bWUyJNXlX8DEMHawfUlYA
Date: Thu, 2 Dec 2021 15:24:40 +0000
Message-ID: <86AF2C3E-77D9-4394-8FF6-84900B56D1B4@arm.com>
References: <20211202150517.53029-1-luca.fancellu@arm.com>
In-Reply-To: <20211202150517.53029-1-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a3c68b9d-5032-4427-0486-08d9b5a7e66a
x-ms-traffictypediagnostic: AM6PR08MB3990:|AS8PR08MB7354:
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB7354AEE0867BE2E17364BD149D699@AS8PR08MB7354.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Pe8FB2qeq2Es/5B+UtsopdVJ+iDcsamz73GVP8bfhqGSnYaeAwlC6RZKdf21DPExTOKAClJ9DrBsEuXspMw9m0am8KHEHYs43Rq+5A5nNAmsMEj7/M+VSfiyNjhhkLIOOHnHvwOrQKhibg+96QnjmbGg4EANmBXriwYVL6g0wjPPhvEX8Lkz8ETnrO72mOkLySAq7+nMOf3vqj3nIjQ4RtKkDYqmlPYkfzHhJUmUWcympGZefqxjazZXp/BSGBjpjm3qgdAJuSrd2WTv3iNrVpe4YhOciLIkWdfOA4uOtNoF4+OZ27jVwTiDi9cG5rdfGTQuaaycvgkre2PG4Mt9o+HHkuuoLfi5Z+VdFRcIGOZsNGfABxAcwarN9PsaG4ubdxYe1lOfAhrqgNyRyJdKxYTw6w8nqtfvhm/kS59NpEXnidrdCEL8Cc33gJu91mKfqChKpYWZE3hui1kolwzz4NG2lV+TS/tsd3juzyki8j0G/VfgAW7mIXFW2jqk9rMTidX/mA6fJJc7ZcCCA1ht5mqqcm14pl7S5XAH1C8zJPzWyb2DRmzem8fPvJGrauznwEFCVhAVVYm8IxQ2N27XJxDerwbpTCl46LX+t7QS+Z0Qt++Xv6x9uPINJqAOxdiaiIfuh/F/pSfz2/xtZJhywwnwKtTUCMiCRvaIYaV8mGxOnb9dooI5f4hEjSr7gj2tZAYTLZO55SmvsqWAVI7cLM69vZA0Xzksr7LDsJPG1SgHU3J+uK5ymcgtDqeGPw08
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(83380400001)(66556008)(2906002)(33656002)(6486002)(5660300002)(66476007)(316002)(66446008)(54906003)(37006003)(8936002)(186003)(6512007)(64756008)(66946007)(71200400001)(91956017)(6862004)(4326008)(122000001)(36756003)(2616005)(38070700005)(6506007)(26005)(86362001)(38100700002)(508600001)(6636002)(53546011)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CD29B5479BF72C4FA988D381B1110880@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3990
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d06b15bc-1945-4704-eb21-08d9b5a7dc0e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XKtXysxgiZpDseVBRHMAnEEKZyKFOpmDXeweUxcPB9x2e7uZcoDrWY+3AfKQjwHfbA9lFAFWubAmyusaGaOkeixY+ISBfv62a17iLpCTRa+m+4nHaw5zfyjTGTt7NTC8m/sU9rQ3lqB6gIXumZntOiXkOGTy4i4xlCc2RbpPyTJmQH+XWMAWG3yENEYvKLK548RXBpkfJ3tlgdauTg/ZK1gMvkX/x46+tjzusUsvRUgYLiRHu5sSpl94WzcHA9Sqo/388rKTRV6nXrrSR0/o3jrgzfbdTFBmTIWXIeTbiSJq6hk8eh15mbiYVP+ySGzPAPpOA44PW5Qj0YJi9avVWU5y1BqJBR197jqutrB4EzvlNJhHxcZ2kCZd8ijniUihu/noum6q10Sh9V6gQxvZPYrNT/3WDCjXvUfJf3vsiVnBGjBkdaUFBX7m3PJeAQxjhZQsvdf1W1CoYD/iwrWweaIAjphMDu1enulyzyzU5I9vZQeBlo4Y4itTyraflG0ToPx3j3gnCza5iKnewWVj0r9GT5ToHmZLept9RtP8Tc8segpcuDpMhy+dwgmz3Zmq+KjhNLgYkUUpN/P05xz7naN+EryvtKj0BBUpryiBgkTjMIR2X6DGIijodaF9Ko2qdTZSdhYOSKWQV7LnxJjFnkcLp9Q7WqIk8kFn2feiZ2ZIAG5fcCE3ZQ/7KcE+8acN5USVL4hWDW21p+EIq2ZWHA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(186003)(82310400004)(6512007)(508600001)(6636002)(47076005)(70206006)(6862004)(356005)(36756003)(83380400001)(54906003)(2616005)(37006003)(81166007)(316002)(4326008)(336012)(86362001)(8676002)(2906002)(36860700001)(26005)(6506007)(53546011)(8936002)(6486002)(33656002)(5660300002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 15:24:57.9509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c68b9d-5032-4427-0486-08d9b5a7e66a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7354

Hi Luca,

> On 2 Dec 2021, at 15:05, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> The example in section "UEFI boot and dom0less on ARM" has
> a wrong compatible for the DTB passthrough, it is "ramdisk"
> instead of "device-tree".
> This patch fixes the example.
>=20
> Fixes: a1743fc3a9 ("arm/efi: Use dom0less configuration when using EFI bo=
ot")
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> Question: Does it makes sense to backport it to 4.16?

I would vote for that yes.

Regards
Bertrand

> ---
> docs/misc/efi.pandoc | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> index 4abbb5bb82..abafb34527 100644
> --- a/docs/misc/efi.pandoc
> +++ b/docs/misc/efi.pandoc
> @@ -222,7 +222,7 @@ domU1 {
> 		xen,uefi-binary =3D "initrd-3.0.31-0.4-xen";
> 	};
> 	module@3 {
> -		compatible =3D "multiboot,ramdisk", "multiboot,module";
> +		compatible =3D "multiboot,device-tree", "multiboot,module";
> 		xen,uefi-binary =3D "passthrough.dtb";
> 	};
> };
> --=20
> 2.17.1
>=20
>=20


