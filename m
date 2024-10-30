Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF7A9B5FB9
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 11:08:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827982.1242761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t65ct-0008SR-93; Wed, 30 Oct 2024 10:08:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827982.1242761; Wed, 30 Oct 2024 10:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t65ct-0008Q5-6I; Wed, 30 Oct 2024 10:08:31 +0000
Received: by outflank-mailman (input) for mailman id 827982;
 Wed, 30 Oct 2024 10:08:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZK+=R2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1t65cs-0008Pz-31
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 10:08:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20616.outbound.protection.outlook.com
 [2a01:111:f403:2612::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e70c887a-96a6-11ef-a0c3-8be0dac302b0;
 Wed, 30 Oct 2024 11:08:26 +0100 (CET)
Received: from AM0PR02CA0226.eurprd02.prod.outlook.com (2603:10a6:20b:28f::33)
 by AS4PR08MB8022.eurprd08.prod.outlook.com (2603:10a6:20b:585::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Wed, 30 Oct
 2024 10:08:20 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:20b:28f:cafe::8d) by AM0PR02CA0226.outlook.office365.com
 (2603:10a6:20b:28f::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.26 via Frontend
 Transport; Wed, 30 Oct 2024 10:08:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009BA2.mail.protection.outlook.com (10.167.16.27) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8114.16
 via Frontend Transport; Wed, 30 Oct 2024 10:08:19 +0000
Received: ("Tessian outbound 4f9bb016c0c5:v490");
 Wed, 30 Oct 2024 10:08:19 +0000
Received: from L3f38e68b004f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 11F92382-86A6-467D-8A67-F4F1B595F35C.1; 
 Wed, 30 Oct 2024 10:08:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L3f38e68b004f.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 30 Oct 2024 10:08:13 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DB9PR08MB7770.eurprd08.prod.outlook.com (2603:10a6:10:396::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Wed, 30 Oct
 2024 10:08:09 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%6]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 10:08:09 +0000
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
X-Inumbo-ID: e70c887a-96a6-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMjo6NjE2IiwiaGVsbyI6IkVVUjA1LUFNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImU3MGM4ODdhLTk2YTYtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjgyOTA2LjI1Nzc0Niwic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UtC4ziTr2XiX4IbwM+NeW9LnnK0qfLw8LVHVsPEa1/s3tgxDcgJ7QpE4cKpfIz7MFIeHiQLcUxQkIhJTJMt7wpaNi5RycXvOCmwUSVVsxZ6QH3offVQ7CIbu2veNrbuxWMtAQ/bLybzbQnhKmEQTF6whR19PkyzRfP/rBfTEky5fQVm6ySKHXJEVDQAe0HpqS0eF5LIeanUGykOnyVJGlW2P3oWRyumr8ETPhKR1e/mgraEgCLML5sDMTB8cnTVSxCVy8WP+/8JEqtQ7sDQ8ySqG6f1GQYOtElF0J4puQfhJkRV3gKr0oY79QIeQexmYIP0vRRXoWpg8iQWa9o/WMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upE9IaCDrPH45d35ED35SGKZdtetYYVzm4el82dTgTo=;
 b=aekUPiN2btp1mZGW4YzpMRXtmfdij1JWKOsq+6XlrmV6tdWiXEnF41RyXiT6/JfBRUHYHcZb5eJSUv0zJz8IrwyBs2Z9dGvlxeQHUmOktbCyzd2l6hegsKv5O9PI4B2Zi2iy/xfTMLHWtdkyH5Q5vDQxXv2I7eKYpPxlkr8C5GfE5+gn9Rm6RSJpDFHLLq2M+DqfagosrNMJZyzv4VQPKwCtAM7X67pdaRJrZyOOA9eaRBlGX4tB9HIyGtFbBSkPJxdcCq+WPJrEN4jZqfjlovR6RKi5vwK9IwbRdtzn4Nel25HKNaTAspRzegnekklO1DOQpOAK/N0FhRf8gwuvjA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upE9IaCDrPH45d35ED35SGKZdtetYYVzm4el82dTgTo=;
 b=eYn7cdm+kZ1GOZKwy3G5/EVnSz7b490IF0duXH6y20mxGNDXaMtglk+GC4nqudBWUuLbITuqOzzYrnCbh9ifFReARa7yBl4RfhLElcFterVhdFWr+aFdvImSTLVU980ev34o/UZI3euE0PJDzyVrJL9O1nS2/kEdn/DzZ+OnkYo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 82e2d6e56b298563
X-TessianGatewayMetadata: nB1QazjEBVMvTrPa2jS5hsJrjN95bKxoJZG6Hui7wR+TW4qC+lEx43g2Y0decRqQUDynTAl/b2oTTaHGXueyNWTg1zMQ+DAFdJ4uCbEUBF14i1nBZftA7o7DcnaDXrOcJHqFksoJjLSk1jRaw5kIP8nQexHmvYdL23Z2O1Syd9g=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ESqhMtPgBYo0ceSj9tqHjZXbtEeXRk09kyAiUzM6DEHeXIYrdB0/0+O+x6QZTPPoMt+v1DC8Skmkl/rMYIw80jLARJ+Vl+FWmjtSMa9Arpj/hf/JAa15HKDleeaetXragHYPFnR0SYmivVmwQMvSeQ0sVbEKySyNblRFf97p1rFkVu3EpN8qPetwStzsPnFsGRK6EWXhoK/jry0IVXtNNW/BQaaoBHN3dHi5czqyaKD3RtXfcq2o//ND5zvUcbaCE2SsMHygqlKg3jsT/Qoyyce2nUYCLAsPflCta4WDMWPx0qkr9oNd9iXows4qLOYsVxUcTUzRkrK17ATWZk2Yeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upE9IaCDrPH45d35ED35SGKZdtetYYVzm4el82dTgTo=;
 b=qJl6BjM0/BVjfJLBnCSBvv6mESTOPmtShhVMqkaYRrVXoXQ3au+KjIqi7qeNYyHO5RYRalP5q0t//+LV60C+dThpPbeHPr0x3EG20VCwy25d3YM82eEMavrN0kTarSTJmIRWTrSvLNrlXSf5edBkW5OecPHRoB3e5imUXXCuV7BPZ+SAnjv1a18a2nCGyoS2rnb8nNuapdNs9kV/P1KMZ9XgnK/MHYptPRUXHHcFiOKASdAEGyBanxx65aUKGmY02OKEtSNln/FZ9/qo7QfFv3aE05aCiVb04zbQIo6Z/s+bvBqMuyiEBC854wAE8jMPn0hsOtj12ome4y49YzB5kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upE9IaCDrPH45d35ED35SGKZdtetYYVzm4el82dTgTo=;
 b=eYn7cdm+kZ1GOZKwy3G5/EVnSz7b490IF0duXH6y20mxGNDXaMtglk+GC4nqudBWUuLbITuqOzzYrnCbh9ifFReARa7yBl4RfhLElcFterVhdFWr+aFdvImSTLVU980ev34o/UZI3euE0PJDzyVrJL9O1nS2/kEdn/DzZ+OnkYo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien.grall.oss@gmail.com>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 4/6] xen/arm: mpu: Create boot-time MPU protection
 regions
Thread-Topic: [PATCH v4 4/6] xen/arm: mpu: Create boot-time MPU protection
 regions
Thread-Index: AQHbKTd3r9ds8GMpC0a1KoGz65CsELKfBnMAgAAKAQCAAARNAA==
Date: Wed, 30 Oct 2024 10:08:09 +0000
Message-ID: <3963FE44-9ED1-4462-BD42-DA1B1A5040C5@arm.com>
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
 <20241028124547.1371867-5-ayan.kumar.halder@amd.com>
 <FE41FD6C-EBCE-4EDA-ADD4-E09A58773763@arm.com>
 <CAJ=z9a1d2vzXh-fK5E2z-k4SOjE0cjJUGfFnaJiobvQpS+Y5Rw@mail.gmail.com>
In-Reply-To:
 <CAJ=z9a1d2vzXh-fK5E2z-k4SOjE0cjJUGfFnaJiobvQpS+Y5Rw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DB9PR08MB7770:EE_|AM3PEPF00009BA2:EE_|AS4PR08MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: 65349b9d-9e21-403f-d3c6-08dcf8cac7aa
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?c1A4V2hDQVlvNVZyYlNlZ2EyZGUwYzRSdkRzSXpQSHZPUlI0a2FkZnJvbERK?=
 =?utf-8?B?VDcyVmJsdkRHZWRSNkliTUR3akFjREViKzZ3K3lyY3YxSnZVVzFrNlRXSmov?=
 =?utf-8?B?V1Q1L2E2U25YdURwdGcvVXRNVlJDdnBqRHFOeU1iQUpCU2pzMnVLZ0dKWm85?=
 =?utf-8?B?V3RRcEVidk4weUYvR3ZFZmJneW5iMWc5VXBhUk9NSmFzamxsREMwR3dPTWtD?=
 =?utf-8?B?VWF0TlA0NGRiVUdOTHphNDNxMUtLditIVUZaV2Q3RytQV2FSYmpmdTFwK1Vp?=
 =?utf-8?B?YTZJd1VUdFhCUUowcDhOT2FMZVRWclAxSStoSUJ2N21xQlVYMnJwQnR3N0Iz?=
 =?utf-8?B?Z3JUTHhWMm5KZFVYcnRGejlXdGNtUENhOXEzd0pSbSs2OGpaTVltMDhabWhJ?=
 =?utf-8?B?cGh4WC9EbCt2a0hiQ0pReEZTWlhuaTZFbFFsYkJsRGJBNE1CQnd0ZnNGMDJl?=
 =?utf-8?B?WVNIdEZWclJlUkFzZzRqS01xWlJuRWZVUkFXbC85aS95UndjajN4VHJSYzJm?=
 =?utf-8?B?K3hmMHZIU25vdWpKR2QzSDBpR2dWdDc4UTJOWXVzbmd0NzNHQURPOEdHSjFt?=
 =?utf-8?B?Nm5ma1J5NWNQT2pjbS9wUzhHSVlZZ3JsRUJEdjN0Yk5LTk1lRFU2M0Z3elM5?=
 =?utf-8?B?TU4rL0hLbWVXMFBXa1FURGtxVmlQUmc2MXdjWEVwVmc1VldKN3ZBYjFtWmhH?=
 =?utf-8?B?R05aSithRTZuSTNzVStRbXlHVkpya3RrUzBOV2RYM3pzTUcyVmxaMHdleWp0?=
 =?utf-8?B?cGp5VElBUzNhNnZ3ckFBbFpmMkozVEVuNzN5c3dqQmtsREtxV0tXYzkxUEdw?=
 =?utf-8?B?K2M0UHN1eWFhQ1FZSnFMa2dTNHNwNjBieDJ5MHVud215ZEZpVEREbFFPMzN5?=
 =?utf-8?B?VHNLbko5amo1VSs3a1BLcmRscTJPOWM4ZGt0SFBqQ0ptc3pVNVlGMnRDRm1P?=
 =?utf-8?B?OUtaS09kcVBqUzNnUTdmL2NHK0FGRTExRWp2TFFCMkI4Z2ttZFFwYnZGUU1M?=
 =?utf-8?B?TmEyU2IxSlFiODFPQWVHYlJpM3kxYnFaNWx3ZS94TWJpdUVTWWxKMi96TWZR?=
 =?utf-8?B?ckRaNU1sTW9MM3ROQm5yVDBXbnNxK1h0SWdVeVh4eS9mZ2puT09UeUV3VEJs?=
 =?utf-8?B?TmExSnQ3K3YxcFduRElpczZaelJCWkU4cDVhTUZHU1IvNnB5ZXplN1NrZXlP?=
 =?utf-8?B?NE5IZTloUmlHdEZuaXlBSFd5WGNOV0xTa1FFSGRPYk92c2M2Wmt0ZzJtOWZz?=
 =?utf-8?B?dVVMMDZSZFVxWG95V29sUmFzL3VmbXBrQ1A1dy80TVk0RndUQW5XejVSeWh6?=
 =?utf-8?B?eHpVK3JyYjFDK21BR2tzZFVrSURCeHM4QjRZZk1FcUNtdDl0dnVwbW01NVor?=
 =?utf-8?B?MHpNbU9VN3pkNkhUT0xaVFdhRWpCUktCOWtUVmVWblBqLzBwOXJMMDlVQXB2?=
 =?utf-8?B?a0hjWVRIZkQ3L05sRU11bXArbHZVSTAweFd6b3BiaHFmc0ZvaUJVVjBCZmVB?=
 =?utf-8?B?WDQwUmlRNVJQck1SbmgvODI0cUJYMDRIUitlR2JNSFpGd3dlVmlnTzRLWER0?=
 =?utf-8?B?am5zQUdlUThsRk1OK0syeHVKNll0SGcyRDVsNEFxRkIzZFZSNURjdVdvQ2NX?=
 =?utf-8?B?a3lpcXkvYjBHNjFhRVg0R1FlaWdXeGJCczM4MWYrTS80clJsSlo5b1U4TVdi?=
 =?utf-8?B?ZTNJb3k3UnhjU3VNNUZzYURoaXh1WXZuRzlpanN3UnAyMkNjUlYwellKWWJY?=
 =?utf-8?B?VE4yZnVVK1lVR3BTQjhoazdzYVFFclQzWVArS0d1MFpQV29WVjdMdk01cnFV?=
 =?utf-8?B?TWRKSDJBaWtKbXJpV3haSmp6VmhibzRQRlpJeC95SVBvNWdkc2EyT1pncjRw?=
 =?utf-8?Q?CM3XMjl/tc+/f?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A52AAF3DDA4B5C4F951B0797960F3BD3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7770
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d08158e9-b80a-4273-6d9f-08dcf8cac173
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUVpa24vbk9SM3J1WTRFT1pYWWhBbm5tSGZaUDRNVE9nTEtscktEOVkxd05C?=
 =?utf-8?B?MUZsazdxMFlFNmd4QUhpbU5GdzBybktqcmlyd3M0QktEVzRNUzVZUExLbmJR?=
 =?utf-8?B?ZVcrZ1REdWVmRHE4VkhNNE56d1V3NUxNZmQxdU5vVXJnNzNWUUVTQmVJK29k?=
 =?utf-8?B?Y2FrRXpOT2ppaEdteExVSXd2ak5nR2pOOUdOT0w5Mk5TbjhBcXpvYVJvTE9r?=
 =?utf-8?B?a0ZuTnFLWkIxY2NEcXRoSXJLbHFySUtnUXBkUU4yN09VWXJkTmFUbXljcHh2?=
 =?utf-8?B?TlFDM05IVHZ0a2lUL3dwTHg3Zk9zMXZxdjRvaEt4b2xCa09ER1B3Q1V5RE56?=
 =?utf-8?B?NHpGZzY3V01mMFZ0dHR2S2dVL1VIUGJlMG1td0hKZStSNzE4d2k5SDcyNnls?=
 =?utf-8?B?Z1FId3ZjVTBpdlNkWDhlSDMvVGZTbFM3WDVZTnhIUE9UaUo5bTU2RCtMMlVk?=
 =?utf-8?B?NUE3b3puVHFnb1oxaVl3Yy9VNlc1b0wxT2cyK1g1NEQxTldXc29aa2x0SXdF?=
 =?utf-8?B?bE9ZZ2ZKN21ybFZoY0JSYTVlcXFkblFRVTJWQkd0a01LTVp0eDRwbHhsallV?=
 =?utf-8?B?YTN4S21TaFppczVkR0VJY1AvVUhuZVN4Y09kS1F4K3FWc2FGYU14Q3hPVGFu?=
 =?utf-8?B?aU80dEdLOURjNlluQlpabE0ydHdSSWR1dWpiKy9HY3VHbE9jQ2NOUjlsM2lk?=
 =?utf-8?B?cDRQSXV5dzlCRFdhcGpnNU9qK0xYTk1wSElVSGcyeC9jelQzelNpVDhsYmI3?=
 =?utf-8?B?a0d5SGdLY2M1OUpuT0x5MzN2SmdjRk42ODBXdWZSeVVUQnIzQ0VYeUdRWEk5?=
 =?utf-8?B?aHh5L25RcStaQXE5cWtCMHlqVHJqbi85NlNEL1krbmk3UnR0VU5IbWFDNUMw?=
 =?utf-8?B?MGd5czAzMmRmd0w4YWdVdUNLRmlZYlJHMDNzTFp3aWxkSUpYQWE2c0NEZXJS?=
 =?utf-8?B?OG50cnFuczU0NkxPcjNTWlFxYTZsQSt6TGVYTU1abTgrWnAySHJjanpYMFRv?=
 =?utf-8?B?NFdlM2pPd2RtNFFqb3N4VytMZjFkbGltYXBEMVVzTGpTaHV6SVp1aXYxdTZP?=
 =?utf-8?B?Z2FSakNDcmV4MG9QMndjN0RmZWNFM3cwRll3R3JHamdESU4wbnhLT3V6dkxJ?=
 =?utf-8?B?QWpzNlgyQ1ZrRk1CWmtVNWg0bkQzb1hHL04wYUpvYnd0bVh5Z1lFVENnNGVl?=
 =?utf-8?B?WTlaYlRyK1lHWHZZczdObkdGcEN3T1VsS2JoM3p1VmJpci9EOFozeEdPNFdM?=
 =?utf-8?B?bkpZbjZHajBiZzVBN08rcmNxK010MmpCTmpoNDZ2dUJRT3N1YWd6RDI1UmMr?=
 =?utf-8?B?OVlHUE92cVFkQlJyNWd0YXFMVU14SjdIS3VZUGFwaGFtcm92elFDNEtMaWZU?=
 =?utf-8?B?TUdvemRWVm90aUFOVVE1QmNjTVJ6ck1JNnZpblA1SUVGMXBPRmhJbE4yMkcv?=
 =?utf-8?B?M08wSDdrVWRXMStveTZKRXVWWjJ2VlJISXB3QU9YSitvUlNWbVBUaVRHeU1C?=
 =?utf-8?B?UkpZcXZtbmh6S20yWVJlaHh4QUErTm16anBiWXpMMjJ4N3Bid2tJN2gyMGll?=
 =?utf-8?B?Qkx0am0zZkpwcTZxL1ZGQjRIV0dhNWRKV0RyeG1DSndyVlRVWkhMazhVZnh3?=
 =?utf-8?B?Rzg5K0dnZmxHdkF4VFE1MDE5WjVhYWVXOXFNZEpSSDU2U3VyK2tneGFzWmxT?=
 =?utf-8?B?UlFvZGVMQmhqRThaMFhmR0VPblJQdmRINW83K1l0ODIvZkl5SVY2SmdjL2Mw?=
 =?utf-8?B?Wm9LZmE0VGZTWFNQNEt4cHgvbHlvUm8zYVhJZjN5a2VBZ0J3WEJ3THpvVk1x?=
 =?utf-8?B?S2pQbjV3SXdhVUZtY2xjY3psU0tDTlJZeENJY1BTd2FUcWp2MnpmZWFvNTdI?=
 =?utf-8?B?RGg5VmJvQ2M3VFBqa0hwMkM1cU1scElqQnNIVW1XZEdLQmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 10:08:19.6086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65349b9d-9e21-403f-d3c6-08dcf8cac7aa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8022

SGkgSnVsaWVuLA0KDQo+IE9uIDMwIE9jdCAyMDI0LCBhdCAwOTo1MiwgSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGwub3NzQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBXZWQsIDMwIE9jdCAy
MDI0IGF0IDA5OjE3LCBMdWNhIEZhbmNlbGx1IDxMdWNhLkZhbmNlbGx1QGFybS5jb20+IHdyb3Rl
Og0KPj4gDQo+PiBIaSBBeWFuLA0KPj4gDQo+PiBXaGlsZSBJIHJlYmFzZWQgdGhlIGJyYW5jaCBv
biB0b3Agb2YgeW91ciBwYXRjaGVzLCBJIHNhdyB5b3XigJl2ZSBjaGFuZ2VkIHRoZSBudW1iZXIg
b2YgcmVnaW9ucw0KPj4gbWFwcGVkIGF0IGJvb3QgdGltZSwgY2FuIEkgYXNrIHdoeT8NCj4gDQo+
IEkgaGF2ZSBhc2tlZCB0aGUgY2hhbmdlLiBJZiB5b3UgbG9vayBhdCB0aGUgbGF5b3V0Li4uDQoN
CkFwb2xvZ2llcywgSSBkaWRu4oCZdCBzZWUgeW914oCZdmUgYXNrZWQgdGhlIGNoYW5nZQ0KDQo+
IA0KPj4gDQo+PiBDb21wYXJlZCB0byBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2pl
Y3QveGVuLWRldmVsL3BhdGNoLzIwMjMwNjI2MDMzNDQzLjI5NDMyNzAtMjUtUGVubnkuWmhlbmdA
YXJtLmNvbS86DQo+IA0KPiANCj4gLi4uIHlvdSBoYXZlIHR3byBzZWN0aW9ucyB3aXRoIHRoZSBz
YW1lIHBlcm1pc3Npb25zOg0KPiANCj4geGVuX21wdW1hcFsxXSA6IFhlbiByZWFkLW9ubHkgZGF0
YQ0KPiB4ZW5fbXB1bWFwWzJdIDogWGVuIHJlYWQtb25seSBhZnRlciBpbml0IGRhdGENCj4geGVu
X21wdW1hcFszXSA6IFhlbiByZWFkLXdyaXRlIGRhdGENCj4gDQo+IER1cmluZyBib290LCBbMl0g
YW5kIFszXSB3aWxsIHNoYXJlIHRoZSBzYW1lIHBlcm1pc3Npb25zLiBBZnRlciBib290LA0KPiB0
aGlzIHdpbGwgYmUgWzFdIGFuZCBbMl0uIEdpdmVuIHRoZSBudW1iZXIgb2YgTVBVIHJlZ2lvbnMg
aXMgbGltaXRlZCwNCj4gdGhpcyBpcyBhIGJpdCBvZiBhIHdhc3RlLg0KPiANCj4gV2UgYWxzbyBk
b24ndCB3YW50IHRvIGhhdmUgYSBob2xlIGluIHRoZSBtaWRkbGUgb2YgWGVuIHNlY3Rpb25zLiBT
bw0KPiBmb2xkaW5nIHNlZW1lZCB0byBiZSBhIGdvb2QgaWRlYS4NCj4gDQo+PiANCj4+PiArRlVO
QyhlbmFibGVfYm9vdF9jcHVfbW0pDQo+Pj4gKw0KPj4+ICsgICAgLyogR2V0IHRoZSBudW1iZXIg
b2YgcmVnaW9ucyBzcGVjaWZpZWQgaW4gTVBVSVJfRUwyICovDQo+Pj4gKyAgICBtcnMgICB4NSwg
TVBVSVJfRUwyDQo+Pj4gKw0KPj4+ICsgICAgLyogeDA6IHJlZ2lvbiBzZWwgKi8NCj4+PiArICAg
IG1vdiAgIHgwLCB4enINCj4+PiArICAgIC8qIFhlbiB0ZXh0IHNlY3Rpb24uICovDQo+Pj4gKyAg
ICBsZHIgICB4MSwgPV9zdGV4dA0KPj4+ICsgICAgbGRyICAgeDIsID1fZXRleHQNCj4+PiArICAg
IHByZXBhcmVfeGVuX3JlZ2lvbiB4MCwgeDEsIHgyLCB4MywgeDQsIHg1LCBhdHRyX3ByYmFyPVJF
R0lPTl9URVhUX1BSQkFSDQo+Pj4gKw0KPj4+ICsgICAgLyogWGVuIHJlYWQtb25seSBkYXRhIHNl
Y3Rpb24uICovDQo+Pj4gKyAgICBsZHIgICB4MSwgPV9zcm9kYXRhDQo+Pj4gKyAgICBsZHIgICB4
MiwgPV9lcm9kYXRhDQo+Pj4gKyAgICBwcmVwYXJlX3hlbl9yZWdpb24geDAsIHgxLCB4MiwgeDMs
IHg0LCB4NSwgYXR0cl9wcmJhcj1SRUdJT05fUk9fUFJCQVINCj4+PiArDQo+Pj4gKyAgICAvKiBY
ZW4gcmVhZC1vbmx5IGFmdGVyIGluaXQgYW5kIGRhdGEgc2VjdGlvbi4gKFJXIGRhdGEpICovDQo+
Pj4gKyAgICBsZHIgICB4MSwgPV9fcm9fYWZ0ZXJfaW5pdF9zdGFydA0KPj4+ICsgICAgbGRyICAg
eDIsID1fX2luaXRfYmVnaW4NCj4+PiArICAgIHByZXBhcmVfeGVuX3JlZ2lvbiB4MCwgeDEsIHgy
LCB4MywgeDQsIHg1DQo+PiANCj4+ICAgICAgICAgXuKAlCB0aGlzLCBmb3IgZXhhbXBsZSwgd2ls
bCBibG9jayBYZW4gdG8gY2FsbCBpbml0X2RvbmUodm9pZCkgbGF0ZXIsIEkgdW5kZXJzdGFuZCB0
aGlzIGlzIGVhcmx5Ym9vdCwNCj4+ICAgICAgICAgICAgICAgYnV0IEkgZ3Vlc3Mgd2UgZG9u4oCZ
dCB3YW50IHRvIG1ha2Ugc3Vic2VxdWVudCBjaGFuZ2VzIHRvIHRoaXMgcGFydCB3aGVuIGludHJv
ZHVjaW5nIHRoZQ0KPj4gICAgICAgICAgICAgICBwYXRjaGVzIHRvIHN1cHBvcnQgc3RhcnRfeGVu
KCkNCj4gDQo+IENhbiB5b3UgYmUgYSBiaXQgbW9yZSBkZXNjcmlwdGl2ZS4uLiBXaGF0IHdpbGwg
YmxvY2s/DQoNClRoaXMgY2FsbCBpbiBzZXR1cC5jOg0KICAgIHJjID0gbW9kaWZ5X3hlbl9tYXBw
aW5ncygodW5zaWduZWQgbG9uZykmX19yb19hZnRlcl9pbml0X3N0YXJ0LA0KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAodW5zaWduZWQgbG9uZykmX19yb19hZnRlcl9pbml0X2VuZCwNCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgUEFHRV9IWVBFUlZJU09SX1JPKTsNCg0KQ2Fubm90
IHdvcmsgYW55bW9yZSBiZWNhdXNlIHhlbl9tcHVtYXBbMl0gaXMgd2lkZXIgdGhhbiBvbmx5IChf
X3JvX2FmdGVyX2luaXRfc3RhcnQsIF9fcm9fYWZ0ZXJfaW5pdF9lbmQpLg0KDQpJZiB0aGF0IGlz
IHdoYXQgd2Ugd2FudCwgdGhlbiB3ZSBjb3VsZCB3cmFwIHRoZSBhYm92ZSBjYWxsIGludG8gc29t
ZXRoaW5nIE1NVSBzcGVjaWZpYyB0aGF0IHdpbGwgZXhlY3V0ZSB0aGUgYWJvdmUgY2FsbCBhbmQN
CnNvbWV0aGluZyBNUFUgc3BlY2lmaWMgdGhhdCB3aWxsIG1vZGlmeSB4ZW5fbXB1bWFwWzFdIGZy
b20gKF9zcm9kYXRhLCBfZXJvZGF0YSkgdG8gKF9zcm9kYXRhLCBfX3JvX2FmdGVyX2luaXRfZW5k
KQ0KYW5kIHhlbl9tcHVtYXBbMl0gZnJvbSAoX19yb19hZnRlcl9pbml0X3N0YXJ0LCBfX2luaXRf
YmVnaW4pIHRvIChfX3JvX2FmdGVyX2luaXRfZW5kLCBfX2luaXRfYmVnaW4pLg0KDQpQbGVhc2Us
IGxldCBtZSBrbm93IHlvdXIgdGhvdWdodHMuDQoNCkNoZWVycywNCkx1Y2ENCg0K

