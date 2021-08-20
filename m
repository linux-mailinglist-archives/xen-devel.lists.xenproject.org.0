Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E3B3F2958
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 11:38:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169382.309399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH0yU-0001YI-GQ; Fri, 20 Aug 2021 09:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169382.309399; Fri, 20 Aug 2021 09:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH0yU-0001V6-CK; Fri, 20 Aug 2021 09:38:06 +0000
Received: by outflank-mailman (input) for mailman id 169382;
 Fri, 20 Aug 2021 09:38:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pH7i=NL=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mH0yR-0001Uy-RJ
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 09:38:04 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.42]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f76e89a-019a-11ec-a694-12813bfff9fa;
 Fri, 20 Aug 2021 09:38:01 +0000 (UTC)
Received: from DB6PR0402CA0017.eurprd04.prod.outlook.com (2603:10a6:4:91::27)
 by PAXPR08MB7003.eurprd08.prod.outlook.com (2603:10a6:102:202::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Fri, 20 Aug
 2021 09:38:00 +0000
Received: from DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::e4) by DB6PR0402CA0017.outlook.office365.com
 (2603:10a6:4:91::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Fri, 20 Aug 2021 09:38:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT057.mail.protection.outlook.com (10.152.20.235) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 09:38:00 +0000
Received: ("Tessian outbound 6ba9ec11d42b:v103");
 Fri, 20 Aug 2021 09:37:59 +0000
Received: from 0f63a7a849fd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EC22822B-E282-4FBC-AB63-B830E74CC84C.1; 
 Fri, 20 Aug 2021 09:37:53 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0f63a7a849fd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Aug 2021 09:37:53 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB6281.eurprd08.prod.outlook.com (2603:10a6:10:1f6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 09:37:52 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 09:37:52 +0000
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
X-Inumbo-ID: 4f76e89a-019a-11ec-a694-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RW/gyf2iCiwYmfZT7FunosTtbcg0LG5KZYigRpBtjvI=;
 b=a2JaZHlM0V1zXDRlZCAKMifkB0kI5HvkVqSabSD9eP0s+WKneRw1M4vFUo5uKvqDa/zkYgVibiFvssTsjX49YHIYgKVNqH8kez3gYliZsfqJ0RPysWVieLFl3FIDUq/Pc2O3zro2hbo5iq9lQxYt5YkE9svVOpS1uLCRR8nLKxc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9QY7BNBnohxm/uTi2pEhWg37JM6K6Kg4haRuyUhr1hHvrBVnp6ParlRk4xkpoWS8aBBXIpK88CLCeCT6AkFljixhAlHHGLzudAvia1XR2SNVezi2cJGlRG3gmNHVxCZKs3W6VM/+H64KXbRp5JwdoTMtNjGkG2CqndoBlkRXCgyQ3TTsACbOFP+RULMaTfeHXQ0eIIpghAdc5l9itg9RMQo0s29Yv0usxBaFXsozZlymIIGQsdQwcd5TUkZyb3MHKKcPNSm6Y8TbVTQLesjbgEVl+B/iTZkjmaM3m8TEFYoqrDihPIMld/I2kx92qU6aasIFRwlQWyMRAB9v8Qsgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RW/gyf2iCiwYmfZT7FunosTtbcg0LG5KZYigRpBtjvI=;
 b=lSET7EVIEAp8g8UyoASoY2NEBexiPUbA8t9RJVd+jOh/4DBZGmMIWqSwZXQe+LMwoQbfNZ4ToQvv9JKv8uyPU5FigPGDP9orVfb+DW+9IWzGms+CArXlf2LJdbwkpEhHqavYAo2HXtFfkgdk9JtmWLsDqv4m7qjYbu5KhnOGQNjt4+eu7qnwJfHs+2oR/Apwv1VtjPfLoI05GKL14oPmnevdW3ULDYc+uQ4Bj9LyPu2UxZdyVaCMyO7zGRAkMJ8knTfohlyApE6CI/fX2bfj/RdWk42tq0KvStPGE208wTRXYI+5s5xs9nbs1MiOosXMVVR/zoT3Fhyr9C0BR9oFQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RW/gyf2iCiwYmfZT7FunosTtbcg0LG5KZYigRpBtjvI=;
 b=a2JaZHlM0V1zXDRlZCAKMifkB0kI5HvkVqSabSD9eP0s+WKneRw1M4vFUo5uKvqDa/zkYgVibiFvssTsjX49YHIYgKVNqH8kez3gYliZsfqJ0RPysWVieLFl3FIDUq/Pc2O3zro2hbo5iq9lQxYt5YkE9svVOpS1uLCRR8nLKxc=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 04/40] xen/arm: return default DMA bit width when
 platform is not set
Thread-Topic: [XEN RFC PATCH 04/40] xen/arm: return default DMA bit width when
 platform is not set
Thread-Index: AQHXjpsgsRofIZVQlECQrMelX8Mpkqt63vUAgADFfsCAAHazAIAACk/g
Date: Fri, 20 Aug 2021 09:37:52 +0000
Message-ID:
 <DB9PR08MB685782C02B95DB20F4E1626F9EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-5-wei.chen@arm.com>
 <61893862-6b8f-9c1b-367b-7e0c837a43c5@xen.org>
 <DB9PR08MB68572A84F6A73644C4FE3F609EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <35fdd7c0-0607-e2b6-776d-adf9eea2c0e2@xen.org>
In-Reply-To: <35fdd7c0-0607-e2b6-776d-adf9eea2c0e2@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: AF81E28F34E7344E81F00457697AE350.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 30d7856b-d3d4-4dc7-493e-08d963be3300
x-ms-traffictypediagnostic: DBBPR08MB6281:|PAXPR08MB7003:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB7003C3C513078BA27ACF1E239EC19@PAXPR08MB7003.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Hl0NSblM8+9XYh/p5EaR6PYQ+cIFljCCh6tlkMxN7UEI1BO8nVQccuY/ldTse/5muEW2MpVRfwEewag6KBdLm2ZYaF0F9iQZoW3UDdRFhRX9j8q3v3/McLwVeKUYvdEoYuwWdOxhMFVgTy2gOjHvjyHtnGdMjscis3vLh9aqMklJ7brb4QN+YYJduFFPBXdNcqpTk9kXQFTvpiEqRn91D3Bpxc1evYn0bujLGrG/4WKpO+Z4YONlz06YuT2foLxFb0lvPBGreNGg8VEHwflY7eG34On16t9V0bx8JPOZpHt1hclMrWAo9Z4pB2UqcAqObAIb66p3qZh/naeSFgbAefqGwKK0+4FjLuyW5DcLgh5O1vOtaLEV/0+XGeC47YaIdHZ8l0KFSr6Bme9coJk1mn2bikQ3DR6U3AJ0fJZNtloeqxlkB8dw85VnS1n2rlEitM6POTS+iAu4yctA+BQ19sx7Y4nFIlMfBzfqZGTg/givLyxDHk9QDAQSP6SCDPKLLeCwwndkdrt59BxVT1aG7HENYkWeeHwk1r6ovz2IBnoN+k/7APVYjl3JcQcz86fwPnsTS6OMjV6+IrbTkdgTwubekPcs9OhDs3haa6uMniOcn8/Tn8GeGBY06bPlaW3I6E06aLSDAPgEW9d4gHQiOYzl2e0CbBkZkxTJpIIrhtpM8z13cZvdUeEm7B57MJRV3TY8E/+lRwpNXhm5WRJ05w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(316002)(66446008)(7696005)(6506007)(110136005)(66556008)(4326008)(66476007)(66946007)(76116006)(53546011)(9686003)(64756008)(52536014)(55016002)(71200400001)(86362001)(8676002)(186003)(8936002)(33656002)(478600001)(5660300002)(38100700002)(83380400001)(122000001)(38070700005)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YlYvTmIxMTByZkp4WGxuV2prNk9wemFEL2VHK1NnZlcwTWpUVHFCd0pzY3Bz?=
 =?utf-8?B?TEovRFB6ZlBYUHFxbFpURlY4SFdOVy9Pd3BqRXlnL0V6a1FvUFY4K2RvQVl4?=
 =?utf-8?B?OVBiem9CNnREdkladzMzTGo3c1hiSFBEVmVyTndyK2pzc1BrclFXZ3ZFUzB6?=
 =?utf-8?B?Y3JwK0xxTGlxQmdLdnZnZlFpUWV6NUVuL1RIS3A2d2tIQThaVldsMjNBQWVS?=
 =?utf-8?B?WDhTTnA4NTMxQ3UrY3FEY2JaQXJwcmdlbVh6dEZoeXRBb3JvelZtMndkWlpC?=
 =?utf-8?B?U0kvMFd6bGtoSVNpUW1WNXozeXcvenBtUXhiaWNySXUrOW9FUWc2ZUZ3bWtn?=
 =?utf-8?B?VEV5eDI2VnRhT1ZOODlnQmhxbk1NMHFUalVzek1zNVdMaEVSVnFWenhBS1Ni?=
 =?utf-8?B?bnFZWVZjRGF2YmZyMjhnUTdwTkQzU24vcFZjdFdadmhSZk9ZR095bDBxTTUv?=
 =?utf-8?B?TFdxQXNOeFIzd0VNYms4ZHhKZG5VYk5EeVNTVks5RHFpVW5TeGJhWjZweEx6?=
 =?utf-8?B?VmQvTzEvbWEvNFcvUUJOYTVLalZoU1RXeGZoZ09qSVVDWFBFd01PS2hNdGtJ?=
 =?utf-8?B?SjJWZmRvU0ZQbkFmZ1BhckxsSlVDNE5kV1VvOWpqV2h0NkZ1MGJzNWFpVS95?=
 =?utf-8?B?M2JMRHo5dE50Nkw1cUtIZW5ZdG8yc1RybXJQQkQzMlBCVGROZExrblZJUWZa?=
 =?utf-8?B?NjhJWGYwRjNBN0FPVHMvMEV4SWJ1TUhRWWxhSFVFV3JqWHR1RE85Y2VBaGd6?=
 =?utf-8?B?dGxPTEt1RHdLUkN5Sy90bkZWMW9RZmlydjVlSElScVhEbVJuUUpZb3h4TUFa?=
 =?utf-8?B?d2hRVVo5azE4b3NsQWg1bzByTElXbzFldmZoMUwxVEdFQllQREhDK1J6WHZS?=
 =?utf-8?B?QkdYN3NsUytSSFJENEVIQ1IvKzVNUy9XVldWYkFDVWtLT1hvMXZGempwei9E?=
 =?utf-8?B?UVVXYnVHdGNJeVFzMGg3OWxKbEI2VVp6bDNzSnFDZlN4Skx1M011b3g4cHM4?=
 =?utf-8?B?czZGSmwxNEJlN3ZOaWV3RDlVaEJxZnhqbnN0UzlRWkExeXF3SzV4VnhwcHJI?=
 =?utf-8?B?bHlTOFlDbWdpRWFCODZNaStiL01PUFJYVUt3N3B6MURJQWEwbWJsYTFTTHF3?=
 =?utf-8?B?UFZvRlFCak94R1ZwVDhmK2txZ2szS0I2WDJnV0NpUElYUU9Dc3lQanFGbFdz?=
 =?utf-8?B?WC9ORUVodEYvWUhBb2hxZHlRL093cWZpMDV1aWNGN3dWYkRVWHY2eUYxamI1?=
 =?utf-8?B?MERjV3ZtclVXc3IrWTZFNVpJN0pFN2ZyaHoxQWg2aXlJMERNYlRPVVRxWDl2?=
 =?utf-8?B?TDczeDEwdDgvdTNMc00xNFNzVmFrZ0FmcmlIWjJDcXUzbHFuS01xSTZLWmZL?=
 =?utf-8?B?SE9icGpKS3FrNjlJWDE1WnBoQTZOZWpyVVprcDVmSU1QQ3ZSSld4anp6VEo3?=
 =?utf-8?B?eXBwNXZTcU0wdkR2SjBMSFV4T1VnYmZzV3VTQk50Mk55N1VFMm9WckozNCtH?=
 =?utf-8?B?dEtKMjNzaHIvM05IVVhrYUJScDhDWjF5UkFlbU1HOUNMd0EwQm1zeFNQVlIy?=
 =?utf-8?B?dTBwcnVoZG5DbnBlVmFwa0E3R0RmYytNVGFFTmVYc2lEdHpKZUp2VXR0d1hZ?=
 =?utf-8?B?TGtINU9kVUNIRmZsOUFDN0VjTnE2emdaWElUQmE4dUxIaS9LZTl3TXhpdHNM?=
 =?utf-8?B?VDNNM2J1c3E3YkNWQzQ4N2NGRHYwN1UwcnVOdmJsM2toSjZ2WlpmbHpsdTdB?=
 =?utf-8?B?TlZ6U3pwRjFUcWFHMUFYUEpUTVZmUnp3aTdDN0JNamtUd0hZM1hEcGtLWWFK?=
 =?utf-8?B?a1FEZUNzK2V4dmg5K3BZdGhWMWVFTFh6N2NreFI0aFVRcVRtRytLb1ByK21z?=
 =?utf-8?Q?E0o/8MqMsXx6t?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6281
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	db6f8be9-1463-404b-bc36-08d963be2ea7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X7EEmgqjYkPkmMHFjiAZCi+uDnHKibLBWAlgJN4Gp4yKVzmz1nLy31rQzq0TSmKqm7fhYQvhe3H1r4cmWQUeJQ3We17/fuCo1pzLlaMeXA2D05bxJK82Yrzl22YfqJkvzPp3KJ0Yp93lP64Q0SDKfG02Udlyx6TS1NGxRrDHAPN6JtsMRCCqfdnADgyfIUBDmwi+NB7n+E8T/vb2J7EAvc5y5TdbbVTjX4nC8UlhbZ2MCPmO/RgAS5abUPAZhoqZHsVv20ny3E4CApP37TgEBdqHWdMq2vc4iU13R5+oIhIO1X7xHi5TGDFj5y0LzPPm4dAMGmrDDXrkaVv0aFwgWxlhwehe36lvQJ4vk8q5kboYJtFjCttsHx3h80i+viuEMr3IuiA1aBT+FC1OCoDCrL6+T5yzwr7/WVNkpHjEkXWf1f6mPNIneR8vrVhluMLEwRKmAKAx4YmS2FtCrgpLI2t6NyAsKw0F/KMjT9fY9q8QoLd2nD7Y4lrh2FGgeyZRCLq4qkGLAZzov003Do++qcuPxbrqxpz6ZXI0OXa6Z5KUB10IZYtTXU3+c5HGjq8yNUk8NpfVbi6fFNzWKKlOh5f7N0b5BWgyTaiW+pytexH3jDRtUplYi1pejXC9ZdYZkrlK9ghrUFpllmOlzQyQyxehu9QxtKfwN7egPf8ILkjhTytnU4KrjzCsn8m5L0ywwwW2FO7aSeSlWHH6mjbnow==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(46966006)(36840700001)(26005)(2906002)(8676002)(4326008)(356005)(336012)(86362001)(5660300002)(6506007)(70586007)(81166007)(7696005)(478600001)(33656002)(9686003)(55016002)(70206006)(186003)(82740400003)(47076005)(52536014)(316002)(82310400003)(110136005)(8936002)(36860700001)(83380400001)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 09:38:00.0158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d7856b-d3d4-4dc7-493e-08d963be3300
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7003

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjDml6UgMTY6MjAN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqYmV1bGljaEBzdXNlLmNvbQ0K
PiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMDQvNDBdIHhlbi9hcm06IHJldHVybiBkZWZhdWx0IERN
QSBiaXQgd2lkdGgNCj4gd2hlbiBwbGF0Zm9ybSBpcyBub3Qgc2V0DQo+IA0KPiANCj4gDQo+IE9u
IDIwLzA4LzIwMjEgMDM6MDQsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IEhpIEp1bGllbiwNCj4gDQo+
IEhpIFdlaSwNCj4gDQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206
IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4+IFNlbnQ6IDIwMjHlubQ45pyIMTnm
l6UgMjE6MjgNCj4gPj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiA+PiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqYmV1
bGljaEBzdXNlLmNvbQ0KPiA+PiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVp
c0Bhcm0uY29tPg0KPiA+PiBTdWJqZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMDQvNDBdIHhlbi9h
cm06IHJldHVybiBkZWZhdWx0IERNQSBiaXQNCj4gd2lkdGgNCj4gPj4gd2hlbiBwbGF0Zm9ybSBp
cyBub3Qgc2V0DQo+ID4+DQo+ID4+IEhpLA0KPiA+Pg0KPiA+PiBPbiAxMS8wOC8yMDIxIDExOjIz
LCBXZWkgQ2hlbiB3cm90ZToNCj4gPj4+IEZyb206IEhvbmdkYSBEZW5nIDxIb25nZGEuRGVuZ0Bh
cm0uY29tPg0KPiA+Pj4NCj4gPj4+IEluIGN1cnJlbnQgY29kZSwgYXJjaF9nZXRfZG1hX2JpdHNp
emUgd2lsbCByZXR1cm4gMzIgd2hlbiBwbGF0b3JtDQo+ID4+PiBvciBwbGF0Zm9ybS0+ZG1hX2Jp
dHNpemUgaXMgbm90IHNldC4gSXQncyBub3QgcmVzb25hYmxlLCBmb3IgQXJtLA0KPiA+Pg0KPiA+
PiBzL3Jlc29uYWJsZS9yZWFzb25hYmxlLw0KPiA+Pg0KPiA+DQo+ID4gT2sNCj4gPg0KPiA+Pj4g
d2UgZG9uJ3QgcmVxdWlyZSB0byByZXNlcnZlIERNQSBtZW1vcnkuIFNvIHdlIHNldCBkbWFfYml0
c2l6ZSBhbHdheXMNCj4gPj4+IGJlIDAuIEluIE5PLU5VTUEgc3lzdGVtLCBhcmNoX2dldF9kbWFf
Yml0c2l6ZSB3aWxsIG5vdCBiZSBpbnZva2VkLA0KPiA+Pj4gc28gZG1hX2JpdHNpemUgd2lsbCBu
b3QgYmUgb3ZlcnJpZGVkIGJ5IHRoaXMgZnVuY3Rpb24uDQo+ID4+DQo+ID4+IGFyY2hfZ2V0X2Rt
YV9iaXRzaXplKCkgaXMgYWxzbyB1c2VkIHRvIGFsbG9jYXRlIGRvbTAgbWVtb3J5LiBXZSBuZWVk
IHRvDQo+ID4+IGJlIGFibGUgdG8gYWxsb2NhdGUgc29tZSBETUEtYWJsZSBtZW1vcnkgdGhhdCBj
YW4gYmUgdXNlZCBieSBldmVyeQ0KPiBkZXZpY2VzLg0KPiA+Pg0KPiA+Pj4gQnV0IGluIE5VTUEN
Cj4gPj4+IHN5c3RlbSwgb25jZSB0aGUgb25saW5lIG5vZGVzIGFyZSBncmVhdGVyIHRoYW4gMSwg
dGhpcyBmdW5jdGlvbiB3aWxsDQo+ID4+PiBiZSBpbnZva2VkLiBUaGUgZG1hX2JpdHNpemUgd2ls
bCBiZSBsaW1pdGVkIHRvIDMyLiBUaGF0IG1lYW5zLCBvbmx5DQo+ID4+PiBmaXJzdCA0R0IgbWVt
b3J5IGNhbiBiZSB1c2VkIGZvciBETUEuIEJ1dCB0aGF0J3MgYWdhaW5zdCBvdXIgaGFyZHdhcmUN
Cj4gPj4+IGRlc2lnbi4gV2UgZG9uJ3QgaGF2ZSB0aGF0IGtpbmQgb2YgcmVzdHJpY3Rpb24gb24g
aGFyZHdhcmUuDQo+ID4+DQo+ID4+IFdoYXQgZG8geW91IG1lYW4gYnkgImhhcmR3YXJlIGRlc2ln
biI/IEFyZSB5b3UgcmVmZXJyaW5nIHRvIHRoZSBzZXJ2ZXINCj4gPj4geW91IGJvb3QgWGVuIG9u
Pw0KPiA+Pg0KPiA+DQo+ID4gWWVzLiBJIHdpbGwgY2hhbmdlIGl0IHRvIHNvbWUgbmV1dHJhbCB3
b3Jkcy4gc29tZXRoaW5nIGxpa2U6DQo+ID4gIkJ1dCB0aGF0IGNvdWxkIG5vdCByZWZsZWN0IHNv
bWUgaGFyZHdhcmUncyByZWFsIERNQSBhYmlsaXR5LiBUaGV5IG1heQ0KPiBub3QNCj4gPiBoYXZl
IGtpbmQgb2YgcmVzdHJpY3Rpb24gb24gaGFyZHdhcmUuIiA/DQo+IA0KPiBUaGUgdGhpbmcgaXMg
RE1BIGFiaWxpdHkgaXMgbm90IGFib3V0IHRoZSBwbGF0Zm9ybSBpdHNlbGYuIEl0IGlzIG1vcmUN
Cj4gYWJvdXQgdGhlIGRldmljZXMgKHRoaXMgY291bGQganVzdCBiZSBhIFBDSSBjYXJkIHlvdSBq
dXN0IHBsdWdnZWQpLiBXaGF0DQo+IHlvdSBzZWVtIHRvIHN1Z2dlc3QgaXMgbm8tb25lIHdpbGwg
ZXZlciBwbHVnIHN1Y2ggY2FyZCBvbiB5b3VyIHBsYXRmb3JtLg0KPiBJcyB0aGF0IGNvcnJlY3Q/
DQo+IA0KDQpPSywgSSB1bmRlcnN0YW5kIG5vdy4gTGV0J3Mga2VlcCAzMi1iaXQgYXMgZGVmYXVs
dCB2YWx1ZSwgYnV0IGV2ZW4gaW4gdGhpcw0KY2FzZSwgaG93IGFib3V0IERNQS0xNiBkZXZpY2Vz
PyBBbHRob3VnaCB0aGVzZSBkZXZpY2VzIGFyZSB2ZXJ5IHJhcmUsIHRoZXkNCnN0aWxsIGV4aXN0
IDogKQ0KQW55d2F5LCBrZWVwIHRoZSBhcmNoX2dldF9kbWFfYml0c2l6ZSBhcyBvcmlnaW5hbCBt
YXliZSB0aGUgYmVzdCBhcHByb2FjaA0KZm9yIG5vdy4NCg0KDQo+ID4NCj4gPg0KPiA+PiBBbnl3
YXksIHRoZXJlIGFyZSBwbGVudHkgb2YgcGxhdGZvcm0gb3V0IHRoYXQgaGF2ZSBkZXZpY2VzIHdo
aWNoIGNhbid0DQo+ID4+IERNQSBpbnRvIG1lbW9yeSBhYm92ZSAzMi1iaXQuIE9uIFJQSSwgdGhp
cyBpcyBldmVuIGxvd2VyICgzMC1iaXQpLg0KPiA+Pg0KPiA+PiBTbyBJIHdvdWxkIGJlIGNhdXRp
b3VzIHRvIGNoYW5nZSB0aGUgZGVmYXVsdCBsaW1pdC4NCj4gPj4NCj4gPg0KPiA+IEhvdyBhYm91
dCByZXR1cm4gMCB3aGVuIHBsYXRmb3JtIGRvZXNuJ3Qgc3BlY2lmeSB0aGUgbGltaXQ/DQo+ID4g
SW4gbXkgb3BpbmlvbiwgYXJiaXRyYXJ5IHRvIGdpdmUgMzIgb24gQUFyY2g2NCBkb2Vzbid0IG1h
a2Ugc2Vuc2UuDQo+IFdlIGhhdmUgdG8gY2FyZSBhYm91dCB0aGUgY29tbW9uIHVzZS1jYXNlLiBX
ZSBhZGRlZCB0aGlzIHJlc3RyaWN0aW9uIGENCj4gZmV3IHllYXJzIGFnbyBiZWNhdXNlIHdlIGhh
ZCBhIGZldyByZXBvcnRzIG9mIHVzZXJzIHVzaW5nIG9ubHkgMzItYml0DQo+IERNQSBjYXBhYmxl
IGRldmljZS4NCj4gDQo+ID4gQnV0IGFzIHlvdSBtZW50aW9uZWQsIGlmIFhlbiBpcyBydW5uaW5n
IG9uIGEgcGxhdGZvcm0gd2l0aCBETUENCj4gbGltaXRhdGlvbiwNCj4gPiBidXQgd2UgaGF2ZSBu
b3QgbGlzdGVkIHRoaXMgcGxhdGZvcm0gaW4gWGVuIHN1cHBvcnRlZCBsaXN0LCBYZW4gY2Fubm90
DQo+ID4gZ2V0IERNQSBsaW1pdCBmcm9tIHBsYXRmb3JtLT5kbWFfYml0c2l6ZS4gSW4gdGhpcyBj
YXNlLCByZXR1cm4gMCB3aWxsDQo+ID4gYWxzbyBjYXVzZSBzb21lIGlzc3VlLg0KPiA+DQo+ID4+
IEF0IHRoZSBtb21lbnQsIHRoZSBvbmx5IHBsYWNlIG9uIEFybSB3aGVyZSB3ZSBuZWVkIERNQS1h
YmxlIG1lbW9yeSBpcw0KPiA+PiBmb3IgZG9tMC4gVGhpcyBpcyBhbGxvY2F0ZWQgYXQgYm9vdCBh
bmQgY2FuJ3QgY2hhbmdlIGFmdGVyd2FyZHMgKGZvcg0KPiBub3cpLg0KPiA+Pg0KPiA+DQo+ID4g
Rm9yIERvbTAsIHdlIHNxdWFzaCB0aGUgcGF0Y2gjNSBpbnRvIHRoaXMgcGF0Y2g/DQo+IA0KPiBM
ZXQgbWUgYW5zd2VyIHdpdGggYW5vdGhlciBxdWVzdGlvbi4gV2h5IHNob3VsZCB3ZSBtb2RpZnkg
dGhlIEFybSBjb2RlDQo+IHJhdGhlciB0aGFuIHRoZSBjb21tb24gY29kZT8gSU9XLi4uDQoNCkFz
IEkgYW5zd2VyZWQgYWJvdmUsIGxldCdzIGtlZXAgYXJjaF9nZXRfZG1hX2JpdHNpemUgYXMgb3Jp
Z2luYWwgdGhlbg0Kd2UgZG9uJ3QgbmVlZCB0byBtb2RpZnkgQXJtIGNvZGUuDQoNCj4gDQo+ID4N
Cj4gPj4gU28gSSB3b3VsZCBleHBsb3JlIHRvIHJlbW92ZSB0aGUgTlVNQSBjaGVjayBmb3IgZHJv
cCB0aGUgRE1BIHpvbmUuIEZBT0QsDQo+ID4+IGJvdGggc3VnZ2VzdGlvbiBhcmUgZm9yIEFybSBv
bmx5LiBGb3IgeDg2LCB0aGV5IG5lZWQgdG8gYmUga2VwdC4NCj4gPj4NCj4gPg0KPiA+IFdpdGhv
dXQgaW50cm9kdWNpbmcgbmV3IGZsYWcsIHN1Y2ggYXMgbG93bWVtX2Zvcl9kbWEsIGl0J3MgYSBs
aXR0bGUNCj4gPiBoYXJkIHRvIHNraXAgdGhlIG51bWEgbm9kZSBjaGVjay4gVW5sZXNzIHdlIGNy
dWRlbHkgYWRkICNpZmRlZiBBUkNIIHRvDQo+ID4gY29tbW9uIGNvZGUsIHdoaWNoIGlzIG5vdCB3
aGF0IHdlIHdhbnQgdG8gc2VlIC4uLg0KPiA+ICAgICAgICBpZiAoICFkbWFfYml0c2l6ZSAmJiAo
bnVtX29ubGluZV9ub2RlcygpID4gMSkgKQ0KPiA+ICAgICAgICAgICAgZG1hX2JpdHNpemUgPSBh
cmNoX2dldF9kbWFfYml0c2l6ZSgpOw0KPiANCj4gLi4uIFdoeSBkbyB5b3UgdGhpbmsgd2UgbmVl
ZCB0aGlzIGNoZWNrIG9uIEFybSB3aGVuIE5VTUEgaXMgZW5hYmxlZD8NCj4gDQoNCkkgZGlkbid0
IHRoaW5rIEFybSBuZWVkcywgd2hhdCBJIHNhaWQgaXMgaW50cm9kdWNlIGEgZmxhZyB0byBkaXNh
YmxlDQp0aGlzIGNoZWNrIGZvciBBcm0gb3Igb3RoZXIgQXJjaGl0ZWN0dXJlcyB0aGF0IHRoZXkg
ZG9uJ3QgbmVlZCB0aGlzIGNoZWNrLg0KDQo+IFdlIGNhbiBkaXNjdXNzIGhvdyB0byByZW1vdmUg
aXQgb25jZSB0aGlzIGlzIGFuc3dlcmVkLg0KPiANCg0KSSB0aGluayB3ZSBjYW4gc3RhcnQgdG8g
ZGlzY3VzcyBpdC4NCg0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

