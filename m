Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2EB8A26DA
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 08:42:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704390.1100791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvAc9-0007mG-Nj; Fri, 12 Apr 2024 06:42:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704390.1100791; Fri, 12 Apr 2024 06:42:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvAc9-0007k4-KH; Fri, 12 Apr 2024 06:42:21 +0000
Received: by outflank-mailman (input) for mailman id 704390;
 Fri, 12 Apr 2024 06:42:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7X7o=LR=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rvAc8-0007jy-Nu
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 06:42:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2042.outbound.protection.outlook.com [40.107.7.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ceb97fb7-f897-11ee-94a3-07e782e9044d;
 Fri, 12 Apr 2024 08:42:18 +0200 (CEST)
Received: from AS9PR06CA0303.eurprd06.prod.outlook.com (2603:10a6:20b:45b::10)
 by AM0PR08MB5329.eurprd08.prod.outlook.com (2603:10a6:208:185::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Fri, 12 Apr
 2024 06:41:47 +0000
Received: from AMS0EPF000001AD.eurprd05.prod.outlook.com
 (2603:10a6:20b:45b:cafe::6b) by AS9PR06CA0303.outlook.office365.com
 (2603:10a6:20b:45b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.22 via Frontend
 Transport; Fri, 12 Apr 2024 06:41:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AD.mail.protection.outlook.com (10.167.16.153) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Fri, 12 Apr 2024 06:41:46 +0000
Received: ("Tessian outbound a35d20b28d50:v300");
 Fri, 12 Apr 2024 06:41:46 +0000
Received: from 4edb33a6fcb5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D6230F59-FA42-4F23-B900-50E2133A3DD5.1; 
 Fri, 12 Apr 2024 06:41:39 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4edb33a6fcb5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 12 Apr 2024 06:41:39 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV2PR08MB8368.eurprd08.prod.outlook.com (2603:10a6:150:bb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Fri, 12 Apr
 2024 06:41:37 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7409.053; Fri, 12 Apr 2024
 06:41:36 +0000
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
X-Inumbo-ID: ceb97fb7-f897-11ee-94a3-07e782e9044d
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=h4qlGpMaMvc8MotF4JsqLPHUqGmebgN7qweGP/E7KI8TtxAFlxKxTOsgSJegV2tqTQuSPz15q1mCy/WVhslXHW3ay/jzli27iETMgyIR4p5B2kRjrNUNh9O5i8q+32GVVazSXnXuVuwfjge7gN9zDGntSnU+VIKAZRGG+kPJ9qlPeid6U/T0UGhorueIsoXZM/T77LdqrdDjNFz2HOYUy3usvGbnflqlAZXRkuKVjsosytOKxu18kaEECDySCed93fdwVl1ExrrxmxvUBF0872PFvn0ZkjG+QyAueLjc2xBAwrGcFZCU4K2sbbzu/qLffDYwCIJlYglcyaXE1emx3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SA/uD8A2vbVbQ6ThIoMN05l9FB+RL/50yNt0SKJQSHA=;
 b=frwrFW1mti5dbjJ2z4eNzZLOTzTQztYlUNf6vCaPhH/ns0boIKeA2hHEddXLt8djQ196ZSeGj6ffNlx6CGLYy4fe3+iHo/Qcq3LA0g0sp6PkXQ1zyKEf5OI9QjnJ49PYzURor4xb6fLjYX8HHk8lA3//XutQ4YrdsNP/XMl4G0OpNWgeB2ag1s6xWKDQsSCaYdoSAtwubtLl5DHt14Qk8OV5elFH9/bFF2oKTRuA+76jsOvPyT1YBSPjpaffSEyNiCUf6cVyZlhuYNbAXKN7/gAbGowM2nAgiQpNk858xwump2PQ8vHtIMOyuW1mTCQEVDf+oti2DSpMISDzjjfT5A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SA/uD8A2vbVbQ6ThIoMN05l9FB+RL/50yNt0SKJQSHA=;
 b=XEXs8ylasf4lmHEuL1x12IzL7nHCYg3c7xnK746uzxYVYA8cccJsg1wPAIArFxXiJRrroOuOm9I6Z6ymCKsKdIP+Vi0Z4oNFCzJbrEr9kn4McFokiBSFV/CQTrhwrsITnLfVPyfoPyg0gJCu2IXAz9xPA98HOwtxQ1C+8hMPxv0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f97ac9e5817e77d1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbsNrIPeWB4nK1XUrMWbcFDnp8oBD/BM1vDhtZAMgj+ByGKRYWYjyudbDJAYO35ehdyxCj+S4LpmX0AgiEqrBL4lZLpwno9obJ24u+1ZpjyC5BtFdiR5gxIHeAewMapWR5pHjyZBUVnoiv6eG1JIeVfrdz8H74wYZOOF+DzUqvtkqPkFQLjIXIeE9Ki7yDVFyJeHKAhi6vT9gF88huEidnWf5M9W69jj1ViFA4ehaLTgkyvr75wA+tugO5Gh25SiWBLRUaZTsFmwvzoVLmEqNxpSwIRyFDIKln1lMYOrn6d3zZ+Pix88bIE5C7FFEleE2N+PxXlA23To+ObY2TAj1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SA/uD8A2vbVbQ6ThIoMN05l9FB+RL/50yNt0SKJQSHA=;
 b=VCZua4qr7gnjT5/9p9V1rNh0muBoANpF2AgYqPjLHhUo2SKkyw1obksbU0tI37HakE7G2F4nDM3DuZbxcDw1FyFTUSiz2IRh0vT8o8HKwayugRdcgI7Z+bd2U1896FRMXEAjp6cyF4eLgnpPgzaoo3y42Jf7q9k/hHW0vadyEipP7uXHqp3JJfmjJipNISM62V66JXR6XW3aT5iTjHYGRg0/xlF+ciBO1uaLuBR5ogNTRc5XhXbeXghHvUMD++dsRqgu2m+jk6TKRffhChsVikBcFE2RRk7BvPE6UxEmL7Qnsg+skVeUm0Kkj6NHdfFf+g3t50Y33SDyG53E+AjrsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SA/uD8A2vbVbQ6ThIoMN05l9FB+RL/50yNt0SKJQSHA=;
 b=XEXs8ylasf4lmHEuL1x12IzL7nHCYg3c7xnK746uzxYVYA8cccJsg1wPAIArFxXiJRrroOuOm9I6Z6ymCKsKdIP+Vi0Z4oNFCzJbrEr9kn4McFokiBSFV/CQTrhwrsITnLfVPyfoPyg0gJCu2IXAz9xPA98HOwtxQ1C+8hMPxv0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] docs: arm: Update where Xen should be loaded in memory
Thread-Topic: [PATCH] docs: arm: Update where Xen should be loaded in memory
Thread-Index: AQHajKEMfWuddRL5+0C93ODmeh2G77FkL6AA
Date: Fri, 12 Apr 2024 06:41:36 +0000
Message-ID: <486125C0-3DB3-4A64-8B6F-8BA8A55EC1CB@arm.com>
References: <20240412061624.3441-1-michal.orzel@amd.com>
In-Reply-To: <20240412061624.3441-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV2PR08MB8368:EE_|AMS0EPF000001AD:EE_|AM0PR08MB5329:EE_
X-MS-Office365-Filtering-Correlation-Id: 9540ea9b-0704-493b-1dce-08dc5abba002
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JvbqCTqTpNaYaFR8NZK7C/WvNUr83QLkLZ7ZsZ+BEEUL6uoZSQenQH/zBmkReo5y7chnGA5RH2jmWWQ+KshQ6JsPNicCUEZxmqyJ94pCqoBpNybcg/px1EGrLe1DWWOO7OUytfDYupj2M/xvVJ8mi51SgR0zWXuZAYj+bVuT+NMkoPIxPuk0ld5aEn4SvxYI8CXnPms9Z4naMFg5BnKHYXi7Iei0jQbsCrhuQghRWSrXtQuDJsPlh0y2kxSEHx7HxATXkDMvXIE9rc/hrpC8eI67+Q3NovpyHK3L37qiAACVpNU30UBGFX1L5mgPeJZ+w32irY+qWxDYG0exxAxXBhpoR/54li10hvM/OLCAHCJg2/vSVFfG1QmAQDSHrswdAJgwov+wuOm6AfMQaVu2A+By9ms4vCQ9S7rX3VEtvi9Xgrg0cY7qZPGAOyt2Tb1Oqfrr3HwT7ZtpNRxoD4+ryGEicwi6J+1NOpyWOhN02+RFd7KV0XNuEMlmAi46tmQTzBNO+NN51ABv5M4WcIcfd96nkf+rydo7lPFjhRCIr8njG/9sdaajOsHzXsQMzqze9yJHvz/MKsAzEPHfPvK8KxAvyLjKYHVU1IuXGO+drAUDigYsDCP9s0EUn0ha1FWSssQiRUHHM3crM2frFn/YeCpbT29mhgRuD/OebiJU2m48CYXg0UAo1TiCfzJYdHlwBSKopU++JjO45gJUKXosvlLbKAMJ32RAGB8M6EfKu/g=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <ABFCA75F8896214195DEE26FB4E36E3F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8368
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	63c6f1b4-9342-47da-6a58-08dc5abb9a03
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ef4+rOX1XkOY9UOQr6PTR+j2qoXhyvpryk7T1qM+0qGpI2hdRbTqPUUAGOVgKSEidpwtOl33e8dObJs1yIt70GlfsrAdkmZJjEhqB+m4eT7SYgqGoQVGCvg5d005M7dJIdaKu/reEundwOv8vCay1+TbELxfMrCE1LzhZl64lBvYWnxqettw4ui8M5gdqZeF+BzAUnPOJQBOACIF5BXqfWksnsYyRV2PgqMrAgGG/n5dAQH7BBneaGS9IBgfC4WtARKIPKpd7Pr3nxXdRo3eIFTXyHIiwqd40LGwYPWAfngyFlnBvRbyH3YNJH53EK4yoqMK9wZlYWhaLEUwNSNcY23PczRf8ZyQD8fzGPNvXSjebfcw6oGMAiJ/qlrYtamt6tbvmw91fJV0eOw5HAeLdC/RfXBBWDqCJYbpVWP1L+Ec8PLcDuvA3SYBelQ8XDqBAFrmAI4Uy+VrAw9vSjv7VrrcPuLiOPQjp6lxl5o9BAkQE5Zf9LD2ejvyTskFDqjyWKksc6cexUabpGPPPtizjj0GvyewglRYo2ZtBnwhB3Uc21Q8Xs9OtVdugHxdJwAZK/v5UamamPHFTN042nDDCJ0ot1mZ3iAgA98lsvtrLptEtHuGXz/0kiqH37emJhzZDCHxmfuduKjfzzb0hJcydBv+mHfztsT9iqbkMNQ8iYkR5cXfi7epS+L6UHuy4AqnevDNIMUrqu7wqpZZdPwfa3JcIQkYWMaLm5LaeT9/68smST0KriM86nay2FhGfhKg
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(82310400014)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 06:41:46.9020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9540ea9b-0704-493b-1dce-08dc5abba002
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5329



> On 12 Apr 2024, at 07:16, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Since commit 6cd046c501bc ("xen/arm: Enlarge identity map space to 10TB")
> Xen can be loaded below 10 TiB. Update docs accordingly.
>=20
> Take the opportunity to update stale links to Linux docs.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>




