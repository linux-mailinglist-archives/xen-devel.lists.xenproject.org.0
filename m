Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 674AEA60BE7
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 09:39:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914040.1319861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0ZZ-0004Y6-Na; Fri, 14 Mar 2025 08:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914040.1319861; Fri, 14 Mar 2025 08:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0ZZ-0004Ve-Ks; Fri, 14 Mar 2025 08:39:17 +0000
Received: by outflank-mailman (input) for mailman id 914040;
 Fri, 14 Mar 2025 08:39:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rUO=WB=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tt0ZX-0004VY-Rg
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 08:39:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2613::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce905dc8-00af-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 09:39:13 +0100 (CET)
Received: from AS9PR06CA0509.eurprd06.prod.outlook.com (2603:10a6:20b:49b::34)
 by AM7PR08MB5446.eurprd08.prod.outlook.com (2603:10a6:20b:107::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Fri, 14 Mar
 2025 08:39:10 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:20b:49b:cafe::4b) by AS9PR06CA0509.outlook.office365.com
 (2603:10a6:20b:49b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.28 via Frontend Transport; Fri,
 14 Mar 2025 08:39:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Fri, 14 Mar 2025 08:39:10 +0000
Received: ("Tessian outbound 9ad6b0132486:v594");
 Fri, 14 Mar 2025 08:39:09 +0000
Received: from Ld44f9fc7a888.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B2D79FE5-0C82-4189-817F-63CDB51E8D0A.1; 
 Fri, 14 Mar 2025 08:38:59 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Ld44f9fc7a888.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 14 Mar 2025 08:38:59 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 AS8PR08MB9839.eurprd08.prod.outlook.com (2603:10a6:20b:614::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.27; Fri, 14 Mar
 2025 08:38:54 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8534.027; Fri, 14 Mar 2025
 08:38:54 +0000
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
X-Inumbo-ID: ce905dc8-00af-11f0-9898-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hd4u36cZFSnqhGHwvvXz9HwW1wTFt0LqfwAOAS0IfZJLxI35/gI6/679I1y4KHRF3InaKyDQ6bFoqgFKRrK/BwJ6bDnlPBq4qrJlwrJAPVpmS2/oYEBNZdzesHIMma1bVoEkGdW9Qy9gyLmxabavDfIgGjIXNrtKHU1c8f8slM1YIhXCfGMsJLQhmhz7CKZgOamTy59neMWV51MQwJIW+6Jen1XJlm/MPS8G+OyYXkUUhuckQci1zrK5SBR0wBrHhAUh6uik7uXNPg7UUqVqEHh34WGKnwAzYbM4RqfDhIrAYQHj0Pxq2+HEJ5j1KUH44P5SB/Rrx8dS4laMIrB8rw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIpJ/QXbFcaNW6CU1AOMQJHYaIjIQ2zyIL8VYp/zNEM=;
 b=g71cH2IBHp3XrQc/oTJkpOFzUCNJXZg4Ssg19PuqR9rK2nl35oGft3sJ+Im9ckZZCT2rFRbTfi9lhauN3V0pxPT0GinPba6lHPYXacZoBSTu+NDgHyMfMDWZF7cUQb+0DuiGBLZw3EnZPYmrSWNsTKWGden0GhNCnLphTdyEGudvTIDYn9i52ILMu71eHxnEffqxRFbWF3zefTN9fXcEfV03GLMshh84UKvIdch72/Ca6FQcIjcJ5ax+N1IFxdfEvszcKrjYJJ38GmdBY7kefo86ZggX8ull014ErY40GoB3KQbMqrhc9+T/e2poQ//BRquxvnw/WibFZyKInYbd4w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIpJ/QXbFcaNW6CU1AOMQJHYaIjIQ2zyIL8VYp/zNEM=;
 b=kSfXQ91NWkB8LGNyJ0HRfY6PMSWEvv20S/E2E9/RSm+bkD2QJG6YfCAKzCvwOt3C/XbFB3sqyf2yaiXoECkxMF2IAwRuRgoUJI9W7PobrwpptulpmxK0yh/5XRWBIUY0KKCa1eRPAAB2E4630OmNAmb3Ly46of7QkKOwZynaJgI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d1f6a30f01051b06
X-TessianGatewayMetadata: Ax8/LYHpMs+I30xcshHaUtsZF2TZzoKBaZlcphi3p2SspjwxC+/fHJ0OkOyhD2E8JVzpkFuRIFOtGnGjD2OsWQmzvsDe9IORHqiZNN5aaJjgkG0CSZfcZ8qvxfo3E5m8IOgQK4xWt7oyKnFrqXKBC1pJH+OdetljbNNr434c4Io=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iBVueHNuRDpn6vZsWrr/SD5fYeI5Gg/6/VFCjP5Pprp/XIQP7s49xq5OqMJwkaaqLns/Lf9XYsLC32WA/i94+1m32gKizrTLHoM04qQGWjfJp7kHhpQCCdG4osGbKwaTSW5wYC7adKYOV2m7v2K3FYxbb8g6boHaYBAGKwRNlURmGS2J0SkQxepIwMjDKGIUNbuu8mJ8Rs0Fvmjg0kNI4Kv4S62YfEkIBTlrOFyk3AtRGRkt1eIpcBqMa1wOTFuDzg/vUghZOyGfO1dWjQWqb7Bs9z93MBjQSBM6lOCxosEu0HQW4+zvo2qyxjLNKssnlNbqu/fUL0NDe0oLk9t1OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIpJ/QXbFcaNW6CU1AOMQJHYaIjIQ2zyIL8VYp/zNEM=;
 b=uAFMzKERgOf9DRm+aCf5BVrPDq9hBqRs7RLmpVYA8JDHxhQ9doGpw0MiC+FRsrDmiAcD+JVHMwWc9cgkY2VieYm0BuYsy8JjSLCn8X5dKwTPIUW7itK/N2/8nZb5W/vhRTDQcu5nFSrPq0+2+TzqEukGeYETswPYtjodhPWTN4y8Pht1huHCiDaa32vYCMhI4RIpaB92zG6QY/pN0H4JDS1iF81+j3UmkkXrGH6u5z1IeLrHx8KdmY8IruLSo77OcS8Ma5CRBSTDiRNM2Qbknas4MMyjaw9kh6Jki6q/X2Fpj6OuM7yGYw6y4bHSnQp+fUgG7IQ862KvDCBH5nmsew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIpJ/QXbFcaNW6CU1AOMQJHYaIjIQ2zyIL8VYp/zNEM=;
 b=kSfXQ91NWkB8LGNyJ0HRfY6PMSWEvv20S/E2E9/RSm+bkD2QJG6YfCAKzCvwOt3C/XbFB3sqyf2yaiXoECkxMF2IAwRuRgoUJI9W7PobrwpptulpmxK0yh/5XRWBIUY0KKCa1eRPAAB2E4630OmNAmb3Ly46of7QkKOwZynaJgI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 10/10] arm/mpu: Create the skeleton for MPU compilation
Thread-Topic: [PATCH 10/10] arm/mpu: Create the skeleton for MPU compilation
Thread-Index: AQHblLrsg7FroDMiZEOgcGIzwb6YQ7NyT28A
Date: Fri, 14 Mar 2025 08:38:54 +0000
Message-ID: <0FE3B1C6-3DDC-447C-9C3A-474E47B53299@arm.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
 <20250312135258.1815706-11-luca.fancellu@arm.com>
 <40606489-99b4-4cc3-b202-9abae4cd1ec0@amd.com>
In-Reply-To: <40606489-99b4-4cc3-b202-9abae4cd1ec0@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|AS8PR08MB9839:EE_|AMS0EPF00000194:EE_|AM7PR08MB5446:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ebaf734-ba35-4de5-f9bd-08dd62d3b0f5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?SWVES0pXYkM5aTRkVkhRSVlmWG1VOWpKbDBFQkwxQ0hVMGhBdWhFenhvU2J2?=
 =?utf-8?B?ZmpTajlvQjJ1TXZSTFhtYm5aUFh1VGk4WFN2STdyYno4Ry8rL3oyME1xK0h5?=
 =?utf-8?B?Q05LWVJRYXU5TGRSWUpuOUc0OGtOM2NTRWtyemFibW5ycHFWN0k2NnNLT3lx?=
 =?utf-8?B?b25XdDl1cE4vdThnamFUYVBMVEtzTVVUQkxKSkxGc2psMlMyL3hNMitvNzVo?=
 =?utf-8?B?bGd3QWJPcHk5WWcyWjd0dmpERU9Ta2EwVVlocjNmNHZqLzhpVnFLdlVLMFVS?=
 =?utf-8?B?eU5KTXg5TWt6cG11SEY5dU1md01QeTIzYWN1dnd5RDFlSk90RUV2d0wzbVY2?=
 =?utf-8?B?dkZFZnA4QjFNekFTTkJwK3d6V01oSlVwSHNFSEt3aFhSeUx6cnBKTWUxejBL?=
 =?utf-8?B?cmRURGJaN1ZocVFmZUMwa3U1SWEzR2pTdUV6bjBxMVlxQUdCTEpnaGMvMjJC?=
 =?utf-8?B?NE1nMFhWSlZtdHZMcWFLNXg4SDRsam1DYjd4QmM5eFpoN2VXZk9rYXFkNlJk?=
 =?utf-8?B?WmFuV1orSFNVM3ZLUjJacGFaWW1rdjBWK2dqemQ5NERtSDNkc29MM0pxVnBm?=
 =?utf-8?B?Mzl4Q29FdmdaTHM4S09OWVhSRlZ2SXFJdWJJTEQ3cFdvSmxmb0lEUE5HVnNs?=
 =?utf-8?B?OUYwMEd5YlpDUFA2Vnc2M2FoVTRlOTlZOGwxRXJOWXBXUGpWbFpwSUdNUm1O?=
 =?utf-8?B?OUVjK0lRcmE2RlhHTzMyQnNMQ1RRQ0FwRHRXdmRvaHRMSzE2VFRnVnVMWkRv?=
 =?utf-8?B?MGRWMG5hRmpPWDZ1OVZNQnF4STFUdTFObVpHcXNlcGh1Rk1kL2ltdzMzZ05w?=
 =?utf-8?B?a1llTlhMWk10Vmp6T28rLzFyaFYwZVpFQUw2SFlQSFIvZkZNSXdQSW1SaGxJ?=
 =?utf-8?B?WlY5bnZiRzJiNTByd2s3M2pqclVwd3BrSU9KUjVCMmo1c3E3b21DaDY5RHZB?=
 =?utf-8?B?blZkeHFCTURGcFUxd256YTFRNEF1UjMrV0wwVXdlSDl1TThUUlBHT2c3MXNt?=
 =?utf-8?B?UEtFamd3RGxZcGIxb2lJTHpPdXhIT0p2endHMGpTRTRoQlpYUzI2QWQrS2N4?=
 =?utf-8?B?RXRZMXkyekpwbCs4QXpuWjBRSTZxcTJ3bTdhTE9KdktHYjA2TkMrUmdtREVU?=
 =?utf-8?B?R1AxSG1ERGZ1bDk4RUJpVFNEdFhlMHI2ckx0b1B1bTJwTjRTVnpPSVFIK0ZY?=
 =?utf-8?B?RFdOdm1ZY004enFiYlowUlZnZUwrYkcyOFo2TXJSVnRZeTBFVXB4TWI0MFcy?=
 =?utf-8?B?Q0NubFR3cWdQVk9BRk44bkZtb2NqbHJKdHVxcE1PTm03VXFLRllSMTdtTTlL?=
 =?utf-8?B?NTE0NlhuVHQ5UHBWTW84V3l6ZjNPK0YrYW45L1hVYldjc1dFTzFVYUZLeHhp?=
 =?utf-8?B?SHpvR2xKZEJON05NZEp4eDNjOHJNTENsb2crZS9zVGhBTkQzS3lGWVR5WUQ2?=
 =?utf-8?B?NzBwWkRUbGl2OHpnVTU1d1NlTVZKaFA3Z1VIekVDdTlzekF6TmJPVklwb3J0?=
 =?utf-8?B?NGE4Q2JCL2NyenBIZGQzaklxTEdURTJzK0VIRGdEZ2dxdWFQLzZPbWpXL1Jr?=
 =?utf-8?B?N3VRK3FmdGJHaW1OK1pJcDFqdzdOR29OWW50K2I3S3dkVFVqRC9FSDJ3TEI4?=
 =?utf-8?B?Y0lEZC8rSStaN2ZST0krSGlmaEFWMTZGOWx0dTNnWTJXQ2tGZ3owZmJ4eGRw?=
 =?utf-8?B?eEJtWmVRcE5BUHEyNmxVTHBGc2YwaHlFc0d5UzBya3FXVG9PTHl2Q2ZlbSty?=
 =?utf-8?B?K0VZRi9hMG41aC9BTk9rZ2I0b0cxTTR5by9QMnh1OG9vL0wrOXNKNExlckhS?=
 =?utf-8?B?ekREVW42NHhHK1d6dFpWNEV3SVpSczU3dHcyZ2xYUHFTUkJ0djBEVExHcm15?=
 =?utf-8?B?V01oL3lKVXFidDN2Qy9XYytLNFFuQnF1YTFFeVB5OXB3Zm9mTEc3ZEVrOFlR?=
 =?utf-8?Q?hnX/iaRDH1CcNM2k2jr3Ekdn+XT50ETf?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED5939F992217F4DA70F3EFA540D0089@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9839
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:5:1c::25];domain=DB7PR08MB2987.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6baa3950-d22b-44f5-63ff-08dd62d3a7a6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|14060799003|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzkwcnF1aUlnRllwR294eWZMbnVBa2t3bzFVMjZwWUdhOE5yN3lsNVAzbldW?=
 =?utf-8?B?RUtRUVhyRFU3OUxDa0JreXJLaVp4Z25QZGtzSFgyNG9KZmplR0JHYUlwWGhT?=
 =?utf-8?B?WjRzZ2NrYnE3SGhzdW5CaE9zVG10cHM4dURVMHdsVUU5N2pDVFBiWnQ2YUd5?=
 =?utf-8?B?am5uV1BKbjE2d1RJUG0zOGsvaFR1a0F3cE81TVRkR2cyNDBFaDc2SktvR1J1?=
 =?utf-8?B?dnlXMFVpdURrNitsdGlVRXBXeVFUOVFISGlvUVF6eThTN3M3a3piSzBKclNP?=
 =?utf-8?B?d0RaczY2UWRFdndYT1ZQMzZlZk1RcnNLTE43Z3RQWXpqM3lCbmVtRWo3MHM4?=
 =?utf-8?B?S2FYVFhtbGhnZGpCL1BHODhjeXF4V3dwRUVoSCswbGgySmRXUXhmaGRUelRZ?=
 =?utf-8?B?bU14MmhiajFxOWthUmpGdVdnMGs1ODVla3RjcFFUTjR3WENRTHZBSEVNQ2dB?=
 =?utf-8?B?VEFZWENJTk50UTRTYmFXbHFxc1BPcndidG5Bc0FROFZiM1E4MFRjVzk3eGRi?=
 =?utf-8?B?MTNxQUlsbmRoWkFYc0QrbVZmTjU4NFlqUmtYRTVZWG81NnFLZ0h0MDB4d3FT?=
 =?utf-8?B?azVSZnh4SFoxczVSQldzQWpGc3pMcW5HUllIcUEwbDVJaEJPMmxaVjdkcmRj?=
 =?utf-8?B?dGIxeU5wc1VScEpTUzBDbkFTNXEreE1rTnZXV0w2TkhlcStHanlhTlh6SkNX?=
 =?utf-8?B?UjJ4MndaNjRXQ2FRdDZXelRtZ2tsTTFrcXZ0c0ZxYzRPc1d2Q0YwOUZESWZK?=
 =?utf-8?B?eEFoRHJvSm9ra0IvOWFtRVB5T3U1S2RnUDRNNjJ1NFVhMWVTWHlNMll3bkdI?=
 =?utf-8?B?QndFT2NiTHVnL2ZqRVVjVjJYT0Q0cVJ4MkJDS0RmYm1UT0xnNXZDN01BY3hT?=
 =?utf-8?B?UFBhcVFiYklqeFN1YUJGOWljYnZoSHl3YkFMTTVkZE5sQ2RHaHFxeWJSTEpV?=
 =?utf-8?B?K2kzc0svUm5VZm5FWHNoUHdKZHovcU9OSzN4WTRsSmsxTEhyNjQ4SVNNbDZ2?=
 =?utf-8?B?WnJUUUNyOGphM1ZoZUI2U294SnFjYVBISEIvS1lRSTZUV3Bva3NkNVhKMjBX?=
 =?utf-8?B?dUJXRFVNMDNMZ1A0TGFzUGRGRHM3RVgveTZSRFVZdkJmb0YrbXdXUm1OYlpS?=
 =?utf-8?B?MVhIckxjMVpEdEhwWFduNEpramhsMkI4Skd5QkFRTFZwdlNlbGdUOUErN1Ba?=
 =?utf-8?B?UStUaWJ4WWZPQU5iN2xQQzRLRFk2Z1JlWC84bUpGV01FelN4ejNPVzJoU3pm?=
 =?utf-8?B?T3pGV3poTGdTUjFPTWd1N0hlVVplZTBRb2FkZGZIQUc3UXVuNGNsZ21KVEFx?=
 =?utf-8?B?QXdkNXl1cnBaeE9VQTZMMWhHOUd0Yk1NcDJ5emxXVDcydEVCS3NMZGh1L3lN?=
 =?utf-8?B?N1hIYnYxeVFYMHZ5QjN1NnFPcWNFS0Vnb1EveG5sZk8wdU94MmlvVXUvVjhW?=
 =?utf-8?B?bTZSWkFFcUVmdDNwZ3h0MDVHa2s3VlZmMG12blB3Y2FZTVk2dVpDM0oyWmJN?=
 =?utf-8?B?RnFTWTRCUWNKQ2dsM0kxTEZYQzVISjgrTXpud2s5WkYzaThVc0xZaiswZjhO?=
 =?utf-8?B?VWQ1b0xndUhXZUxrVTkyd0s0emhYMkpZcEFLNis2L3JQZkJ4cG82cURUR05C?=
 =?utf-8?B?cU1PZDlERXQzbkROMWNZMk80YTBWbG5BN252WWczTkJHajkzcUk5enFTcjNl?=
 =?utf-8?B?Z1lXSURDZVAzelhBK1M1T3JLR053NXVDbmRCSWczTVFtM3F5Q1hDLzdqMTlE?=
 =?utf-8?B?dERJQUZjVjhRUS8rK3pJRWtyZjVqd09ZYUxIMUZsZUdmM05id21DYjRmVUo2?=
 =?utf-8?B?WThucmduNXZFeFdraWFVajhOUlZySTVXZENBbGxnS2VWbkNCV0dSZ0tYT2ZI?=
 =?utf-8?B?bHRJOG00R21TeHA1VjA1bDM0T1o3cU51L0U3bkdrSEpsQUE0YmpwN012QUp5?=
 =?utf-8?B?ZWZhaFFqNU5DY25iRjhBU080UmxzZlY1M2JObTBiR2dzWlVveTNpeEZ3YlpU?=
 =?utf-8?Q?orXzfajvV4HMzOE7IR473l5dtYoolo=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(14060799003)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 08:39:10.2228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ebaf734-ba35-4de5-f9bd-08dd62d3b0f5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5446

