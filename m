Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F32209B6088
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 11:53:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828053.1242857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t66JA-0003YU-HV; Wed, 30 Oct 2024 10:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828053.1242857; Wed, 30 Oct 2024 10:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t66JA-0003Vz-Ed; Wed, 30 Oct 2024 10:52:12 +0000
Received: by outflank-mailman (input) for mailman id 828053;
 Wed, 30 Oct 2024 10:52:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZK+=R2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1t66J8-0003Vt-Ri
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 10:52:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20630.outbound.protection.outlook.com
 [2a01:111:f403:2613::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecffa0d6-96ac-11ef-a0c3-8be0dac302b0;
 Wed, 30 Oct 2024 11:51:33 +0100 (CET)
Received: from AM6P193CA0076.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::17)
 by DU0PR08MB8090.eurprd08.prod.outlook.com (2603:10a6:10:3e9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 10:51:28 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:209:88:cafe::43) by AM6P193CA0076.outlook.office365.com
 (2603:10a6:209:88::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20 via Frontend
 Transport; Wed, 30 Oct 2024 10:51:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8114.16
 via Frontend Transport; Wed, 30 Oct 2024 10:51:26 +0000
Received: ("Tessian outbound 373849c2df5a:v490");
 Wed, 30 Oct 2024 10:51:26 +0000
Received: from Lb0e164304850.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6C593A4A-EECD-4724-9D8C-F28A2644D3E7.1; 
 Wed, 30 Oct 2024 10:51:15 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lb0e164304850.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 30 Oct 2024 10:51:15 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AM9PR08MB5988.eurprd08.prod.outlook.com (2603:10a6:20b:283::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Wed, 30 Oct
 2024 10:51:12 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%6]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 10:51:12 +0000
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
X-Inumbo-ID: ecffa0d6-96ac-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMzo6NjMwIiwiaGVsbyI6IkVVUjA1LVZJMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImVjZmZhMGQ2LTk2YWMtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjg1NDkzLjE2MDYxOCwic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tQlpfEnjcNyGDyk6Nh32ig3NMllJQ79YTyVHfOUu7WSUozCqYRV9DUOOIoe7V5ZsWR5fUi/ntK08z+knN7+HZsYp9ekniIJfUDyA1Oq+JJbOheoQESQArrl9bgbTQP6M271OBKhVlHOEubJ5H7bh/vVKvi78t54qtic9Zva6sowJFgC0uQDU6R8s39X5UrYXyVScO+qOEyeVX52pB2pX84iL4h/PMuswyZe6Q6e//nWlX3fpYHbU52lGS80f2DAgslgd4c167cpqlwc8BkAeuMJh9++qWjLFs+chIXTqZWiY/KD6iwpY5rm9sX6NURu2McJQ4OBMQJbdqdHD9VL25Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iufWWRFZhYo+XxtfAwDAOoMohFr9S+PMW8q/2XvrvRE=;
 b=XM9bi6HuGvyLVRJc7omiu7+GT++nAI9VR3WCdS2WQD4fZ0yxMYaSGHPu2buOy2k4iipdD4GzHGgEuGGO2VJnpT5XNhg443AcMaBYV14SIJ5SSkEMc3D/h2QiMlnO7jxSZdOl3FhdhdbmxkygWTqjMJi9anIQgmjCrcsEskmvzgxxM+vdHOHy4r7Kwi/wdLDxn7SpWbpGahI1kbexOAxrlqC3tMT0eO021jfCd60mY3Dcr5mRBbpytNnwhV4jaA9ZXtkNW9Jo/ur2SrG1QTuk3CT9Ar77iqnAxRJbE8ezXQ0+CJH0aXT7w/qZvUrtDeYAymk4qQDM0VfgAfaewuWW+A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iufWWRFZhYo+XxtfAwDAOoMohFr9S+PMW8q/2XvrvRE=;
 b=iNf3RcyrcBMkS3D5h5o6U/b5cP54FOHxMEF3fzSTHs18rT6HlxfWiGx7hoLYB7hXsQ6FWiYZSMMdFqSZtYVziA022h2QLCuLICRDNQPMPvbinlb8NqrC9TfRMK/p+G/2bAam/cjTDcPCrqKtUGJzmkHy8Zq0Dtr0AU0EYM+ddUQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f3d35c9deca953d9
X-TessianGatewayMetadata: puHOz0q3jcae6/lQy3wCf9gKESQEj9XeOYZL9QjpnVFTEB9uMRam0/BjrqSFmXnZ2vq7+bkjMKGUANqkz5li4PnMBgaCUp0U/S6gqPZe0E70BtcJSjAoJHeuXr40llpJ+pcne5RV066jpoIM97JdZsxmIUm6TaaP6VOzHh9Je9w=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SACBeeu15SwGJPDOsiVshEQv6io9B9G0UIj2UbGhanX7GXcZCjHL8w0W8YDJKRD3uaxprH50Gt6omoKtRCWbB2xqJy18tON/FGY3Sk43ymBDrqQo4FA+ZU9bk/65yX8YaOftOec3yKtavvpvrhF2bLE/3mCZgXaPOojwWrY9KYYkLGXXSN+NOuZqkxEF3mRUeW27CoCxSjI7O6GGYC6LZHYyXz5NyLqIHKujdx1GwTP/IssuFcT+aNcvWQ8UogALoWSPHI3KlybpDhcjBagt83RAVS0cXjaX7xdCmi2+7wzePQt23hsaXxyPCHMQRWpzU7F78GgUkSOZO6CyCH47NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iufWWRFZhYo+XxtfAwDAOoMohFr9S+PMW8q/2XvrvRE=;
 b=O9fMfwsy1YIYOm0rtCCIx8JNXAhmPRGcYmzidmQK1U4kALQVc2uyzR0uhO81mq4cKs51L4b+B1O4xTyeYex17eIEbWemwkp8m+DwizXb22EQT++0NCgt5Cg9Td+tAZw4wyj+YYnOXtglYHRHbwTmZEMjrWIWVGABCQsTpcXBZO2zUB0QxKtzT6guEPQZvmY3Ud+mltmRMmQ9OYty+yuy4BJFiY3ZfHCWviV03s9iL3HzaveVGwJimV6dTkEgxFnnkCQq3OHYrZatoQ9MgH0eer0KKamIey0D3xZEkMEZUjO8yHmoLgkxtTqLdrwnqsm6nMm8aVea8YinZBTIeHGYcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iufWWRFZhYo+XxtfAwDAOoMohFr9S+PMW8q/2XvrvRE=;
 b=iNf3RcyrcBMkS3D5h5o6U/b5cP54FOHxMEF3fzSTHs18rT6HlxfWiGx7hoLYB7hXsQ6FWiYZSMMdFqSZtYVziA022h2QLCuLICRDNQPMPvbinlb8NqrC9TfRMK/p+G/2bAam/cjTDcPCrqKtUGJzmkHy8Zq0Dtr0AU0EYM+ddUQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Julien Grall <julien.grall.oss@gmail.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 4/6] xen/arm: mpu: Create boot-time MPU protection
 regions
