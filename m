Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA7C9E803C
	for <lists+xen-devel@lfdr.de>; Sat,  7 Dec 2024 15:24:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.850716.1265084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJvhy-0005cm-9a; Sat, 07 Dec 2024 14:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 850716.1265084; Sat, 07 Dec 2024 14:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJvhy-0005aO-6f; Sat, 07 Dec 2024 14:22:58 +0000
Received: by outflank-mailman (input) for mailman id 850716;
 Sat, 07 Dec 2024 14:22:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+F2=TA=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tJvhw-0005aI-T0
 for xen-devel@lists.xenproject.org; Sat, 07 Dec 2024 14:22:57 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2606::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf2fa115-b4a6-11ef-99a3-01e77a169b0f;
 Sat, 07 Dec 2024 15:22:54 +0100 (CET)
Received: from AS9PR06CA0110.eurprd06.prod.outlook.com (2603:10a6:20b:465::29)
 by AS2PR08MB8999.eurprd08.prod.outlook.com (2603:10a6:20b:5fb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.24; Sat, 7 Dec
 2024 14:22:49 +0000
Received: from AM4PEPF00025F97.EURPRD83.prod.outlook.com
 (2603:10a6:20b:465:cafe::94) by AS9PR06CA0110.outlook.office365.com
 (2603:10a6:20b:465::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.14 via Frontend Transport; Sat,
 7 Dec 2024 14:22:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F97.mail.protection.outlook.com (10.167.16.6) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.0 via
 Frontend Transport; Sat, 7 Dec 2024 14:22:49 +0000
Received: ("Tessian outbound c267e87e9f97:v522");
 Sat, 07 Dec 2024 14:22:48 +0000
Received: from L75766dc71869.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4AB1FB90-0ED1-47EB-A475-26219F216410.1; 
 Sat, 07 Dec 2024 14:22:42 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L75766dc71869.3 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 07 Dec 2024 14:22:42 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DBAPR08MB5608.eurprd08.prod.outlook.com (2603:10a6:10:1a5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Sat, 7 Dec
 2024 14:22:37 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8230.016; Sat, 7 Dec 2024
 14:22:37 +0000
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
X-Inumbo-ID: bf2fa115-b4a6-11ef-99a3-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GN+uYZ7TbidrRLp3htBSEsJ+EMzCfq2O2gWIs3ihYuYbqc/IslMC/MyxHZNAso8x2aNHXGpXnxuq9LqLOEqi9Mt5NeXAZ0DsO2xIsp/A9PEY6V8FjDU0k1Td20zHNoKclpvlJ7ycZbzFB9cVbYsucXDcT7MrXDvL9bZ1lChk60eBZEmDLMNwPeT89DZL/ITpVzFoEjyKNEqy0GHO4YDWR8kzZ95MQCanOCDOmovsHYKRznGyFG9ywBtXJKn3DO8xP7tHnIfuQKS4fopRxsxegGtAZUcGLpkvQ7UcQ8BBXq6grgH2Jmbv+LyFF8zitqHGQ3b4ThqiBiLfqWC4GTe6hw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjg6SbQSrbWZeOUJmTnq+i/dGyvRusweKp9+LjxjinA=;
 b=swYlE1uX8Fxy30adtFWucCodK5A9UoT1/Zo3cs/eP50t1tkKCsbXSNNC8I1HuEk5M7liGE9uloJybHzrUxDhW/9O7DX1lcYXjQ8YqYVMBbv9UfOQL00UaujyCcT9ROMxijciD0bzAJazTi0gz1RYPtoFwHEhYEEKZbHI9zc9KRIricAbq7u1lv4I2wwaGe1ypDGRi2bMbAL0o5zc3GTDg9pyFX4Qz7HmobWSmavEcWQIOs8/B//n/T5vKZr/jA6tBqFWeMTfHc4KDu68GPByHqXxR8GEsBX9sfTb/bQWjOa1gKHzGC0Kg+hBB1ObCzTg9eOnrje1q1htKy2qDhLInQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjg6SbQSrbWZeOUJmTnq+i/dGyvRusweKp9+LjxjinA=;
 b=CWCHjm+xFG1vDrj758eesphLAY4sqkqJIfJKZucHxb4lNsmE749Y5Ypk9chcU7zqFfBpy24RkTTeThRG0wyAaLlYEgdynorW11sreaD3FUYj3RbVqNmiPwQj+UrEBfO8ceJZhl/i0i3y0kL2ROugAbAsoVuBCcXLzPwfFoZ3nxc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c39016705bb5611b
X-TessianGatewayMetadata: KR2o1nWGUo/eDQS+JWXmKVp2wtmdWFhDMfm9zPmC8BIgQK/CqSL2z16xwvVizV/hqWrBANZOy6xY5vC4UxWbtaZK2291F0+k7m6B9Wih86gPSvuB4pQlmN6WqEYcZbMFnKx/8K3S7TeSKvViBnrytjzAxMv4ZbEdV0djWCaCUG8=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ay1U1DwpJ5a/FZfNU8AP7Kpxl6xdn+BBmvHkP3AQ/GR7PKCw72CyU6JReyJW9ZZTmMX+R6W9VnkeZfX10QigrrKxoCB38MkJIW+lKKooZfh9wai6IecavgDv2coUBsw8ZnJ+6n2nDtRpWR7wy/+ZqSVf9y3Bb0rx8ew1Zp8nI3AF0WAW0PuovmbizXV+mc/Cg4wlJzfUJPRgDK+Xhgj1P18093wdMOhIVaCiyAJv8glLYKT1QRsvU/NUzgh6dcm6rax0kC9PjxIstYCdkFusvowObduBIcDPEOEgOIZ7vA13DojTVovNs7CQ37vosQ4sEbwVBYi3ERDv+S+gDJJlTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjg6SbQSrbWZeOUJmTnq+i/dGyvRusweKp9+LjxjinA=;
 b=Q/YdKLbkkZF5p2wwMnHOKNEx98uI1YDSTtk4xE212WmkuCOWJi1ToLDWIJk238sjY5lUEl52s/nn37nWOoEDKHd8HJfIL3rXt5WR7PUG4CCXaPIEXSL8+xL/d3yCe1FFmHQQEdvJv+VfxT2IwpOGVhpRk9/aInF2bFbw3lmM8V/lGdbPI4TJ0biuLUXFR16Y7jg4hb8QsOHpzMgJ/enXB2oINCiYt83A120NFVRYWOY7WYgxlGZFKT71cTc/2DauULwnAaYWwvNf6YIJ2dP9Rmp6zXr4nMXQPBujutuQQEIa3VUxeDQNpqtJl5+IV5sX8gbwE1lnO3p61+QtQJ2NjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjg6SbQSrbWZeOUJmTnq+i/dGyvRusweKp9+LjxjinA=;
 b=CWCHjm+xFG1vDrj758eesphLAY4sqkqJIfJKZucHxb4lNsmE749Y5Ypk9chcU7zqFfBpy24RkTTeThRG0wyAaLlYEgdynorW11sreaD3FUYj3RbVqNmiPwQj+UrEBfO8ceJZhl/i0i3y0kL2ROugAbAsoVuBCcXLzPwfFoZ3nxc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Penny
 Zheng <Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v4 4/5] xen/arm: Check for Static Heap feature when
 freeing resources
Thread-Topic: [PATCH v4 4/5] xen/arm: Check for Static Heap feature when
 freeing resources
Thread-Index: AQHbRWiMK0NBCC8wPk6qtayhLuvPaLLZnNkAgAE/IIA=
Date: Sat, 7 Dec 2024 14:22:37 +0000
Message-ID: <B5AE754E-2A3D-488C-8759-A7C7865BFB10@arm.com>
References: <20241203094811.427076-1-luca.fancellu@arm.com>
 <20241203094811.427076-5-luca.fancellu@arm.com>
 <00c7c6ce-f50d-43ac-b411-3e051b9bb582@xen.org>
In-Reply-To: <00c7c6ce-f50d-43ac-b411-3e051b9bb582@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DBAPR08MB5608:EE_|AM4PEPF00025F97:EE_|AS2PR08MB8999:EE_
X-MS-Office365-Filtering-Correlation-Id: 147a22cc-0967-4522-e7f7-08dd16caa0b2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?SGFPSGRKMDBQVkV2YVJMcGJLcEVOcGJsMTNaL1h3SU5ENElIL0VqZGIzZENy?=
 =?utf-8?B?c1BWZDBnekFQcXYwSW9ZN3BJRXRWRUM1bE1sYXVyZHpTSjNoV0VHM015bmFO?=
 =?utf-8?B?TCtOeVAyYnZtV3RhZU11L2lPTzJmT3RmalIxWHV0S2Q2dHNEdzBQY1lzRi95?=
 =?utf-8?B?L253ckNBdXJscXBVWGFUemw0NHpQVjA1R3pzVTcycDFtZ0R6K3pvVkZ4Z24z?=
 =?utf-8?B?TzJ3cEhXU3l0eHg0emJZVG9ncnFwcmlieVlnYXJvQnIwZTUzMk40UGhuM2pF?=
 =?utf-8?B?YkxLUHRwOGk4ekNDVExzeFh1c2pDeU1pMnRHTDhjWkF4dlJsWFp3cXA1OTls?=
 =?utf-8?B?TmNoNTNYN2tldXdpd1pUL1M0RnEzZVRUc2pxd3FLSGlFbEplNloyaFRxbGpu?=
 =?utf-8?B?c3NpMmdBVWgzRE9SYUtwUEdpSlhYazhqM3BSUDhmRVBtcUYyQmduaitpZUVu?=
 =?utf-8?B?cnlJbm5OeVBXeDJCNXJwMUUxUStlZlRsZ3A2V20vVmU0Y2N1dU4vdkdBUlFj?=
 =?utf-8?B?WTg0aUlOZkNSNDFHRzRkSHhRTXlseDhYY0kyU0JSQWk1aWxuV3EyZEZvWlpj?=
 =?utf-8?B?TTBHT0xkSkhlM3JOV1NLZDFVYmdYaWxGTlVlWGQzcFpWTTBRRklsRG9KZVJa?=
 =?utf-8?B?U1JKb2pzSVFveDlCTHFMMU00c1NpV0xkMFFIYmFvY2tDUmQ0eTUrWEtaTmd4?=
 =?utf-8?B?SGpkWEJPdDZxR1BVdU1iVDNnci9vZkN0cmR1SmE5d0I0REZlT3RyM0s1ZVE1?=
 =?utf-8?B?c1NJZXE3WE9vc1JHRmkyc09pRUhRdGZoU0pLeEdPeFlZVWtBRkVBVFY3dTlK?=
 =?utf-8?B?ZUlKNWkwaTVxSExRTDhZQVgzdGI5dHQ3azdPbFduaUNXdGVmMnJLNkt4NElP?=
 =?utf-8?B?ZWppVDU4UWFzdHNmcndKQkF0WG13MHhEdjRGekw3V3lnZHJFVFNaV2UzbVln?=
 =?utf-8?B?bzk5a3p5dG5PRWdhcWJtMTRQNERzb3lJOXkrQ0hvMWoyYXI5MHQ3OTh3SEkv?=
 =?utf-8?B?RjhtRlBzRWRZbG9QaTNpYlV5NWpPWTNHcmR3WXVXRnBRT0l4a2dpUGF2U3FC?=
 =?utf-8?B?MnJoQW5JOEFyQlF4RnQyLzBjbERUS3VSQzUwdnVlWFlIYWtVbFg0T3I0dEY0?=
 =?utf-8?B?dmJyQi9ieTc0MkJDWHMxemd5OWhJS29ONEo2M0UzQ3RyN0pyekp2TEw3QTEv?=
 =?utf-8?B?ZGlGRUtLdHdnY1VheWFuc2hZYUdxZGxWY0FSTW5OUnRCM2x5N3dBTDRxR3hq?=
 =?utf-8?B?ZGVaSTI2eEdTcXNHY1NIL3N1NmFpR1BrNXRCZFpqaHE0M1ZDTnRmUmM5azR1?=
 =?utf-8?B?UGNwbXN6WEZoRzN4ZlJpTUNadmUvU3VRZllQYzBGc0lsTkVPVnJmLzhlTGFN?=
 =?utf-8?B?U1BDT3gwWHVyUlREcEUrWUFnVTFMT0J4RWdrRjErZ2ErMmM0WGFmSWFzTkVZ?=
 =?utf-8?B?MmtDaWpJN242NVJJOGQ2Z2VhVWpiZjNIYitVWlhWSkROTzE5R0lDTTNUUlov?=
 =?utf-8?B?ZTNCSjFWbGF3cHoxeDRMUE9ZREpuSzd2Q0F0aG1Wdllwa1VOVjVaZ2hhRDQv?=
 =?utf-8?B?eHpVbk02bktxM2VPN001ekJKbklYeDZqeE1WOEJCMXdzdkFEcXMrK21JVHJ1?=
 =?utf-8?B?V1RMS1I4RS9oblNKeW96MkplUXJCUCszcFFPRjkzZjRrU2taclcyZW1hQWpK?=
 =?utf-8?B?WWZZZFZyMnB6TFFQaFhOZ0ZSWkxicnJVd2l2UWVSWXBVMEljQlRXc3hmeTJ0?=
 =?utf-8?B?RUxXSDFHVUhabFg1Mkk3NEJDNzNEMTZvcmFlcFM4WXhjUHdQam5WdytJTXlD?=
 =?utf-8?B?YlZ0cGR2WWUrY2lrUEU2RmgzbkRJSmtyYytoYkQrc1VKTXJRREd0cE5xdW1I?=
 =?utf-8?B?M1NLSTh3eVVsamNuRlRIb0M3QjhTdDZxcEhOeHR4NFNSVmc9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0B5CF9B46FE33043BE803C8E4F515933@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5608
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ee9bf355-0f40-4df5-bc25-08dd16ca9984
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|82310400026|14060799003|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T090VldhYUFoUEtud3N6MkFaZXdOYUFqN0h4RGhiUDJJUzNKeTdpZGk5ZnRB?=
 =?utf-8?B?Zll2T2M5MW5KWFZYajVTTFNES3RKQkZGUVB1QUtMdkVlYkIxY2paYVJpbFE2?=
 =?utf-8?B?TWVPakJBN25MQ3dRa1Y3Mzcwbm9pZHFKR0NvTUJ6NXI3dG5KN3ZCYVFCREl3?=
 =?utf-8?B?RkNQQ3oyU2hZQzZMM00yZzViY29nZjdxV29obm1MMDU2Smx1bFptZksyOU5h?=
 =?utf-8?B?UVNZbnhQNXZVellYWkY5eGJCSG5nbEt3Vk0vaGxjSm9xdjN2R3NHdFN1cTBv?=
 =?utf-8?B?SzZkYXFsMHkvMC9CbU54Ymc3QllsbVNoTWxhQloyckRIYTNxT0RRNHlzT2Vq?=
 =?utf-8?B?MEpEUnlhbnoralhsRDVOaTlmVU02V1hXSjl2Njd5UmNPL1VlUzRJNXFmSUZn?=
 =?utf-8?B?Zm14a1NhNitXUnBWT2ZKaW1qZ1JUWm90V00vd0p3RDBZd2FiUlBaOVQwMmNH?=
 =?utf-8?B?eHFuL09GN2NUaW1XQkFNd1h3UHhoNFRXeTRpMFMvd3JNSjNzUUV5enlTcHNx?=
 =?utf-8?B?TzlOelJHQzB6TFhPc0lYazd5TUc4cnp2MjNqSzNsODVkbktlVFZYVDdXMlk2?=
 =?utf-8?B?bVhNaFJHYjliV2F1TFdBWVppTDFXampkL2JjV1UwMWtXenlqSVd6aVFodTRJ?=
 =?utf-8?B?NThlM1lhMXBpOUNaOUczbWx1L0dBa1JhTnQ1VVlGb3dELzNRNUZUWnRVcW54?=
 =?utf-8?B?Nzg1NmNYVExZcDlUVkpLN20xbWhWbVNjMExTaDQwOVZybmhxMUJjRFNQcm1l?=
 =?utf-8?B?UlVLekRtZDFPZnZQNXNNTGtUdkZCWHlPaTEwY2Y2ZnpQb2w2SHFWUDlyV3hj?=
 =?utf-8?B?NWJlV3hGYWxtbk5IMUlZamVHT3I0VjJjM0VzendKUnRzMmVyWWl6WU9oNWJv?=
 =?utf-8?B?T1lQa1ZMNHp4RzdiUDJKZ3BSdDJyczVVOWFSMlBOZjRkRmd6UXE3YUM2eTlr?=
 =?utf-8?B?Zm1jeWliclBaaTcwUVllZzZsc2tPanlvRVdsQ0RYcnZMejZ6WVRwTVIxYmVF?=
 =?utf-8?B?WXYvZzYwblVsNFIwQ0ZMdTloaVA1b0RBQlNPdHh6eFNBUHpyZkpHRng0QTg1?=
 =?utf-8?B?S0c2S054dGppanhFRGtVT2hLQTNNR2FuN1lOWFFWWE5POHcrcGEzUlExdWll?=
 =?utf-8?B?OUJ4cXc0MFJQYWNEM2U5bnk0V21jZ1pHZ1IvY2swaklaVHlMTElMaCtBdmdX?=
 =?utf-8?B?c2dOaFkycmszU3ZlK0FHOVp0OU1odHUvT1RaU09hajY4TzhlT0Fna3E5Y1dm?=
 =?utf-8?B?bDlHMWxCdEVMS0U4YkNQVlQ0NXVOLzZoYVVmdnVLK0FHbmhYSHEvMS9HUHpv?=
 =?utf-8?B?Vnc3SndtNExhN0VnVFlHM2FuOE96eHcreW9ycjhnT2tTL3FaajZLczNpT01E?=
 =?utf-8?B?QzZRV3pDTWlHWDdVWUhzY3Mwa1NUWlBaQWpXVDY3alhhTjJhUERwWU5uTnJG?=
 =?utf-8?B?Q0pGeU0wWHZBVk4xWk5YT0FabVRpK2x1Q1FubUhmVVkxRjEvRk9vLzdXa0gr?=
 =?utf-8?B?RlBGVGUyMitQdmFLVWFiZnVYSTUxVi9GMW05VmtGcFVUUzk2V2d6K0VHM3o4?=
 =?utf-8?B?TnN0NCt0MVFCaTFCclpCSlhGN3lVK0JBZDNqeENla2tDZkRnS0g3SU92bHYz?=
 =?utf-8?B?QVZxYmJXdGd3eENBQm5RT1kvTnJuY1FGY1l3T2ZoZUt5elludS85QVhxZjBV?=
 =?utf-8?B?VkVpL2c2c3h4MG9QOGphZk15V1RIN2VHRWlZMHBrakkxaGUxOStiMnd6RjZC?=
 =?utf-8?B?ZHlEdzZKNVRmWHVnM1l2cEdiTXd1WW8wWFdBejNkV0FDcDI1TGdWbnRsUnM4?=
 =?utf-8?B?THdTdDQzNWl6U0lDbnVIbjZQZ0ZzaDZSYXNTbXpKVEJ3akpEOGo4R2tuRzBG?=
 =?utf-8?B?NVFuNW5oa2NFdFphNjM3NUU0R3lrUGtlMms1U0RqaVEvSXBqVXJOTEpqaHZt?=
 =?utf-8?B?MEVNdEdIU1Jqano1U2Rwek5yOW5pSWxjTzducEtOa3ZzdXc5OWlKa3JXenhp?=
 =?utf-8?B?enJsYXFRYVpBPT0=?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(35042699022)(82310400026)(14060799003)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2024 14:22:49.1137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 147a22cc-0967-4522-e7f7-08dd16caa0b2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8999

SGkgSnVsaWVuLA0KDQo+IE9uIDYgRGVjIDIwMjQsIGF0IDE5OjE5LCBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBPbiAwMy8xMi8yMDI0
IDA5OjQ4LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9tbXUvc2V0dXAuYyBiL3hlbi9hcmNoL2FybS9tbXUvc2V0dXAuYw0KPj4gaW5kZXggOTY2NGU4
NWVlNmMwLi44Yzg3NjQ5YmM4OGUgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vbW11L3Nl
dHVwLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9tbXUvc2V0dXAuYw0KPj4gQEAgLTM0MSw4ICsz
NDEsMTIgQEAgdm9pZCBmcmVlX2luaXRfbWVtb3J5KHZvaWQpDQo+PiAgICAgIGlmICggcmMgKQ0K
Pj4gICAgICAgICAgcGFuaWMoIlVuYWJsZSB0byByZW1vdmUgdGhlIGluaXQgc2VjdGlvbiAocmMg
PSAlZClcbiIsIHJjKTsNCj4+ICAtICAgIGluaXRfZG9taGVhcF9wYWdlcyhwYSwgcGEgKyBsZW4p
Ow0KPj4gLSAgICBwcmludGsoIkZyZWVkICVsZGtCIGluaXQgbWVtb3J5LlxuIiwgKGxvbmcpKF9f
aW5pdF9lbmQtX19pbml0X2JlZ2luKT4+MTApOw0KPj4gKyAgICBpZiAoICF1c2luZ19zdGF0aWNf
aGVhcCApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIGluaXRfZG9taGVhcF9wYWdlcyhwYSwgcGEg
KyBsZW4pOw0KPj4gKyAgICAgICAgcHJpbnRrKCJGcmVlZCAlbGRrQiBpbml0IG1lbW9yeS5cbiIs
DQo+PiArICAgICAgICAgICAgICAgKGxvbmcpKF9faW5pdF9lbmQtX19pbml0X2JlZ2luKSA+PiAx
MCk7DQo+PiArICAgIH0NCj4+ICB9DQo+PiAgICAvKioNCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vc2V0dXAuYyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jDQo+PiBpbmRleCAyZTI3YWY0NTYw
YTUuLjIyYWIzNDJkYzhmNCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9zZXR1cC5jDQo+
PiArKysgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYw0KPj4gQEAgLTIwNiwyNCArMjA2LDI1IEBAIHZv
aWQgX19pbml0IGRpc2NhcmRfaW5pdGlhbF9tb2R1bGVzKHZvaWQpDQo+PiAgICAgIHN0cnVjdCBi
b290bW9kdWxlcyAqbWkgPSAmYm9vdGluZm8ubW9kdWxlczsNCj4+ICAgICAgaW50IGk7DQo+IA0K
PiBMb29raW5nIGF0IHRoZSBjaGFuZ2UgYmVsb3csIGl0IHNlZW1zIHRoYXQgZGlzY2FyZF9pbml0
aWFsX21vZHVsZXMoKQ0KPiBpcyBhIE5PUCBmb3Igc3RhdGljX2hlYXAuIERvIHlvdSBmb3JzZWUg
YW55IHJlYXNvbiB3aGVyZSBpdCB3b3VsZCBiZSBkaWZmZXJlbnQ/DQoNCnlvdSBhcmUgcmlnaHQs
IHRoZSBjb2RlIGNvdWxkIGJlIGEgbG90IHNpbXBsZXIuDQoNCknigJl2ZSBwcmVwYXJlZCBhIGRp
ZmYgb24gdG9wIG9mIHRoaXMgcGF0Y2ggaWYgeW91IGFyZSBvayB0byBkbyB0aGF0IG9uIGNvbW1p
dCwgYnV0DQpJdCB3b27igJl0IGJlIGEgcHJvYmxlbSBmb3IgbWUgdG8gc2VuZCBhbm90aGVyIHBh
dGNoIGZvciB0aGF0Lg0KDQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3NldHVwLmMgYi94ZW4v
YXJjaC9hcm0vc2V0dXAuYw0KaW5kZXggMjJhYjM0MmRjOGY0Li44NWY3NDNhMmM2YWQgMTAwNjQ0
DQotLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAuYw0KKysrIGIveGVuL2FyY2gvYXJtL3NldHVwLmMN
CkBAIC0yMDYsMjUgKzIwNiwyNyBAQCB2b2lkIF9faW5pdCBkaXNjYXJkX2luaXRpYWxfbW9kdWxl
cyh2b2lkKQ0KICAgICBzdHJ1Y3QgYm9vdG1vZHVsZXMgKm1pID0gJmJvb3RpbmZvLm1vZHVsZXM7
DQogICAgIGludCBpOw0KIA0KLSAgICBpZiAoICF1c2luZ19zdGF0aWNfaGVhcCApDQotICAgIHsN
Ci0gICAgICAgIGZvciAoIGkgPSAwOyBpIDwgbWktPm5yX21vZHM7IGkrKyApDQotICAgICAgICB7
DQotICAgICAgICAgICAgcGFkZHJfdCBzID0gbWktPm1vZHVsZVtpXS5zdGFydDsNCi0gICAgICAg
ICAgICBwYWRkcl90IGUgPSBzICsgUEFHRV9BTElHTihtaS0+bW9kdWxlW2ldLnNpemUpOw0KKyAg
ICBpZiAoIHVzaW5nX3N0YXRpY19oZWFwICkNCisgICAgICAgIHJldHVybjsNCiANCi0gICAgICAg
ICAgICBpZiAoIG1pLT5tb2R1bGVbaV0ua2luZCA9PSBCT09UTU9EX1hFTiApDQotICAgICAgICAg
ICAgICAgIGNvbnRpbnVlOw0KKyAgICBmb3IgKCBpID0gMDsgaSA8IG1pLT5ucl9tb2RzOyBpKysg
KQ0KKyAgICB7DQorICAgICAgICBwYWRkcl90IHMgPSBtaS0+bW9kdWxlW2ldLnN0YXJ0Ow0KKyAg
ICAgICAgcGFkZHJfdCBlID0gcyArIFBBR0VfQUxJR04obWktPm1vZHVsZVtpXS5zaXplKTsNCiAN
Ci0gICAgICAgICAgICBpZiAoICFtZm5fdmFsaWQobWFkZHJfdG9fbWZuKHMpKSB8fA0KLSAgICAg
ICAgICAgICAgICAgIW1mbl92YWxpZChtYWRkcl90b19tZm4oZSkpICkNCi0gICAgICAgICAgICAg
ICAgY29udGludWU7DQorICAgICAgICBpZiAoIG1pLT5tb2R1bGVbaV0ua2luZCA9PSBCT09UTU9E
X1hFTiApDQorICAgICAgICAgICAgY29udGludWU7DQogDQotICAgICAgICAgICAgZndfdW5yZXNl
cnZlZF9yZWdpb25zKHMsIGUsIGluaXRfZG9taGVhcF9wYWdlcywgMCk7DQotICAgICAgICB9DQor
ICAgICAgICBpZiAoICFtZm5fdmFsaWQobWFkZHJfdG9fbWZuKHMpKSB8fA0KKyAgICAgICAgICAg
ICAhbWZuX3ZhbGlkKG1hZGRyX3RvX21mbihlKSkgKQ0KKyAgICAgICAgICAgIGNvbnRpbnVlOw0K
IA0KLSAgICAgICAgbWktPm5yX21vZHMgPSAwOw0KKyAgICAgICAgZndfdW5yZXNlcnZlZF9yZWdp
b25zKHMsIGUsIGluaXRfZG9taGVhcF9wYWdlcywgMCk7DQogICAgIH0NCisNCisgICAgbWktPm5y
X21vZHMgPSAwOw0KKw0KKyAgICByZW1vdmVfZWFybHlfbWFwcGluZ3MoKTsNCiB9DQogDQogLyog
UmVsb2NhdGUgdGhlIEZEVCBpbiBYZW4gaGVhcCAqLw0KDQoNCg0KDQo=