SGkgTWljaGFsLA0KDQo+IE9uIDE0IE1hciAyMDI1LCBhdCAwODoyNywgT3J6ZWwsIE1pY2hhbCA8
bWljaGFsLm9yemVsQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAxMi8wMy8yMDI1
IDE0OjUyLCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gDQo+PiANCj4+IFRoaXMgY29tbWl0IGlu
dHJvZHVjZXMgdGhlIHNrZWxldG9uIGZvciB0aGUgTVBVIG1lbW9yeSBtYW5hZ2VtZW50DQo+PiBz
dWJzeXN0ZW0gdGhhdCBhbGxvd3MgdGhlIGNvbXBpbGF0aW9uLg0KPiBZb3UgZm9yZ290IHRvIG1l
bnRpb24gdGhhdCB5b3UncmUgdGFsa2luZyBhYm91dCBBcm02NCBvbmx5LiBGb3IgQXJtMzIsIEF5
YW4gaGFzDQo+IGEgc2VyaWVzIGNvbnRhaW5pbmcgYSBmZXcgcGF0Y2hlcyB0byBlbmFibGUgY29t
cGlsYXRpb24uDQoNClllcyBJ4oCZbGwgYmUgbW9yZSBzcGVjaWZpYyBoZXJlIHRoYXQgd2UgZW5h
YmxlIGFybTY0IE1QVSBidWlsZA0KDQo+IA0KPiBQLlMuDQo+IE9uY2UgeW91ciBzZXJpZXMgYXJl
IG1lcmdlZCwgSSdsbCBzZW5kIGEgcGF0Y2ggZW5hYmxpbmcgQ0kgY29tcGlsYXRpb24gZm9yIGJv
dGgNCj4gQXJtNjQgYW5kIEFybTMyIE1QVS4NCg0KdGhhbmtzIGEgbG90IGZvciB0aGF0DQoNCg0K
Pj4gDQo+PiArDQo+PiArI2luY2x1ZGUgPHhlbi9tbS5oPg0KPiBJIGNhbid0IHNlZSBhbnl0aGlu
ZyBtbS5oIHJlbGF0ZWQgaGVyZS4gSSdkIGV4cGVjdCB0eXBlcy5oL3N0ZGJvb2wuaCBhbmQgYnVn
LmgNCg0KSeKAmWxsIGFkZA0KDQo+IA0KPj4gKw0KPj4gK2ludCBwcmVwYXJlX3NlY29uZGFyeV9t
bShpbnQgY3B1KQ0KPj4gK3sNCj4+ICsgICAgQlVHX09OKCJ1bmltcGxlbWVudGVkIik7DQo+PiAr
ICAgIHJldHVybiAtRUlOVkFMOw0KPj4gK30NCj4+ICsNCj4+ICt2b2lkIHVwZGF0ZV9ib290X21h
cHBpbmcoYm9vbCBlbmFibGUpDQo+PiArew0KPj4gKyAgICBCVUdfT04oInVuaW1wbGVtZW50ZWQi
KTsNCj4+ICt9DQo+PiArDQo+PiArLyoNCj4+ICsgKiBMb2NhbCB2YXJpYWJsZXM6DQo+PiArICog
bW9kZTogQw0KPj4gKyAqIGMtZmlsZS1zdHlsZTogIkJTRCINCj4+ICsgKiBjLWJhc2ljLW9mZnNl
dDogNA0KPj4gKyAqIGluZGVudC10YWJzLW1vZGU6IG5pbA0KPj4gKyAqIEVuZDoNCj4+ICsgKi8N
Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbXB1L3AybS5oIGIveGVu
L2FyY2gvYXJtL2luY2x1ZGUvYXNtL21wdS9wMm0uaA0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQN
Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uZTVjMGUzMDIxNjdjDQo+PiAtLS0gL2Rldi9udWxsDQo+
PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbXB1L3AybS5oDQo+PiBAQCAtMCwwICsx
LDIwIEBADQo+PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSAqLw0K
PiBFbXB0eSBsaW5lIGhlcmUgcGxlYXNlDQo+IA0KPj4gKyNpZm5kZWYgX19BUk1fTVBVX1AyTV9I
X18NCj4+ICsjZGVmaW5lIF9fQVJNX01QVV9QMk1fSF9fDQo+PiArDQo+PiArLyogTm90IHVzZWQg
b24gTVBVIHN5c3RlbSAqLw0KPiBJIHBlcnNvbmFsbHkgZG9uJ3Qgc2VlIGEgdmFsdWUgaW4gc3Vj
aCBjb21tZW50cy4gSW5pdGlhbGx5IHdoZW4gdGhlcmUgd2VyZSBqdXN0DQo+IDEsIDIgaW5zdGFu
Y2VzIEkgd2FzIG9rLCBidXQgdGhlbiBJIHJlYWxpemVkIHlvdSBrZWVwIGFkZGluZyB0aGVtLiBJ
dCdzIHByZXR0eQ0KPiBjbGVhciB0aGF0IGlmIGEgc3R1YiBkb2VzIG5vdCBoYXZlIEJVR19PTiwg
aXQgbWVhbnMgaXQncyBub3QgdXNlZC4gSSB3b3JyeSB0aGUNCj4gZmlsZXMgd2lsbCBsb29rIGF3
ZnVsIHdpdGggc28gbWFueSAiTm90IHVzZWQgb24gTVBVIHN5c3RlbSIgY29tbWVudHMuIElmIGF0
IGFsbCwNCj4gdGhlIG9ubHkgcGxhY2UgdGhleSB3b3VsZCBtYWtlIHNlbnNlIGlzIGlmIHRoZXkg
d2VyZSBpbiBNTVUvTVBVIGNvbW1vbiBjb2RlLiBDYW4NCj4gd2UgZ2V0IHJpZCBvZiB0aGVtIGNv
bXBsZXRlbHk/DQoNClN1cmUsIEnigJlsbCBnZXQgcmlkIG9mIHRoZW0NCg0KPiANCj4+ICtzdGF0
aWMgaW5saW5lIHZvaWQgcDJtX2NsZWFyX3Jvb3RfcGFnZXMoc3RydWN0IHAybV9kb21haW4gKnAy
bSkge30NCj4gWW91IHNob3VsZCBhdCBsZWFzdCBmb3J3YXJkIGRlY2xhcmUgc3RydWN0IHAybV9k
b21haW4uDQoNCk9rIEnigJlsbCBmaXgsIHNob3VsZCBJIGluY2x1ZGUgYXNtL3AybS5oIGZvciB0
aGUgdmlzaWJpbGl0eSBvZiB0aGlzIHN0cnVjdHVyZSBvcg0KYmVjYXVzZSB3ZSB3b27igJl0IHVz
ZSB0aGF0IEkgc2hvdWxkIGp1c3QgZm9yd2FyZCBkZWNsYXJlPw0KDQo+PiANCj4+IHN0YXRpYyBp
bmxpbmUgYm9vbCBhcmNoX2FjcXVpcmVfcmVzb3VyY2VfY2hlY2soc3RydWN0IGRvbWFpbiAqZCkN
Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbXB1L01ha2VmaWxlIGIveGVuL2FyY2gvYXJt
L21wdS9NYWtlZmlsZQ0KPj4gaW5kZXggZjE0MTdjZDFiOWRiLi5hOTYzYjM1ZGI4OGQgMTAwNjQ0
DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vbXB1L01ha2VmaWxlDQo+PiArKysgYi94ZW4vYXJjaC9h
cm0vbXB1L01ha2VmaWxlDQo+PiBAQCAtMSwzICsxLDQgQEANCj4+IG9iai15ICs9IG1tLm8NCj4+
IG9iai15ICs9IHAybS5vDQo+PiBvYmoteSArPSBzZXR1cC5pbml0Lm8NCj4+ICtvYmoteSArPSB2
bWFwLW1wdS5vDQo+IFdoYXQncyB0aGUgcG9pbnQgb2YgYWRkaW5nIC1tcHUgc3VmZml4IHRvIHRo
ZSBmaWxlIGxvY2F0ZWQgYWxyZWFkeSB1bmRlciAvbXB1Pw0KDQpvayBJ4oCZbGwgcmVuYW1lIHRv
IHZtYXANCg0KDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21wdS9zZXR1cC5jIGIveGVu
L2FyY2gvYXJtL21wdS9zZXR1cC5jDQo+PiBpbmRleCA0NTIxNGJmZWI2NjEuLjI4MTE5ZTAwODM0
MSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9tcHUvc2V0dXAuYw0KPj4gKysrIGIveGVu
L2FyY2gvYXJtL21wdS9zZXR1cC5jDQo+PiBAQCAtMiwxMiArMiwzNiBAQA0KPj4gDQo+PiAjaW5j
bHVkZSA8eGVuL2J1Zy5oPg0KPj4gI2luY2x1ZGUgPHhlbi9pbml0Lmg+DQo+PiArI2luY2x1ZGUg
PHhlbi90eXBlcy5oPg0KPj4gKyNpbmNsdWRlIDxhc20vc2V0dXAuaD4NCj4gUGxlYXNlIHNvcnQg
YWxwaGFiZXRpY2FsbHkNCg0KSXNu4oCZdCB4ZW4vKiBmaXJzdCBmb2xsb3dlZCBieSBhc20vKiA/
DQoNCkNoZWVycywNCkx1Y2ENCg0K

