Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE839C7954
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 17:53:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835918.1251785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBGcC-0003s2-Lj; Wed, 13 Nov 2024 16:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835918.1251785; Wed, 13 Nov 2024 16:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBGcC-0003qX-Ir; Wed, 13 Nov 2024 16:53:12 +0000
Received: by outflank-mailman (input) for mailman id 835918;
 Wed, 13 Nov 2024 16:53:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DKyd=SI=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tBGcA-0003qP-SR
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 16:53:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20629.outbound.protection.outlook.com
 [2a01:111:f403:2613::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0c7376c-a1df-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 17:53:06 +0100 (CET)
Received: from DB3PR06CA0009.eurprd06.prod.outlook.com (2603:10a6:8:1::22) by
 PAWPR08MB9065.eurprd08.prod.outlook.com (2603:10a6:102:332::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Wed, 13 Nov
 2024 16:53:02 +0000
Received: from DU2PEPF00028D06.eurprd03.prod.outlook.com
 (2603:10a6:8:1:cafe::2f) by DB3PR06CA0009.outlook.office365.com
 (2603:10a6:8:1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17 via Frontend
 Transport; Wed, 13 Nov 2024 16:53:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D06.mail.protection.outlook.com (10.167.242.166) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14
 via Frontend Transport; Wed, 13 Nov 2024 16:53:01 +0000
Received: ("Tessian outbound d013e61db77e:v490");
 Wed, 13 Nov 2024 16:53:00 +0000
Received: from Lf84c943f5a08.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F4CB0635-D124-47AC-84D2-4AA1A6C39379.1; 
 Wed, 13 Nov 2024 16:52:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lf84c943f5a08.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 13 Nov 2024 16:52:54 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AM9PR08MB6003.eurprd08.prod.outlook.com (2603:10a6:20b:2d4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 16:52:51 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 16:52:51 +0000
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
X-Inumbo-ID: c0c7376c-a1df-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMzo6NjI5IiwiaGVsbyI6IkVVUjA1LVZJMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImMwYzczNzZjLWExZGYtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTE2Nzg2LjAxOTEyNCwic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=B4MvkENbA8QZoRxjA8muN+8lcNCp0P4rnTTsS6dJt2u9JfvD1TeANjQx6rRc6knfU63U7BWyn3twMiAE103QWZSBr/NWDWOj4o4ekb6vmgdSAGUMOuMTkJXcKEJuoRi0Fn22DHDrS0b++2/tPV+4nJKJtJOUTkMNpCpyD6/5JpxMXgEgbC4biaRu2Tog/zDbiykArH03c9Hdsb02BuSw9CA46tfup8JZ8JZc7tOxqN6Jwlq52YCGpS9iHmyUraa2r8ItTC1iMiNdbjAN9mZIEkyEaEf7s6m1qRe0p6B9RY/Z66F9HqSKHqTlKppMrZLGzBbToSsyllys3z9trNnfpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1sQFyZQFtnGoRqBplKJRTT9kx/TP/CUgJLrPAUz1Iq8=;
 b=RYcmRMy20HZ8XXcdhlFUv/N3d9ttSvUV87wQDKyY+8X5B4k1Re8OWUa6ZZHNCsxH3H8Nx6QLMn2PuaA0930BZqOwTNPt7FVYuEyTnOH5EYBjKsPxfBrWEOvy220CmzjeDMFaitJNey3wl+Y3/bETNDorl2TXDyCw8QS1OHSAqUMhYDxgFT+oWJ3hjMOnfkkdmjL0k5zOKnt1wvJCA6MD7lx/XUN0zw4i5GuvnyOoGXMfE1ZJm/9LfkQZvWBOAjregIxj3ieDnReohbhdY0WR+KI8Q+zkgVRR8N/9m22pSpbWi5Da5CKUcwwobXbMy8bpq8RNLPngtQbZtK6MVtesaA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1sQFyZQFtnGoRqBplKJRTT9kx/TP/CUgJLrPAUz1Iq8=;
 b=BYr043O3iH0Fi/d+cRAZzqigu2vEdJXxZtBMyUJyQLOEKlKaZVmiug7h+760OC9eX0FK9cE4t8FRr7pv57BML2D+Kyc2Ui4uQL57kMPdBWjtWynO7bLcrEoNskex04OWvxgebOQFOtn9byg4Jm8hhkTNiMGltylZa6vbP4jMnJ0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a5e3603321b439f3
X-TessianGatewayMetadata: rY4GOckzRln9qmwxMaQ4tNMvOMoc6zcORCq5zH6gUaHiZ1zjSqMNBXTPkvNk/Qga997tEFZTwAtf2p213dhprZRZl0DUee8YGRSSV0Vz3M7sbxOQ+8gNLWG4o8MVlm8isfY6jZx3WeMmsk3HDF4vAHpXy6HTis3vzram4xghG8E=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4aa8YtVDB5EZ0wVczMztNYHyDZsa5d6C6CTx/uqHzcHyQ7+af2ghznlKPulJwi+F1cJKapc8W9uEoVbNhN7bgsNi2Xvz0Sm/ApcsA/CBY86rtgh52JL0L5qSBf7oSMnwRQUbQpDkHotFal96NpdBMGNlJ5R7Zx/yN35/bJtAlN0diNkmeGWFJdcSTxFHmFZByr0eGBII2RfCE9WeLDXx4V+hytNSPFXG1rfmkgPvCaQNOF8huq0uC40c8wLIfiu4nKCXVbH2t1gHfvQTFe4cHjCKxPxZeo9hhHSms1EV+BNoP2D/dewZQdTA4Tq9V4LZFJNGZXICU7zR1mFy+WH9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1sQFyZQFtnGoRqBplKJRTT9kx/TP/CUgJLrPAUz1Iq8=;
 b=hNgBzbh0MgGlSAHPdG6hSEALJ89m8dbcYt5v8U85hyGjAaWaoPIKcUZQA7bJwvx8ETvEV/1tRHA4FPHYpUPKFEz0WFbupdtnrHuACS25ZdrpHbsKgf4dXAw4uVDVXg8TCtSaYe3J1KYegrnFpi2x2bnndzs/7ckig6wrPlVcqsx6c0fdLMI8opWZHnlqTH4WLt6RDBQXbF6WBD8BuFYwt6PWw7Bvzohi5oSlybE8bZievoEzfc9kUsRxRr9gKCtQerpS1jrs9EcPv+WFq0Mb1lAZ/0hKDN9Ws34ulPsOVAYvJJDTXCMNsopw/XIj9Pu3QG6QalexGNRrPZkl0jCfFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1sQFyZQFtnGoRqBplKJRTT9kx/TP/CUgJLrPAUz1Iq8=;
 b=BYr043O3iH0Fi/d+cRAZzqigu2vEdJXxZtBMyUJyQLOEKlKaZVmiug7h+760OC9eX0FK9cE4t8FRr7pv57BML2D+Kyc2Ui4uQL57kMPdBWjtWynO7bLcrEoNskex04OWvxgebOQFOtn9byg4Jm8hhkTNiMGltylZa6vbP4jMnJ0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: Re: [PATCH] xen/device-tree: Allow exact match for overlapping
 regions
Thread-Topic: [PATCH] xen/device-tree: Allow exact match for overlapping
 regions
Thread-Index: AQHbNdR4b2V2aTQ740yGxnKF6IdbXLK1RlIAgAALhoCAABtMgA==
Date: Wed, 13 Nov 2024 16:52:51 +0000
Message-ID: <CB0DED68-C1CE-441E-9688-D5377C01BF91@arm.com>
References: <20241106134132.2185492-1-luca.fancellu@arm.com>
 <f0928350-0031-4f74-a61a-778e68a9f67b@xen.org>
 <FA425FB4-7B3D-4FF0-9C94-2E5D8ECA1502@arm.com>
 <c7f818b8-5dc7-4b16-a5ca-050af6c36be4@xen.org>
In-Reply-To: <c7f818b8-5dc7-4b16-a5ca-050af6c36be4@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|AM9PR08MB6003:EE_|DU2PEPF00028D06:EE_|PAWPR08MB9065:EE_
X-MS-Office365-Filtering-Correlation-Id: 91725cdb-452d-4f37-754a-08dd0403a29b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ZTFlcVVLQ3ZrODJDRlpEMmlUdTZwVzd1S1cySFVjbE40eG5hNVZvekVscWtD?=
 =?utf-8?B?Vm5IUnFJR3pJTCtMUkNMeFkzbWNxYjdjQzVRSmNET3RaVlJ0RnV6OUpZNHIr?=
 =?utf-8?B?dVdkcVlCWi9oSDdhZWlVOW5Id1NuRVFBQlZWL2R6RWNqazg2ME11L2xCd0dj?=
 =?utf-8?B?YmRBcHBIY2RwYmJMaHBRaG16LzkzL2RkaHFZUFFpK0EvR1oreStHSjNJZVZh?=
 =?utf-8?B?VElzNkhxeDlKRkpucmJLR2ZCVmcwZFRGL0VNb0h3b3NhdllEUGtoMlo5ZlVk?=
 =?utf-8?B?WlE2WWhDM0NhREVzNllBMTY0bWJXR290VklhTlRDcHJGU0tmTU9mOHdNeklN?=
 =?utf-8?B?NmxoZWtrWGkxMXV0SE92Rm8wbnJkTysyMGNvSW9DMXZnZHBqWnVUOENBSm80?=
 =?utf-8?B?dHVqWEFaTmJHUjhFQ3JxeTFzQXhSN2lmaUtaOWRyYWl6cUE0Qkt6UytKRnZZ?=
 =?utf-8?B?SGxRQlZQbHk5SmlSTXdFcmVNRlh2czZlR2NaaTNwRWg5U0oreXQwRDRhaEE4?=
 =?utf-8?B?cjFWTWNGeGtmSDVzeWRGUkpmaFh1QTBwSnBNbDF6QkU4RGNIaFh0TUtTbStu?=
 =?utf-8?B?Qm9FZ20wL0Y1YkRGRE8xcHZWOUFpYko0OFpjb3lBNXQ1STkxa1JLeFdCaEIr?=
 =?utf-8?B?eGswY2NQTVdVbEk1b2Q5Y2krc08xdW5va21rS0pja016dWhqZy9vVnJLYkRi?=
 =?utf-8?B?VlpNL09ETDBwc1A0eUdzK2NHQTlhdkc1cUdZc3FjWUFscWhSUGNoQ1A4UmZS?=
 =?utf-8?B?SmVZU3prSk1CZ0NVOUw0SGdkYmw3UU5xNTN5TmRFQURWMHBLQWEyWDBKVXpF?=
 =?utf-8?B?NXIxZkxkYllXOXVXMlRSZnFJS1ZwRncveWpxbnlJWDJ1enIraDVqWlcxNWJn?=
 =?utf-8?B?bWdsWVZ1eDJsL3NNUUNvd2hsZ2pIbnpDaFpDcGNqUlE4QkxGd0t6b0lDQWZw?=
 =?utf-8?B?OUhGRWprU2VIejFQV0E3cFlyenNnU0N3VmJhamNlVXF2VHZFUHZtSkFwTUZa?=
 =?utf-8?B?dlJYR0ZkQVVhQjF4SjBjVDBCQXJqRXlRbXpGTHowUWhNVjAyOHJndEgzYVZR?=
 =?utf-8?B?YjB6aVd6TlJIRTRjR2JPOU9zMzdTbngzejRkRTFwM01oMUxkeS9LMVBKMG1Q?=
 =?utf-8?B?SDB0ODdKaVZIZG5HOTJlOVEzZ2pSZUlvYUpON1BoZUsxUmRBZWhrWlhHendx?=
 =?utf-8?B?NjlZWThFR3JTbGx3S3RtY1ZjNlM5R29BQjhDeUxNNWpsWm9pWXQwd3ROVkFu?=
 =?utf-8?B?UzlJdUo2RWNzOHBIMVNBS1p1ZnY5cHdZaEJEb3JNMzF2cVdlTWlKMXc3cXFw?=
 =?utf-8?B?UXFVY0RKZVo4TzNIUi93Nnh5UVhFUk8wU2QrN2NURVk4cVZxS2I1K0svNlF0?=
 =?utf-8?B?SXR6NG93a09NUDdTZTZMRkxIU1MrMWhRK3pkaUQ1ZU04b3ViMXpwN0JhQXAx?=
 =?utf-8?B?WWovTVdtL2d4cERuR3J2b2F2STBPTWVHUERHTERBZ09uNDJMWFUvVjN4ckJN?=
 =?utf-8?B?SkNuamRKZFFJVDViaC9LS1dudkQ3SnBlcFB6ZHM4UVp0Z2lPNEhmcGlsQ2pT?=
 =?utf-8?B?amRnQnVWUkludWE4UDZLM09KMFIyZmFQUEhJRnNaSXFZa2lxbTVOSmVVejBO?=
 =?utf-8?B?eWZCbnFkSGI5dHJxYWZxNnQyM2pka0tLMHE3NHA1L0F2OGJ3M1VaZXFBeU9L?=
 =?utf-8?B?TkZLY1A4UHhzVFBoRGZ4a0c3Q285OTJnc25sVk05SUNMNzB2Q3BUVzJBMGR4?=
 =?utf-8?B?TlkrZVVZOURIUERWRERqS0t6Z3VKNERubjU2QzNBOXNCS3c4QTFoU01ZTUwv?=
 =?utf-8?Q?48pjSM4fGyul0jY1yJ7BMMlM+3D8nE/Kgpsno=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5704048172585D4D9AEF6DD98AB30B92@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6003
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f73e0c20-d7e4-49f0-3060-08dd04039ca6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|1800799024|82310400026|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUh0a1ZwTzdyMEVWNTBLTEJML1BwQnlLQi9RdEp0R1RuNzJVeXJETVAxKzNG?=
 =?utf-8?B?cm5EZURnVWJ6VkRiQkVldTBsUGVlc2ZyRWRaQjgvOThmNTJ3c01kYUJXQ2dG?=
 =?utf-8?B?czYvK29maWR3c0h3RERmSjhLUnB3MFVkcUJCdHFOYWo1YjFCc3RkOGhJejhv?=
 =?utf-8?B?U1FjRmJIbjQ0UFpuOXVXUDhvUWxxRDljbkE0aEg5Mkl6YkxXVW5GbmZrVnZ6?=
 =?utf-8?B?dkNHK1p1eHZweVhpL0VhVk5xajNpbTdRR1lhenNibHdlM1VFM1UyMVpoeVlK?=
 =?utf-8?B?Z1cyM1lDYnd2Z2pIZTFWcnRtMm5YNzVIRnJLbm9vRFdRZ3V4NmFvSi9ZSGVW?=
 =?utf-8?B?K0xDeGR3K1BmdDkrNVVhZjJqTUlNRkNreGliTnk3cVNEdWNoekV0VDVwRlhl?=
 =?utf-8?B?T3hGYWROem5yQ2F1d1l1eGNpK3lYMGsxSW0vNmU0Y1pFK0pyN05RVnp0UDBB?=
 =?utf-8?B?bWM1SmVTNEYwN0ZPOW4vRWZIMU9IRHo2eDh4MTFzd0RPNGN3WGxXOG9SWVV4?=
 =?utf-8?B?SzhQRlQvL2lpQ0dCRkVXdW5XSWpVV2JsVXNCa2VqR1doSGpNN1NwNUp4QS94?=
 =?utf-8?B?RjEzUHNYWEJ3VHN4VDFtQU1mcXEyeGR1VnZWNUY4aGE3OU9sVVNadFREQnRR?=
 =?utf-8?B?bmExWlpRSDlBQ3g4aEVZMEhGMWtHZUxZellYUlp1Z082L2Y5YUJrdzZlekNQ?=
 =?utf-8?B?bFdOeE0rZ1I2SG1zbHU1YWF2S1RtM0k2Q1lxSWlwSEd6d2NpN2krV0JKQVFC?=
 =?utf-8?B?YUE4N0dtUm1VbUJ3T0l6N0hEM21xZEIyNjc5alh2aDFrWmtDVEhURXFOZXNx?=
 =?utf-8?B?aVpISDFDcWZuWjNNSmhMZmlLaWhNTXkxaFVOZG5tSklYQnMrOGlWVzEwTm91?=
 =?utf-8?B?dHRNQnoyRHF1ZFNJUkFiZHZYaEE0Q2w4aGdIT3lsQWJTZHQwUnpKQURVaEJI?=
 =?utf-8?B?aEQwMThjSFVpMG1zZm9tVkZ5RGFjdGdBWXh1TmlZdjlrTFVTK0ZPWXgxOTNz?=
 =?utf-8?B?cXd2SzF5eWF0NHZ2Sjh3ZUZLZmxtRHBkTGRzOWxGS05RMVBXTmFvdUdHdERt?=
 =?utf-8?B?SWh1T2VPWTBxc1czL3lnY2I5Tkw3YUJUYzZnMWg5ZHNFdldMZjV4eVNINllX?=
 =?utf-8?B?RjNlN2lBWEFzeDE4VlFCL2dvNmRVZEJjekhMejlpVXZWdXNMWHlvYnUvWG9k?=
 =?utf-8?B?WkhFZVNnSnRnS0pTUWdMTlYyYU4zTGdxTkhHT3hXcjZIVFBOaXh4ODMxZHlF?=
 =?utf-8?B?RFBPZUg2ajVnUmEvc2RFdVlJc1RBZUo2WGE2dC9FMTRTbUFGUk5HS2JndTRp?=
 =?utf-8?B?TytXa2hWSEMrdnFkVnIySjVSMkFWL3A0TU5WU29ldDM0RmQrc0lIaXd6U1JR?=
 =?utf-8?B?VkFOYWVLT205OUZOOHhZV2pnSXBtTUVJczg2c3VwTm96WU5GOXloZU14dUll?=
 =?utf-8?B?SzZEaHNyaUlZMnI4RStyOFlmc1lEaExrWW9iZ3NZTmFub050TmVsdnZuSFgz?=
 =?utf-8?B?MUxqQkdHV3Y3OXFENGJOTm42MW9CS0ZNNmFZeUcyM3g5TkZGUkNPUEs5QUdB?=
 =?utf-8?B?bjJaQXVDYWcwQ1NSZG1EUWZRRkw0cXBMRnl2QS9GUWgya1pkWkRsM01BWC9G?=
 =?utf-8?B?d2wzWnd2RW91ZHdaTmkwNjF6Tkk5Ly9wclFmSVowREVKRWt4KzhMLzI5Q0xB?=
 =?utf-8?B?NUZEY2ozU2MxSHFaaDVUQ09naVRlck8rbENCUHo2K2pnMFh5S2FNUmlrYUhM?=
 =?utf-8?B?ZnJLN0VISEVGTFNsNmlYSjFTcW5DeTdyTksvaUZzM0dvZVpsSWtBbDVEY1Nw?=
 =?utf-8?B?RzRHWmdvK0NjZ3VMWDVOR3I2dzFxOWVHODcycVFqekVSNzc4aFdnSjFCaHZ0?=
 =?utf-8?B?SWd5anAvaTNKMDNDekVYVm8zdys2TUdSd0hHSDFRT2FGUkE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(14060799003)(1800799024)(82310400026)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 16:53:01.5519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91725cdb-452d-4f37-754a-08dd0403a29b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9065

SGkgSnVsaWVuLA0KDQoNCj4+Pj4gLSAgICAgICAgfQ0KPj4+PiArDQo+Pj4+ICsgICAgICAgIGlm
ICggKGFsbG93X21hdGNoX3R5cGUgIT0gTUVNQkFOS19OT05FKSAmJg0KPj4+PiArICAgICAgICAg
ICAgIChyZWdpb25fc3RhcnQgPT0gYmFua19zdGFydCkgJiYgKHJlZ2lvbl9lbmQgPT0gYmFua19l
bmQpICYmDQo+Pj4gDQo+Pj4gV2h5IGlzIHRoaXMgb25seSBhbiBleGFjdCBtYXRjaD8NCj4+IEFw
cGFyZW50bHkgd2hhdCB3ZSBhcmUgZml4aW5nIGlzIG9ubHkgYSBjYXNlIHdoZXJlIG1lbXJlc2Vy
dmUgcmVnaW9ucyBtYXRjaGVzIGV4YWN0bHkgbW9kdWxlcyBvciByZXNlcnZlZF9tZW0gbm9kZXMu
DQo+IA0KPiBUQkgsIGFzIEkgcmVwbGllZCB0byBNaWNoYWwsIEkgZG9uJ3QgdW5kZXJzdGFuZCB3
aHkgd2UgYXJlIGp1c3QgZm9jdXNpbmcgb24ganVzdCBvbmUgaXNzdWUuIEl0IHdvdWxkIGJlIGdv
b2QgdG8gcHJvdmlkZSBzb21lIHJhdGlvbmFsZS4NCg0KSeKAmW0gbm90IHN1cmUgd2h5IHNvbWUg
RFQgb3V0IHRoZXJlIGFyZSBwcm92aWRpbmcgbWVtb3J5IHJhbmdlcyByZXNlcnZlZCBpbiBib3Ro
IHJlc3ZtZW0gYW5kIHJlc2VydmVkX21lbW9yeSBub2RlLCBjb3VsZCBpdCBiZQ0KdGhhdCBpdCB3
YXMgbmVlZGVkIGJlY2F1c2Ugc29tZSBmaXJtd2FyZSB3YXMgcmVhZGluZyBvbmx5IG9uZSBvZiB0
aGUgdHdvIGJlZm9yZSBzdGFydGluZyBsaW51eD8gSeKAmW0ganVzdCB0aGlua2luZyBvdXQgbG91
ZC4NCg0KSXMgeW91ciBwb2ludCB0aGF0IHdlIHNob3VsZCBhbGxvdyBpbnN0ZWFkIG5vdCBvbmx5
IGV4YWN0IG1hdGNoaW5nIGJ1dCBhbHNvIHBhcnRpYWwgbWF0Y2hpbmc/DQoNCj4+Pj4gDQo+Pj4+
ICsNCj4+Pj4gKyNpZmRlZiBDT05GSUdfU1RBVElDX1NITQ0KPj4+PiArICAgICAgICAvKg0KPj4+
PiArICAgICAgICAgKiBTdGF0aWMgc2hhcmVkIG1lbW9yeSBiYW5rcyBkb24ndCBoYXZlIGEgdHlw
ZSwgc28gZm9yIHRoZW0gZGlzYWJsZQ0KPj4+PiArICAgICAgICAgKiB0aGUgZXhhY3QgbWF0Y2gg
Y2hlY2suDQo+Pj4+ICsgICAgICAgICAqLw0KPj4+IA0KPj4+IFRoaXMgZmVlbHMgYSBiaXQgb2Yg
YSBoYWNrLiBXaHkgY2FuJ3Qgd2UgaGFkIGEgZGVmYXVsdCB0eXBlIGxpa2UgeW91IGRpZCBpbiBt
ZW1pbmZvX2FkZF9iYW5rKCk/DQo+PiBUaGlzIGlzIHRoZSBzdHJ1Y3R1cmU6DQo+PiBzdHJ1Y3Qg
bWVtYmFuayB7DQo+PiAgICAgcGFkZHJfdCBzdGFydDsNCj4+ICAgICBwYWRkcl90IHNpemU7DQo+
PiAgICAgdW5pb24gew0KPj4gICAgICAgICBlbnVtIG1lbWJhbmtfdHlwZSB0eXBlOw0KPj4gI2lm
ZGVmIENPTkZJR19TVEFUSUNfU0hNDQo+PiAgICAgICAgIHN0cnVjdCBzaG1lbV9tZW1iYW5rX2V4
dHJhICpzaG1lbV9leHRyYTsNCj4+ICNlbmRpZg0KPj4gICAgIH07DQo+PiB9Ow0KPiANCj4gQW5v
bnltb3VzIHVuaW9uIGFyZSByZWFsbHkgYW5ub3lpbmcuLi4gU28gZWZmZWN0aXZlbHkgaW4gY2hl
Y2tfcmVzZXJ2ZWRfcmVnaW9uc19vdmVybGFwKCkgd2UgYXJlIGhvcGluZyB0aGF0IHRoZSBjYWxs
ZXIgd2lsbCBub3Qgc2V0IGFsbG93X21hdGNoX3R5cGUgdG8gYW5vdGhlciB2YWx1ZSB0aGFuIE1F
TUJBTktfTk9ORSBmb3Igc3RhdGljIG1lbW9yeS4gVGhpcyBpcyBleHRyZW1lbHkgZnJhZ2lsZS4N
Cj4gDQo+IEkgY2FuJ3QgdGhpbmsgb2YgYW5vdGhlciBzb2x1dGlvbiByaWdodCBub3csIGJ1dCBJ
IGFtIGRlZmluaXRlbHkgbm90IGhhcHB5IHdpdGggdGhpcyBhcHByb2FjaC4NCg0KSSBhZ3JlZSBp
dOKAmXMgbm90IG5pY2UsIGJ1dCB0aGUgaXNzdWUgaXMgbm90IGluIGNoZWNrX3Jlc2VydmVkX3Jl
Z2lvbnNfb3ZlcmxhcCgpLCBpdCBpcyBpbiBtZW1pbmZvX292ZXJsYXBfY2hlY2soKSB3aGljaCBp
cyBzdGF0aWMgYW5kIHNvIGNvbmZpbmVkIHRvIHRoYXQgbW9kdWxlLg0KDQpBbnl3YXkgSeKAmW0g
dHJ5aW5nIHRvIHRoaW5rIGFib3V0IGFub3RoZXIgc29sdXRpb24uDQoNCj4gDQo+PiB3ZSBkaWQg
dGhhdCBpbiBvcmRlciB0byBzYXZlIHNwYWNlIHdoZW4gc3RhdGljIHNoYXJlZCBtZW1vcnkgaXMg
bm90IGVuYWJsZWQsIHNvIHdlIGNhbuKAmXQgaGF2ZSB0aGUNCj4+IHR5cGUgZm9yIHRoZXNlIGJh
bmtzIGJlY2F1c2Ugd2UgYXJlIGFscmVhZHkgd3JpdGluZyBzaG1lbV9leHRyYS4NCj4+IFdlIGNv
dWxkIHJlbW92ZSB0aGUgdW5pb24gYnV0IGluIHRoYXQgY2FzZSB3ZSB3b3VsZCB3YXN0ZSBzcGFj
ZSB3aGVuIHN0YXRpYyBzaGFyZWQgbWVtb3J5IGlzDQo+PiBlbmFibGVkLg0KPiANCj4gQ2FuIHlv
dSByZW1pbmQgbWUgaG93IG11Y2ggbWVtb3J5IHRoaXMgaXMgZ29pbmcgdG8gc2F2ZT8NCg0KVGhl
IHNwYWNlIGlzc3VlIGNvbWVzIGZyb206DQoNCiNkZWZpbmUgTlJfTUVNX0JBTktTIDI1Ng0KDQpb
4oCmXQ0KDQpzdHJ1Y3QgbWVtaW5mbyB7DQogICAgc3RydWN0IG1lbWJhbmtzX2hkciBjb21tb247
DQogICAgc3RydWN0IG1lbWJhbmsgYmFua1tOUl9NRU1fQkFOS1NdOw0KfTsNCg0Kc3RydWN0IGJv
b3RpbmZvIHsNCiAgICBzdHJ1Y3QgbWVtaW5mbyBtZW07DQogICAgLyogVGhlIHJlc2VydmVkIHJl
Z2lvbnMgYXJlIG9ubHkgdXNlZCB3aGVuIGJvb3RpbmcgdXNpbmcgRGV2aWNlLVRyZWUgKi8NCiAg
ICBzdHJ1Y3QgbWVtaW5mbyByZXNlcnZlZF9tZW07DQoNCiAgICBb4oCmXQ0KDQojaWZkZWYgQ09O
RklHX0FDUEkNCiAgICBzdHJ1Y3QgbWVtaW5mbyBhY3BpOw0KI2VuZGlmDQogICAgW+KApl0NCn07
DQoNClNvIGluIGNhc2Ugd2UgcmVtb3ZlIHRoZSB1bmlvbiBhbmQgQ09ORklHX1NUQVRJQ19TSE09
eSBhbmQgc28gd2UgYWxsb3cgdHlwZSBhbmQgKnNobWVtX2V4dHJhIHRvIGNvZXhpc3QsIHdlIGhh
dmUgMjU2ICogMiAqIHNpemVvZihwb2ludGVyKSBieXRlLg0KQWRkaXRpb25hbHkgaWYgQ09ORklH
X0FDUEk9eSwgd2UgaGF2ZSAyNTYgKiBzaXplb2YocG9pbnRlcikgYnl0ZSBtb3JlIG5vdCB1c2Vk
IHNwYWNlLg0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

