Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHzxF0pgcmnbjAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:37:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C648D6B77F
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:37:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211682.1523179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viycD-00069P-4k; Thu, 22 Jan 2026 17:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211682.1523179; Thu, 22 Jan 2026 17:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viycD-00066Y-0o; Thu, 22 Jan 2026 17:37:05 +0000
Received: by outflank-mailman (input) for mailman id 1211682;
 Thu, 22 Jan 2026 17:37:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paBm=73=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1viycB-00066L-70
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 17:37:03 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f494576a-f7b8-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 18:37:01 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB7055.namprd03.prod.outlook.com (2603:10b6:806:33b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 17:36:57 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 17:36:57 +0000
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
X-Inumbo-ID: f494576a-f7b8-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2H1VdxzLOxD2V8yjta41z6vnmOg2TL8pTi5BwTzUi2jeZb3XSVnplytBIOit0wVf31+jLXKZ2QHoJtjST1MOKbDW9RS0JSfnj7/pcu8bBv/J6FMGx4iAKDS22koqQfCEDuIY/Ne33gj52gnG871mx/SeItgvKMezs97mhfPdRWm+Q0quSxJ1m7L3JpjJ4jAekJTFWju8Tw2r8aWh7F1ZvfmKqaRxL5wGCe2TB8efJyKOC5SLgYqhcWSWOpgwQ7/XtV3T68WxrV1jEjF6fDkx336C/8ynBicuckIGYEX8npvWL9k68B69K2jDGEwAIuXNfNHYk9Cd3qQjHhZ0rBXiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlAC46lK72spREpnbCGNu31tzXPA7PAIzZjBPAfIdPU=;
 b=ms59JA4kZey91pz/X62lVeAmYvgb80sISvO25r/Ui1I2FtUPmFTWGqx7/v+TcnRQlta6j9WUzICXfvG/VXMcGELsd/K5VwSL5s/ML/R/4VGxfd6MFIu8LntnwYFfCAyHnT5RfcMwquxd2xUHlVbyVjzJfpiuOmuFtLfNnUSjwL6OLrpAmaUvEN5D7A4NqX5WfLyXP8Kzl9Zll7hUD5Oi2khtHkSlwCDP+USDlKYxnpIFem9ZB3RPh3Sce3PeINXC765/Ey6YMTrVuV0/nZM9x7EeVgA0bkQIKH3n6f3UrllJuXX3F5t0zDOV3z+3APpTzRyGwbTraE/8V0+Qmfn7MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlAC46lK72spREpnbCGNu31tzXPA7PAIzZjBPAfIdPU=;
 b=uBm6yll42PqHmgWFxBTso/168Mv5pcmF2+sIUQvfaiCs7AhMPl7J+DC6JqUejraka3FhVDsE5fGGZZq4LWS+cZfKzSQZG3NbIIZ0EJ3erLk2deSdRPEcviWFgTHjFiTj9suDTKqJtGVjKqyYvOeqVpaLE5fihJEuRlEVRsDUe/I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 22 Jan 2026 18:36:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: MTRR init sequence in Xen
Message-ID: <aXJgNUxe3kiqlgaW@Mac.lan>
References: <145af46c-eab5-4d0f-ba35-4ae646c0e4cd@suse.com>
 <e46ceae9-0680-4fb9-adb9-84530745fa4d@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e46ceae9-0680-4fb9-adb9-84530745fa4d@citrix.com>
X-ClientProxiedBy: PA7P264CA0465.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:398::20) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB7055:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fe8b2c7-eef4-4736-09b2-08de59dcd6f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmpBaVl4RkowNmtWa3dDdlR0NGRsTFpUdTkxc3JLNWlPdyt4SjA5ZUs0NGtv?=
 =?utf-8?B?b3R5RXY0OUF0Zlk0VDNFY2FKbzRTWm1WVWxaREZmbXFwcUdjcE9ZLzhNWGZM?=
 =?utf-8?B?WUo0ZG94Y0c2eWRNYWFjYlhXWURQTkRyeWJobFlTcm14K01MQzl3VFVQOU5n?=
 =?utf-8?B?QXM1NGU4OFd4NUVTOHZtNCthQ1cvTGlhc1U1OFdDMHdoejR4YzZhU0dKTk9p?=
 =?utf-8?B?eE9oZS9rdTNLMjFxbVlQVTFoSTRqQStxSjlDTnpBa2Z4V0F0NEJLbjUzNmxl?=
 =?utf-8?B?bmd0SFBBRFdIU0F5SkFNd0xlTEdsQjRrMEtYS2N1eUE5WFEyWjlBQUxlYjE0?=
 =?utf-8?B?UFgvSTdZVWpCN2Yxd1MrdG5hSzRZU2pCQVdNejhoUWhjRGlFcmIwa2ZQb2pE?=
 =?utf-8?B?VlR6VGszdFpFZDAvTlFjQzMvQS9ZaWE1Wk54R2xYV3N5ZnNPaVphalJRS2RV?=
 =?utf-8?B?aEJ4SndNSGR0eDAyb1FFOW4zVkNwT1c2ZjNkM2FRaFlFb3k1NXUwNy84eWFK?=
 =?utf-8?B?cXlocWxsQTFxZFJNNmU1VVY3K2dFZ3lETVdYc2lNTWxQdkFmcXBvdEJmTkU2?=
 =?utf-8?B?OW1zSUFBNWMwK3hsV2JpeGprTmZRZzA1MWkyNzhLQ1h2dHBERVVHRlZmZnRE?=
 =?utf-8?B?SnFjQW4zczN5L0h5K3Y5c3phUE9UbFZYNWdBeG96enFuMWVSVlk5enFFcnRR?=
 =?utf-8?B?Y0l2QzVoMzlOYVVNS1lDRWRCZ3l6cWhGYmY0cVR3ZitOMUM2dzM1bC9hZEZk?=
 =?utf-8?B?eDExMlR0NFdHb0FHd1NZK1YxRTg3aGF4azVaeHY3NE1Pak9QcVgvTTRBdU1V?=
 =?utf-8?B?OWpJaXJSN3VkdElVZzhFRWNyQTI3YzM4VnJrRnJZa29LWnZUL1g1RUZwQk5s?=
 =?utf-8?B?b3J6Q1ZXVFhuQWhaY2l1clNtcGRaMlNQaEw2NWw0U2lvVTMzMDl4MjhiSmsx?=
 =?utf-8?B?QWV2SndnemZaMG1Ob1lMZ0E1dmQ4TUEzQndVNklCZFBZaTBMQ3VPTkRSd1FE?=
 =?utf-8?B?UmZOSUJNOGZkZ0NWdGx6NDAxQllsenNCUkVJT3BJSlkrTlhIcHZnL0tPcTNu?=
 =?utf-8?B?MlE5RGx4SDVucGRWNUxtR0RHSjVlVUZDc3dvMndDNW00Nzh6WHAwWEpWbTJn?=
 =?utf-8?B?ODZyaDBwQ2pUT2p1NFd2QVNNa09GMmNqQzMyT0E0YjE0VTBkNTBaZ0dsY2VE?=
 =?utf-8?B?bi81aW1GQW5FME01U0hRYi8xem9qT2FBeHBCUmRxVXFpUk9wcW90M1ROVHpk?=
 =?utf-8?B?amtnNWJ5Mis4U0t2SEJUSGx1ZENmMnl0U0puWDJBL2FrdFBJWFR2am10TlBS?=
 =?utf-8?B?MzR5cWxxTzFycVp5aGpnVlc0WEJUZHVJYktLRit5ODRJZ3FHT09vMlpBYkZZ?=
 =?utf-8?B?eHJEeEtGeFgzUVV2KzdkT1U2VDZ2NG5vdHJOSXVnbFhtVDA0RXNjRDdtbkRq?=
 =?utf-8?B?QmhxOTBzV2RzQjF3RlFYSmFOcHNKRWNrUm5LQUNaTFFnZ091SnlXRlZDVjJz?=
 =?utf-8?B?THk0MzNpTURKSGF0ek80eFplSUc3aklXYVdJUndzV1AwNUVaN3BLdGlmYXVJ?=
 =?utf-8?B?Rm13NTYwU0UxOGhzQmM3RnBnOGgzdXU5Zk5wemZWUHdPQzRkbDJGOHpiTTVv?=
 =?utf-8?B?L1lpMHpDWGJEUFZsOXpCbkgybW43aE5WcjJjMTVubzhFb3FRc1AvQzdhOUs1?=
 =?utf-8?B?dGhUOFNKM2libmxjM2xXaW9sbVU0K3BlMlU0TmtkNmlNUU1mQmJobjZ0MjRY?=
 =?utf-8?B?Y1NYaGdJSGUxY3gwTm54SWxKeEVpM1hzNXJJUWlFeis0d3N0cVROYzlxSE5D?=
 =?utf-8?B?anpiZmQyaTlMRURKd1pQc3YyWWZFL1R3bG5ZVzRRbXpNVEsrMnlZTVVzNFpP?=
 =?utf-8?B?Ynp1NTNFb3AxWHlXVElEQzJZd3pWOWp4OUk5Y24wQmZoZVhqVU8vVUxYem42?=
 =?utf-8?B?OUpuc2tBWWY2YTVpVU1XcTQwR1FOUDVKOTkyL3VEakpXc3JMTzNPVXBBcTFl?=
 =?utf-8?B?WjEwbW5FSnQyYkh4Tk1CQ2FsYmhhR0RBSER3NXdPenRmblFqZHd1dzdYaXRE?=
 =?utf-8?B?MXJVNVp5TTkzQTF1SjhnbGs3TjA0aFdWVlFvYjJNOGN6VFNtL2c0Wlk1Lzl2?=
 =?utf-8?Q?gq3mNAlvrgyHuHXJCIjoNsouC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MndxV1RDdkR3eGFFeVA2dW9Nd0Y0WTFuQUNpV25pWEJrd1luc0FSaE1CNlBD?=
 =?utf-8?B?SXVrN0l5aDRBcGJMdkFWQ1MyZWR2SkhoQURvR1E1K3djRWdCRlRPby9aMXlC?=
 =?utf-8?B?V3QvUjdoM0syVHJrTkNGT2M4MDRPTWIxWEZaZTZtYjZldjFYbHRwcUJyVmxO?=
 =?utf-8?B?WTM0RE01UjUvL1BPa1BhY1ZjVUxObmVXNXJuSUhIRDNLN2VsaDZEM3JweHpO?=
 =?utf-8?B?NjhENWlpN3dSY1EzTm1ONUMrSTZKd1hmZmdlVnRTVmV5QmxqSG1ia2lDakJL?=
 =?utf-8?B?ck5CU3lVaGdudk5JYnFIa2ZETmFFR1Z5TDFlZkMrT1ltODBUNFB4Z2NVTElx?=
 =?utf-8?B?NEVHTG0xQVNyYjhIbW1ZTjFCWHhpWnRjSFVzNk56YlV0cVByMjg0bzRCUVRU?=
 =?utf-8?B?OE0rd29zUWozQXFJejRYMCtWeGhrVGdvNTI2bVl2NC91Z1V1cVZ6alFtVnFY?=
 =?utf-8?B?aVduM1l4V0xac1IrVjBOTkMxQS9SWU1NWWZBYTBZOHh3Y3QzREZNS0FtS2k3?=
 =?utf-8?B?QXI5L2VBQTc3Q0ZzZTBkSlBkbDFVNitNc1p5dWJzRGR0MzRRbmYwTCtZNUlm?=
 =?utf-8?B?YXNFT2d0b0tsa0FEQXdQQkkxVXRRWWM4VTVNTXB6QlJ1NDNLbTl3b2xwbmtk?=
 =?utf-8?B?eHdzbi8wWExNTlRqODA0SS9NUDZjT0dmaXI2SWxOK2hDRTBUSW11VHlZbG5U?=
 =?utf-8?B?czlRRVdNNUZ3bXV6dU1JUlVDbmp3T1U5T2dLUzgvUTFCVmIwYzBTTEJ5MTBI?=
 =?utf-8?B?RkMwZWhOcDVUNzM5RlEyRDNyMWZUQ0NEMzBCSzdzK2treld6dWdpMythZkdh?=
 =?utf-8?B?RW5FaHpzM1cxdmwySXFtaGZEVHk2MkE4UThnN21ZV1U0bXdIdi9BVzBxT1dN?=
 =?utf-8?B?a3JBWkRaUnFOUlZtajRNZllmV1FqdDdBUkg0N2R6d1lwL0NNNTF3ZlFvd3FS?=
 =?utf-8?B?UTRrcnVHNzNWUVpudGVSSUZ3aWhGYUJzZXdrdzZUWWpOZXhLakdXQkRJSDNI?=
 =?utf-8?B?Tnh1VUU3SG9aanc1amVma3Q4MGUrVUp0NE5lZ095Wi9kTTRzNUpoOVBRYmlD?=
 =?utf-8?B?TXhaK1dnNHk1dmhyb21DSkNDOUpiRHFub2o3eTNPMzRZdllPUmFQSXJnWE9M?=
 =?utf-8?B?VXpVeElUaWNqZUpVZ0tHbEpXVXpUWWRicEMwNnpnYnRoS08xKyt0YW5hdUFR?=
 =?utf-8?B?QStQVnRmQTRIQzdqQmtJUXc2cC9PUU4vRkJnVS9ORVN3eU9WQXU5b0srbkFs?=
 =?utf-8?B?d3d3WjZlS0xiTTJISVVDKy9CUE9qemFOUUFDWUs4TTFncUlEU0ZIMGNhSTE3?=
 =?utf-8?B?U0JreitOMzBGSnRHODZNV1dFV3paSGNvbk1WeW83aFM1dEI4UitXZXR2UHVF?=
 =?utf-8?B?cE5Fc1BXWkdiM092VkVtdlZUcFVFMUk4ak9DQllZYktZWjM3b0xOek9tMDBJ?=
 =?utf-8?B?K0ZueGNPd096VUZuSEFwZkduaDJ6TE1EcGV4TCtSTjZDQkk0Q2dvUGx0a2U5?=
 =?utf-8?B?ZVEvLzhuY2taZzMxeUZ3SStoQVpDUEkwZlBFSlgyQ0xqbXArRytZaGp2VzVV?=
 =?utf-8?B?bjhlZm5JVjNpN0hCeGJsT0laTE9HK0dYelJqeVl4WFFOQ0R2QXFCYmRxNEZu?=
 =?utf-8?B?My9kd3U5TE5RQXBqeTYxZ3RSRmxLSW11Q1ZGaFFtK3BKdCtvYmcyYkZhOVpJ?=
 =?utf-8?B?K2ZwYWdTVmR2S01tTkRhbm80RmhIL0VkWWFlSEQvRFl4VkNTcTZUTzFldDls?=
 =?utf-8?B?clBnR01naUlQdElzeE4rWWhkY0JzcSsxTVR6emRUajJUNHBDd0JadkZ0TzRT?=
 =?utf-8?B?QmlKZ1hGNFcwQ1ljU2RNempTK2JKMXZrR3h5NUE0WlAxY1FoZmUzZ1BaSjdz?=
 =?utf-8?B?ZFRVZTE1dUFSRFZPdklsZlZBYVJPVE0xV2JkWjIrNUlJOTg2a2c5Mm8rYWZL?=
 =?utf-8?B?aGQ3OHBSTmxvcXNYS1IrKzVxa2t6Y1N6bVFzV3VITzFLVkM2ZVFSUEJ0NlBi?=
 =?utf-8?B?VDB5WlZnNjR5R2l2ei84bmFOQXlZQXRxS3c5TERnN3dISGNvVldaY2JWd3NN?=
 =?utf-8?B?VlZxUVpNclR6ZkFWVThhR0hsc3ZuQnlkVUt6STdjNWkwdVdidldCU1AyZmhj?=
 =?utf-8?B?d1lvcloyeDdZcTY1Z0UvLzNCVlBkNkl1UzNxUWp2NDZvUlJRazBzbExyalND?=
 =?utf-8?B?SkRqdjhORGo3WWpEYVNmU1V3dFVKalVsVHFGNldGVUlENUh1UXAzeUwvWHpl?=
 =?utf-8?B?RnBJOFB6SEJWeUl0QWhYN2xQZy8xTkgxaGpBVmxTbG5pQ01sRTNZaXdCY3JN?=
 =?utf-8?B?cXRMcjJMNm5XOHozVHdLalFyc2l3Yk9pUDRvZE80TGQxYm9FVDd3Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fe8b2c7-eef4-4736-09b2-08de59dcd6f7
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:36:56.9808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSEAfYmcyAiGV8Hbvtt2Lw8qEq871O6+oDt6nOw1RjJ+Jdc04dGfef/KyS1jhFLk+gXVebAwuV0jzMY9zvj76Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7055
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,Mac.lan:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.564];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C648D6B77F
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 05:21:12PM +0000, Andrew Cooper wrote:
> On 22/01/2026 3:56 pm, Jürgen Groß wrote:
> > Just as a heads up: a hardware partner of SUSE has seen hard lockups
> > of the Linux kernel during boot on a new machine. This machine has
> > 8 NUMA nodes and 960 CPUs. The hang occurs in roughly 1.5% of the boot
> > attempts in MTRR initialization of the APs.
> >
> > I have sent a small patch series to LKML which seems to fix the problem:
> > https://lore.kernel.org/lkml/20260121141106.755458-1-jgross@suse.com/
> >
> > As Xen MTRR handling is taken from the Linux kernel, I guess the same
> > problem could happen in Xen, too.
> >
> > As the hang always occurred while waiting for the lock, which is
> > serializing the single CPUs doing MTRR initialization, my solution was
> > to eliminate the lock, allowing all APs to init MTRRs in parallel.
> >
> > Maybe we want to do the same in Xen.
> 
> I suspect Xen might be insulated by the fact that we don't have parallel
> AP start (yet), so we don't have the whole system competing on the
> spinlock at once.

Oh, I think I've misunderstood the issue.  Linux is doing MTRR init in
the AP startup path, and so if it takes too long Linux will report
that the AP has failed to start.

This is not an issue on Xen because MTRR initialization is deferred
until all APs are up, and hence is not part of the timed AP start
path.  This optimization was done in:

0d22c8d92c6c x86: CPU synchronization while doing MTRR register update

So even if we did parallel AP startup we won't likely be affected,
because we would still defer the MTRR setup until all APs are up.

Regards, Roger.