Thread-Topic: [PATCH v4 4/6] xen/arm: mpu: Create boot-time MPU protection
 regions
Thread-Index: AQHbKTd3r9ds8GMpC0a1KoGz65CsELKfBnMAgAAKAQCAAARNAIAABs8AgAAFJgA=
Date: Wed, 30 Oct 2024 10:51:12 +0000
Message-ID: <19C963C9-97C2-442D-B9AC-9CE7CF3B50F2@arm.com>
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
 <20241028124547.1371867-5-ayan.kumar.halder@amd.com>
 <FE41FD6C-EBCE-4EDA-ADD4-E09A58773763@arm.com>
 <CAJ=z9a1d2vzXh-fK5E2z-k4SOjE0cjJUGfFnaJiobvQpS+Y5Rw@mail.gmail.com>
 <3963FE44-9ED1-4462-BD42-DA1B1A5040C5@arm.com>
 <8ee005f3-baf7-408a-b084-833475ced50d@xen.org>
In-Reply-To: <8ee005f3-baf7-408a-b084-833475ced50d@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|AM9PR08MB5988:EE_|AMS0EPF000001A4:EE_|DU0PR08MB8090:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eecee35-4c5e-4dc8-705f-08dcf8d0cdc3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Yk5SM0N0cDByMndxSGQ0YzhGVm41NkY3V29BallLbnVYNGR5QU4veUgzUXEw?=
 =?utf-8?B?K0I0T3lBK2k2Z01RSmhZeTZQbktmdkJQbldXOTFVU09nbU1NanBXZm1iWVZw?=
 =?utf-8?B?K3IrMzN1allLRVpzcE1jbzNndi9sMlJCVW8wT3N6cU9LbkpuaytkaWpMSDNT?=
 =?utf-8?B?NFl3b2lqM2ppRVM3M1ZQMDZUOXdpcWNjYmFlRWdOeXptSE1GbVpUa1ZmbGFH?=
 =?utf-8?B?b3kvMWVka3ZXMGJlNGtSZ3FBRjZ3cU56U3VLUENUdUpubHRvT0NKeHQrK0Vu?=
 =?utf-8?B?WnJPNUlLT2taT0VoRU5pdytLQmU0eElpZUFlUElCM1o3OWNzdXhvYVNhMXZm?=
 =?utf-8?B?QmlxOE9kd1ZjR0lBdzlwNWVEdmpvYUtMZzF1VkxzT2xjSndZaFpKYVpldHRO?=
 =?utf-8?B?SGQwb2tvUTM0Y1l1NzN6K2JGVDVDNkgrR2ttTW1XMmd6WlNtSUtOeGNNZkZP?=
 =?utf-8?B?a01RVFBvV0QyRWR5b0VLQ2Z3Sy9SYjNzeklMUHRvZTl0NU5iUkVIMkFBU2lW?=
 =?utf-8?B?Zmh3Z0pGS3k3bXBDa0hHL3E4UnloWEUyTXVseDdmWlB6bmZCNXJTaXArTVJM?=
 =?utf-8?B?YUk2bVRpNTRoTnA5NjllSzJCRDVQVkNhbi9welJENlBONmZOTzJVVW9NcWl6?=
 =?utf-8?B?NzR0dU1zUnU4NkVuOFU2REY2Tlh1WUYwYnNJaWdWaWRQT0syanhmOUozMUtw?=
 =?utf-8?B?SHFXc0E4citqTDJYSjFEZU5rUXdlSUNGTmRBdmxsYVBWV0owdHlCSWphZ0Jp?=
 =?utf-8?B?WFhmR1RqQjlIYjlRa0lsM0IxbGJubVhUdlRGeCtMcmVKRitPdkxCcUw0VHBo?=
 =?utf-8?B?U1NsUHpMRkNJOFMxeTJvSVB0QlN4K21HVjE3dnJoYWUxODVtdEE5cmxmQ2FC?=
 =?utf-8?B?clhvUUV3VWhiM3pWVmhMQk5XS01ZaTZaeFhPbjB6aVlTaUcxQjBkNkFBY1pr?=
 =?utf-8?B?Z2l2ZDNSVXRlUVByOXkxNU95S0IwVmVTbTN6KzdKeHhIUHZRQ2hiWll2VEp6?=
 =?utf-8?B?M2VkNmJaZ3I4WWVlaHF0Z0R6c0RtUnNWZ2tXQmM1MGRMa0pkcCtkRGdkdTFX?=
 =?utf-8?B?TUNIOWtmd2c4RXZMZUhoVUhaV3VxalhIanJ4YlFzbU9qbkxOREx0MU1EeU9H?=
 =?utf-8?B?NEwvMHd4SXdpL3V5aytjMVNLYnhKNDJLbVVMcm1xZWVvdElNa0F1UUk4L2JG?=
 =?utf-8?B?VGpud1JNZXpuZE9Rb0xxL3hZZjNmb3JTVlkyUHhwVzhlLzJWUE1Ic1VsTnVH?=
 =?utf-8?B?MEgyMzUzUFQvbCtVYVRwWnBBcHV0Nm90UzRjRXF5NTM4dEdhY3puL2pzbVZR?=
 =?utf-8?B?SDMxNWZzeWlvNS81OENMeGpkM0M5TFNEN0hkc1k3MjBaS2RGSjl0Y0FQL2pI?=
 =?utf-8?B?RkxmcjFWdTB0YU92SytRUDYwSnhIcTJINGpCNnBvUDdXMWlqUFZnR0RpOHlj?=
 =?utf-8?B?TkNvelhMVVFXWVRXYkhDOWoyM3pSeFJ5ckJlUWMyK1ZlK0phZkRTb29aRlVt?=
 =?utf-8?B?VDIxVVhtUC9WWnBwSVFWakJ4UFJBcXpYeHpJeWhUU2FzZjFZNFYwMzJRVU0z?=
 =?utf-8?B?cVUvbGg2WURCZklGeXJoVVVGcDRRNFBHTVJHck5Xa0w3NWZBZVRKUEVDRVRI?=
 =?utf-8?B?OVdZTTBSY2R2TTNkYjFZbG1OcEl6am80MzRJdHQ0OGk3d3FHY243amlVVnBN?=
 =?utf-8?B?VHRVK3BYYk9NRXdBVWZpYXhOQ0R4Wm0rUVlaY01BVzkxTkpMOE9KZHVWNTlh?=
 =?utf-8?B?ZmVSVFZOOGlscjd2WWl3ZmhHZkFidFJEOTVKVm90WnNNOU5Ecms4SXhxUk9n?=
 =?utf-8?B?WUtBaHNjcEtJZ0ZNaTJqdz09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8636130AC6522439537670D4B243937@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5988
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	446bbb37-edec-4c52-439f-08dcf8d0c519
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NUZRUzBMTGJya0RsOEtYNjJLa2tXdlUxQ0I0NVJMMS9tOEIzT2ZOY0F5OGRp?=
 =?utf-8?B?cTZieDhtZVJpaW5ZNWJRK1lFZzR2ZVNPQXRock1NZGVOeHZYNHdhSWtJamlC?=
 =?utf-8?B?aTRsZG1JSlFyVytwNWlXTTcyYTRZUEhIZWYvbVgrbmlOTHJadzBIaDkzNGky?=
 =?utf-8?B?VzZKWXZCblQvQyttekNiRG13RDV2c0UwRnZKU292eVF4Wk1odVdlMjJQUmdL?=
 =?utf-8?B?WXVUV2FndGhHR0Y3eUNvMWNVVW5Sbkt6bkI0U1h0Vk8vakR4RnVrd3UzSGhm?=
 =?utf-8?B?MFl3b1pCS1hMTCtzSUZaZEhzNC9MYk5sK1A3cXJ1RHQ2clptL005SGU2NGor?=
 =?utf-8?B?Y0lsVTloMDR2NUNMcEFYZ3RFNW9KS0lxUFFsaGNUdlk1blNqaXc4elViMnZF?=
 =?utf-8?B?MHJ4Vm5KUGI1dXV3cVpGN3NCODlDTFd0cUxFUEx0dXRsY3ZXNE5uNXA2YitO?=
 =?utf-8?B?SzJqS2VwaGRFZ25NWS9Ed3c2cVM0QzcwbTBwcEFlcGR5Sm5DMXNBc3VaTDVP?=
 =?utf-8?B?WjFYNHdkM09mSEptNWhNZDJYK09QU28wT3dqaTI1bWhxY1pROW51ckwycjFz?=
 =?utf-8?B?ZnU4MDJsZmpTUkI2d1pnODRoc1dZdldzeUwvaHFEN3B5bE4wb2RyOVplMTdL?=
 =?utf-8?B?NTN0ZmlCa1A3U2hrQjNtRy9Gc1ZFODBxK1h0N2pyanlwUG5nbklRTFJxUDdI?=
 =?utf-8?B?aktGQmRHNEJJbVFVYUZrS0lQd3JXVWNFNzBRUXQyUnRMQnBwaXVSbCtMSzMy?=
 =?utf-8?B?TkduRGZZNHJhVFpHdU1wYStQNVNKNDFXUUJ0SzFNd3VyQlpXeWVxWHROSE5s?=
 =?utf-8?B?ZnRUL3JKNW5COXhTckt5U1pHT3VmSTQrQ1R1SEhXSXVvd1lnNGpDcitpTDlG?=
 =?utf-8?B?aXh5MHRDUjFqNGpHa0RQdTVVN1piSjBYcG1sVmZvRjh6RW9hQlY2dHIzNkEw?=
 =?utf-8?B?ckc4dUwwNUhYZ1hreUlzcHpVRHpDMmptdjB3L3ZmMEx1QVZKVm1ja2JFd2Rq?=
 =?utf-8?B?U213NlROUWlXeVBZUHI1Q3dBQUtwTUN1WmI5OStwZi95RlJxUWhHN3RiNmpN?=
 =?utf-8?B?L0srY1lHbmpRbjJhYTJya2ozYlovMUpySUxQWkVBbUVnbWJRWFhqTW1KWjJH?=
 =?utf-8?B?MGZKY2FUa1pIY3NaL2FOZUxJY0s1Y0JGNjgwcGlKaVRJV3NlRWlTNk1zSXR4?=
 =?utf-8?B?U2VNWGJycTBnZHJhWXVJbFFwamVEWkZualUydm5wbXEvSkIwVVRnbDRDbExv?=
 =?utf-8?B?dU01Nmt2VFVrdWlSbmZ2V1VVVXpLSWw4c0RYN1Z1bkUzWVdyWUxVdndYM0hC?=
 =?utf-8?B?ZkVYS2trYXpYMUZQVzIySkpDZVBtTExaUGhHdEtTMjJKeHNneml2TjEwV21V?=
 =?utf-8?B?MWRWeWVnZXFqT2FBNTA4MHQvdlFKeEo3QnllQ1lVbGpER2xnZW1td0Izd0lD?=
 =?utf-8?B?eVg2cUtKK1d4QUJYYnZJN2U5Nzg2MUZGdGhjbXlQNzZKYjF5aGVXTU13MzRw?=
 =?utf-8?B?V2RTR3ZaWXRncm5XQ1pEaTJJcjhCZHIvNC9OeTRac3A4RHJDby8wME1CZjAr?=
 =?utf-8?B?N0xsU2xHTmdrV1MwRHFaa1dmVGFybk5mYUxPa2lUWnVyanp5ekoxSnlrWVlu?=
 =?utf-8?B?ZTJsYUw3UmRTNUNlbzQzSnE2R2t0MnFuelBlTkQyU2E0VXNKOWd6em1kQjBL?=
 =?utf-8?B?UHRSMXNmMGFzVXU1NGttUmNjazMrbERiKzNSS29LOXJUYTF2MUZkMDhGczky?=
 =?utf-8?B?TjFxZDJGMkVzT3gwTHc0Q2pjOVNXK3FtMDUrYmYxbTlCaFFEK1BLazc3S09Q?=
 =?utf-8?Q?7RWyoFuM3UTeYiGITs2tzGSfrMsl0ebyhfQtk=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 10:51:26.8166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eecee35-4c5e-4dc8-705f-08dcf8d0cdc3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8090

SGkgSnVsaWVuLA0KDQo+IE9uIDMwIE9jdCAyMDI0LCBhdCAxMDozMiwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiAzMC8xMC8yMDI0IDEwOjA4LCBMdWNhIEZh
bmNlbGx1IHdyb3RlOg0KPj4gSGkgSnVsaWVuLA0KPj4+IE9uIDMwIE9jdCAyMDI0LCBhdCAwOTo1
MiwgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGwub3NzQGdtYWlsLmNvbT4gd3JvdGU6DQo+Pj4g
DQo+Pj4gT24gV2VkLCAzMCBPY3QgMjAyNCBhdCAwOToxNywgTHVjYSBGYW5jZWxsdSA8THVjYS5G
YW5jZWxsdUBhcm0uY29tPiB3cm90ZToNCj4+Pj4gDQo+Pj4+IEhpIEF5YW4sDQo+Pj4+IA0KPj4+
PiBXaGlsZSBJIHJlYmFzZWQgdGhlIGJyYW5jaCBvbiB0b3Agb2YgeW91ciBwYXRjaGVzLCBJIHNh
dyB5b3XigJl2ZSBjaGFuZ2VkIHRoZSBudW1iZXIgb2YgcmVnaW9ucw0KPj4+PiBtYXBwZWQgYXQg
Ym9vdCB0aW1lLCBjYW4gSSBhc2sgd2h5Pw0KPj4+IA0KPj4+IEkgaGF2ZSBhc2tlZCB0aGUgY2hh
bmdlLiBJZiB5b3UgbG9vayBhdCB0aGUgbGF5b3V0Li4uDQo+PiBBcG9sb2dpZXMsIEkgZGlkbuKA
mXQgc2VlIHlvdeKAmXZlIGFza2VkIHRoZSBjaGFuZ2UNCj4gDQo+IE5vIG5lZWQgdG8gYXBvbG9n
aWVzISBJIHRoaW5rIEkgYXNrZWQgYSBmZXcgcmV2aXNpb25zIGFnby4NCj4gDQo+Pj4gDQo+Pj4+
IA0KPj4+PiBDb21wYXJlZCB0byBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3Qv
eGVuLWRldmVsL3BhdGNoLzIwMjMwNjI2MDMzNDQzLjI5NDMyNzAtMjUtUGVubnkuWmhlbmdAYXJt
LmNvbS86DQo+Pj4gDQo+Pj4gDQo+Pj4gLi4uIHlvdSBoYXZlIHR3byBzZWN0aW9ucyB3aXRoIHRo
ZSBzYW1lIHBlcm1pc3Npb25zOg0KPj4+IA0KPj4+IHhlbl9tcHVtYXBbMV0gOiBYZW4gcmVhZC1v
bmx5IGRhdGENCj4+PiB4ZW5fbXB1bWFwWzJdIDogWGVuIHJlYWQtb25seSBhZnRlciBpbml0IGRh
dGENCj4+PiB4ZW5fbXB1bWFwWzNdIDogWGVuIHJlYWQtd3JpdGUgZGF0YQ0KPj4+IA0KPj4+IER1
cmluZyBib290LCBbMl0gYW5kIFszXSB3aWxsIHNoYXJlIHRoZSBzYW1lIHBlcm1pc3Npb25zLiBB
ZnRlciBib290LA0KPj4+IHRoaXMgd2lsbCBiZSBbMV0gYW5kIFsyXS4gR2l2ZW4gdGhlIG51bWJl
ciBvZiBNUFUgcmVnaW9ucyBpcyBsaW1pdGVkLA0KPj4+IHRoaXMgaXMgYSBiaXQgb2YgYSB3YXN0
ZS4NCj4+PiANCj4+PiBXZSBhbHNvIGRvbid0IHdhbnQgdG8gaGF2ZSBhIGhvbGUgaW4gdGhlIG1p
ZGRsZSBvZiBYZW4gc2VjdGlvbnMuIFNvDQo+Pj4gZm9sZGluZyBzZWVtZWQgdG8gYmUgYSBnb29k
IGlkZWEuDQo+Pj4gDQo+Pj4+IA0KPj4+Pj4gK0ZVTkMoZW5hYmxlX2Jvb3RfY3B1X21tKQ0KPj4+
Pj4gKw0KPj4+Pj4gKyAgICAvKiBHZXQgdGhlIG51bWJlciBvZiByZWdpb25zIHNwZWNpZmllZCBp
biBNUFVJUl9FTDIgKi8NCj4+Pj4+ICsgICAgbXJzICAgeDUsIE1QVUlSX0VMMg0KPj4+Pj4gKw0K
Pj4+Pj4gKyAgICAvKiB4MDogcmVnaW9uIHNlbCAqLw0KPj4+Pj4gKyAgICBtb3YgICB4MCwgeHpy
DQo+Pj4+PiArICAgIC8qIFhlbiB0ZXh0IHNlY3Rpb24uICovDQo+Pj4+PiArICAgIGxkciAgIHgx
LCA9X3N0ZXh0DQo+Pj4+PiArICAgIGxkciAgIHgyLCA9X2V0ZXh0DQo+Pj4+PiArICAgIHByZXBh
cmVfeGVuX3JlZ2lvbiB4MCwgeDEsIHgyLCB4MywgeDQsIHg1LCBhdHRyX3ByYmFyPVJFR0lPTl9U
RVhUX1BSQkFSDQo+Pj4+PiArDQo+Pj4+PiArICAgIC8qIFhlbiByZWFkLW9ubHkgZGF0YSBzZWN0
aW9uLiAqLw0KPj4+Pj4gKyAgICBsZHIgICB4MSwgPV9zcm9kYXRhDQo+Pj4+PiArICAgIGxkciAg
IHgyLCA9X2Vyb2RhdGENCj4+Pj4+ICsgICAgcHJlcGFyZV94ZW5fcmVnaW9uIHgwLCB4MSwgeDIs
IHgzLCB4NCwgeDUsIGF0dHJfcHJiYXI9UkVHSU9OX1JPX1BSQkFSDQo+Pj4+PiArDQo+Pj4+PiAr
ICAgIC8qIFhlbiByZWFkLW9ubHkgYWZ0ZXIgaW5pdCBhbmQgZGF0YSBzZWN0aW9uLiAoUlcgZGF0
YSkgKi8NCj4+Pj4+ICsgICAgbGRyICAgeDEsID1fX3JvX2FmdGVyX2luaXRfc3RhcnQNCj4+Pj4+
ICsgICAgbGRyICAgeDIsID1fX2luaXRfYmVnaW4NCj4+Pj4+ICsgICAgcHJlcGFyZV94ZW5fcmVn
aW9uIHgwLCB4MSwgeDIsIHgzLCB4NCwgeDUNCj4+Pj4gDQo+Pj4+ICAgICAgICAgXuKAlCB0aGlz
LCBmb3IgZXhhbXBsZSwgd2lsbCBibG9jayBYZW4gdG8gY2FsbCBpbml0X2RvbmUodm9pZCkgbGF0
ZXIsIEkgdW5kZXJzdGFuZCB0aGlzIGlzIGVhcmx5Ym9vdCwNCj4+Pj4gICAgICAgICAgICAgICBi
dXQgSSBndWVzcyB3ZSBkb27igJl0IHdhbnQgdG8gbWFrZSBzdWJzZXF1ZW50IGNoYW5nZXMgdG8g
dGhpcyBwYXJ0IHdoZW4gaW50cm9kdWNpbmcgdGhlDQo+Pj4+ICAgICAgICAgICAgICAgcGF0Y2hl
cyB0byBzdXBwb3J0IHN0YXJ0X3hlbigpDQo+Pj4gDQo+Pj4gQ2FuIHlvdSBiZSBhIGJpdCBtb3Jl
IGRlc2NyaXB0aXZlLi4uIFdoYXQgd2lsbCBibG9jaz8NCj4+IFRoaXMgY2FsbCBpbiBzZXR1cC5j
Og0KPj4gICAgIHJjID0gbW9kaWZ5X3hlbl9tYXBwaW5ncygodW5zaWduZWQgbG9uZykmX19yb19h
ZnRlcl9pbml0X3N0YXJ0LA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodW5zaWdu
ZWQgbG9uZykmX19yb19hZnRlcl9pbml0X2VuZCwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgUEFHRV9IWVBFUlZJU09SX1JPKTsNCj4+IENhbm5vdCB3b3JrIGFueW1vcmUgYmVjYXVz
ZSB4ZW5fbXB1bWFwWzJdIGlzIHdpZGVyIHRoYW4gb25seSAoX19yb19hZnRlcl9pbml0X3N0YXJ0
LCBfX3JvX2FmdGVyX2luaXRfZW5kKS4NCj4gDQo+IElzIHRoaXMgYmVjYXVzZSB0aGUgaW1wbGVt
ZW50YXRpb24gb2YgbW9kaWZ5X3hlbl9tYXBwaW5ncygpIGlzIG9ubHkgYWJsZSB0byBtb2RpZnkg
YSBmdWxsIHJlZ2lvbj8gSU9XLCBpdCB3b3VsZCBub3QgYmUgYWJsZSB0byBzcGxpdCByZWdpb25z
IGFuZC9vciBtZXJnZSB0aGVtPw0KDQpZZXMsIHRoZSBjb2RlIGlzLCBhdCB0aGUgbW9tZW50LCBu
b3Qgc21hcnQgZW5vdWdoIHRvIGRvIHRoYXQsIGl0IHdpbGwgb25seSBtb2RpZnkgYSBmdWxsIHJl
Z2lvbi4NCg0KPiANCj4+IElmIHRoYXQgaXMgd2hhdCB3ZSB3YW50LCB0aGVuIHdlIGNvdWxkIHdy
YXAgdGhlIGFib3ZlIGNhbGwgaW50byBzb21ldGhpbmcgTU1VIHNwZWNpZmljIHRoYXQgd2lsbCBl
eGVjdXRlIHRoZSBhYm92ZSBjYWxsIGFuZA0KPj4gc29tZXRoaW5nIE1QVSBzcGVjaWZpYyB0aGF0
IHdpbGwgbW9kaWZ5IHhlbl9tcHVtYXBbMV0gZnJvbSAoX3Nyb2RhdGEsIF9lcm9kYXRhKSB0byAo
X3Nyb2RhdGEsIF9fcm9fYWZ0ZXJfaW5pdF9lbmQpDQo+PiBhbmQgeGVuX21wdW1hcFsyXSBmcm9t
IChfX3JvX2FmdGVyX2luaXRfc3RhcnQsIF9faW5pdF9iZWdpbikgdG8gKF9fcm9fYWZ0ZXJfaW5p
dF9lbmQsIF9faW5pdF9iZWdpbikuDQo+IA0KPiBJIHRoaW5rIGl0IHdvdWxkIG1ha2Ugc2Vuc2Ug
dG8gaGF2ZSB0aGUgY2FsbCBtbXUvbXB1IHNwZWNpZmljLiBUaGlzIHdvdWxkIGFsbG93IHRvIGxp
bWl0IHRoZSBudW1iZXIgb2YgTVBVIHJlZ2lvbnMgdXNlZCBieSBYZW4gaXRzZWxmLg0KPiANCj4g
VGhlIG9ubHkgcHJvYmxlbSBpcyBJSVJDIHRoZSByZWdpb24gaXMgbm90IGZpeGVkIGJlY2F1c2Ug
d2Ugd2lsbCBza2lwIGVtcHR5IHJlZ2lvbnMgZHVyaW5nIGVhcmx5Ym9vdC4NCg0KWWVzLCBidXQg
SSB0aGluayB3ZSBjYW4gYXNzdW1lIHRoYXQgWChfc3JvZGF0YSwgX2Vyb2RhdGEpIGFuZCBZKF9f
cm9fYWZ0ZXJfaW5pdF9zdGFydCwgX19pbml0X2JlZ2luKSB3b27igJl0IG5ldmVyIGJlIGVtcHR5
IGZvciBYZW4/DQoNCkluIHRoYXQgY2FzZSwgdGhlIGNhbGwgdG8gbXB1bWFwX2NvbnRhaW5fcmVn
aW9uKCkgc2hvdWxkIGJlIGFibGUgdG8gcmV0cmlldmUgdGhlIGZ1bGwgcmVnaW9uIFggYW5kIHRo
ZSBwYXJ0aWFsIHJlZ2lvbiBZIGFuZA0KYSBzcGVjaWZpYyBmdW5jdGlvbiBjb3VsZCBtb2RpZnkg
dGhlIHJhbmdlcyBvZiBib3RoIGdpdmVuIHRoZSByZXNwZWN0aXZlIGluZGV4ZXMuDQoNCkNvZGUg
aW4gbXkgYnJhbmNoOiBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxlL2x1Y2Fm
YW5jZWxsdS94ZW4vLS9ibG9iL3I4Ml9yZWJhc2VkL3hlbi9hcmNoL2FybS9tcHUvbW0uYyNMMzgy
DQoNCg0K

