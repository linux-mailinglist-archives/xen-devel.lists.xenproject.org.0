Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 210DBA5DE43
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 14:43:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910320.1317046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsMLw-00058y-Qh; Wed, 12 Mar 2025 13:42:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910320.1317046; Wed, 12 Mar 2025 13:42:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsMLw-00055s-Nq; Wed, 12 Mar 2025 13:42:32 +0000
Received: by outflank-mailman (input) for mailman id 910320;
 Wed, 12 Mar 2025 13:42:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FzNf=V7=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tsMLv-00055j-J3
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 13:42:31 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20627.outbound.protection.outlook.com
 [2a01:111:f403:2612::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7547f75-ff47-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 14:42:29 +0100 (CET)
Received: from DB8P191CA0003.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::13)
 by DB9PR08MB8267.eurprd08.prod.outlook.com (2603:10a6:10:3c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 13:42:25 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::c1) by DB8P191CA0003.outlook.office365.com
 (2603:10a6:10:130::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Wed,
 12 Mar 2025 13:42:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B621.mail.protection.outlook.com (10.167.8.138) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Wed, 12 Mar 2025 13:42:24 +0000
Received: ("Tessian outbound 68993334049c:v585");
 Wed, 12 Mar 2025 13:42:24 +0000
Received: from Lbd23429c381e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BA5CA704-160C-4FC8-A905-432236EF8D6A.1; 
 Wed, 12 Mar 2025 13:42:17 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lbd23429c381e.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Mar 2025 13:42:17 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 AS8PR08MB6309.eurprd08.prod.outlook.com (2603:10a6:20b:29f::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.28; Wed, 12 Mar 2025 13:42:16 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 13:42:16 +0000
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
X-Inumbo-ID: d7547f75-ff47-11ef-9898-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QUwyTMgWF4fyu3ltFUGqNbQEvI2zBqC9pl1fCMxhkFwuUORkrA1DHuTx7X36qaztYYCvGgX35V9m6lsJvNWFrDSmE7jL4Os9OkfWpCbtDZapBxApY2h/WvvSHsyNiRInhVykHetiw1jLe/BkJHVYf49c2QXr7t0/BKh3XE+Jfi+2bypLQHWB1uCEZM4fOpHLULMuAOj32BJtodnYOG0CPKr3KXM9iIp9cXWABlIPcQTPZJ3JkeHGC7yhuq/K0RKKqqeOaHjrsF8Tzkx5F7sm2K2XWBII1M+vhCw9+n5CfpQofcG7uMp2sbMotxnTSd3z1ISdvs3FZMF1idO2Vesuog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUorhL/cDoVsrZuPiFNaHtBZh4NIPDluDjfcPvJd0B4=;
 b=Ced81jvkc7Hn/ciG4mVsEDXbs+CeJAEM7uSnE5lwGdT4DlcuPGXAgWoLen3qOKLd1ArHjIOyOI4geADXWjRdteGG5ohi8criImB3Uk/QxqxFCILxTPSSEqpp7m/VJG063kEcU5IwpxlcZ2404DtdaoVO7gOf2a5MnvW46ktCYtzJBOUYaGv/m+mSbPKe123ddWqeuX+h2KU0Ss3h27GA8TmbvgV3UOBdhNYi2clEZCgzEoU8Aoky1tmUA6QEWZBFUtlTQ7AIYLO3UhZCffHLd90f0Wmlr8x4uRDSuU+VF45voywAYvACFe7Jip2HtiUtUum4TsPXqFF8UeV33FBFGA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUorhL/cDoVsrZuPiFNaHtBZh4NIPDluDjfcPvJd0B4=;
 b=TVs1NZv02x2FQhe0ed5RZRYmr1oRq0E+SH9dP+eRmMBIYMNPwYnKxyl9jRmBjOFbY2e2B8KI8go8naGxEeriJP23X7t+zUf/3heWyzQygUBBQxzDlQ3tjY2Uf60fAGCj3T8SifYvZasZJqW/2+ezBDqHKWZ8YnU05yaDN4dGrTw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b09be3d7dd726057
X-TessianGatewayMetadata: kwygBCOO9U4CRiCai4hSgT4HMWHHDr1NF8VfWwlu3y86PNWK02SmA9cerblrOUjglbFmjjGB+v+2lZ6R8n8loaqptkkkBwQ8at9JOwiclMjAobrJvvFwOcBjoS/AmjY9qzRr0UkNCxM5QTXG51QjGF94CaBKOvHYHnWqEH1647E=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4UrUQGQ38I7L8UwPTrlx5rpPagBIodK3hAyG/0dRLE3u5hq/UMLKwHOyzXORDu5A85lYT6NuoMB/J05uWleNi+ewbcMQXmkqm8OsfUxn4FVnKh5e7AD1qwJA0ASpMcCYGLjyv6obQaQ3KKh9AnDdkIwjArzmN4EmXaQXXhRMhfCT7UX2CSWOjm7RdZDe3USnY3y+Wm4Bq5Sei5NU49Xj8KXSB6YyATB9YCQTO2qggsw7vhTrUMx1/Ll34Wwy5bnuD1Hu4HFQUCLASgG9pWJ/WoHr0Ni1bI19yJ6qEX7B85PedIZ+gNxgJRMocFBi927aaz2w8dzWw5Ycq38iuOmvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUorhL/cDoVsrZuPiFNaHtBZh4NIPDluDjfcPvJd0B4=;
 b=InMb74S5OESvmz5SKkwzMS2IsksetOOxPfgi4PfybYRr/N782jzI+WdJvMxIblsDcD2MWj3vwfTmQ6wapWX5kq0c4t/DZeeWMKfIgacOotpweMydyyuZe8obW9LEZKDC5g6iia6iR3m+NSHr/I18CJ//9l+Tb33X95QdyKLDv74r3ePO/qIo6nwVQ2AcHu/50czyabedAtuwX1271mYVYXPe9CTYARhXgRrlRNnuuKQHTR+TUkzNcvFhCY2YxppAme1mYp1GEV8O+7lF8ABw2l0ROtqdEW770x2PlT1R63IujzjPYO03IcFUozdtLwtDAjbnm8pX+xCXF4l54yS/Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUorhL/cDoVsrZuPiFNaHtBZh4NIPDluDjfcPvJd0B4=;
 b=TVs1NZv02x2FQhe0ed5RZRYmr1oRq0E+SH9dP+eRmMBIYMNPwYnKxyl9jRmBjOFbY2e2B8KI8go8naGxEeriJP23X7t+zUf/3heWyzQygUBBQxzDlQ3tjY2Uf60fAGCj3T8SifYvZasZJqW/2+ezBDqHKWZ8YnU05yaDN4dGrTw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH] x86/shadow: replace p2m_is_valid() uses
Thread-Topic: [PATCH] x86/shadow: replace p2m_is_valid() uses
Thread-Index: AQHbk0I7T648T2mJH06AjRu7xZ2e/bNvgniA
Date: Wed, 12 Mar 2025 13:42:15 +0000
Message-ID: <D5C00D3C-4BD0-4CBE-B989-DDEB529FF1D6@arm.com>
References: <6a7391fc-4abf-4e65-8159-30f4eae8fec5@suse.com>
In-Reply-To: <6a7391fc-4abf-4e65-8159-30f4eae8fec5@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|AS8PR08MB6309:EE_|DU6PEPF0000B621:EE_|DB9PR08MB8267:EE_
X-MS-Office365-Filtering-Correlation-Id: 8636a0b9-5dd3-4f8d-9240-08dd616bb8be
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Zkl6RDdJdnIrSEN4Ni9uMVVoQUN2RjRwUllVS21UcjBNU0RwWUZFRXVDUEl5?=
 =?utf-8?B?S09udFVoRVRRMTMxcFlqT054YmV2UmJ4SlVQMmFtK2VOZG13dklJMUpycU9Z?=
 =?utf-8?B?N3NwaVMzbDFkaWdFUVhSQURxeVpTRWdCK1FxMkhzbjNWNkxPKzcrOFplY0Rt?=
 =?utf-8?B?RjV0NWhFRU5CVHlrRmZjWjRCd2N0dGJ4dDd4RDZROG1DT1VHRU9vbFd2NUNI?=
 =?utf-8?B?TG1MdlhkR3JQdjMzbGdubllKNTgrb1pEYVE2aktmbGFHeWpBUHhUbytBQVpZ?=
 =?utf-8?B?cmFLbjNlWk1FVW12QUtnT3diSFpvUThSU1FkL2dTTnJqQ0tvOEdQL04zYUdM?=
 =?utf-8?B?cWw1MVhVSTBVQ28xUnNXNzVQUUVneUx6OGQzZllKSmFQSHpQLzVhUGxnM3My?=
 =?utf-8?B?WTc5RmZKV1NCQUNvbEl1dG1ub1RTSFFkLzNqZGVXVkdISHRMQzZQMkVvZkw1?=
 =?utf-8?B?ck91OTE4UnozajlGRXdzNWhsL09waXZvR0tCR3RsNWYvb25WNFducllGRVFk?=
 =?utf-8?B?MVVMYU4vR3Zmc0VMWHhPb3lYK1lPUW03ellxT0ZZRzV1VWVPVms2NE5uT1A4?=
 =?utf-8?B?M2V2dXluZ05uNXY5Mnh3dHdaclI5MTl0WUVkKzI0L1BIb3RONW8venZycEkz?=
 =?utf-8?B?Z1VaYTRQdXNVVk9NVFBOVWt1bk5CWStvUVRydC9wNHNDN3FDMHZtL09LMUhQ?=
 =?utf-8?B?V0sxMVRvYnIyUFZiQUE5TnlRTVhzd3hiMGtPSWlvTEFVU01acjZzTXJEZ3ZT?=
 =?utf-8?B?bENMYTcwVG12YlR1YzRxVlBUZXpsaG1rTEJlcUZxZEZjK1k4elpOV0ZvY1Zw?=
 =?utf-8?B?RzJxRlZIUk85amNvMWVIbXkzZStvN285VUJZODRDR3NaQmF2cFlxc2FTVTN3?=
 =?utf-8?B?L2tWdllWb2J0amJpWFFPWkphM3BSSTFvUVQ3cjRRSWowOHIxcEZkc0lITEVk?=
 =?utf-8?B?ZWdQbklVK1NiaDFFZElCSzA5V3ZRbXgvNC9SakloTkFnNXhJZFJrL211QXdU?=
 =?utf-8?B?WTROV3F2elJzeWZJTjRJdndCU0ZnZU1OdDh5RzdWb3NmUHlBU1lvQno3TmF2?=
 =?utf-8?B?d0VnTUpFS2hiWW41bjB1eHdxb0paQzU1bXdiYlVLNHlTYVZ5WVBwZEpvY2dH?=
 =?utf-8?B?bElKNGNOTjVJOFhoL3NPd2ZObWVnd1V4WEQ3c2ZvZENyRFA3UjNsNXk2bGlm?=
 =?utf-8?B?em11MjZCd3lvU0EzY1NGSmdxbS8vNlozNjBzOTNnekQ2ZTNsc2dTM1B0djdC?=
 =?utf-8?B?dXNxZTNLU2ZPeC9NRTl2L1RTK1hYeGNTNXlrNW1ZdVVSNDNxekdQWE90UGVC?=
 =?utf-8?B?elN0ekJJVE9MdklkWUwwc1RtRHNJVzJLTmd3bnFrMzBVLzFtcy9RaDQrUjFQ?=
 =?utf-8?B?UUlEdGh4Y2RyeUx4WTl2VlVPMC9lMW9qY0cxNTFQRUM5bGM1YmxFcGl5WXJJ?=
 =?utf-8?B?WXFRTnhXeEV4WjJyanJZdlFMa0gyOGRIayszdkYyWnROb1dRbXY1ZDFyM2cr?=
 =?utf-8?B?cjRucERDQUkwOHk3Mk1SNE92QTRBc3Z6bVNZL1dwUlhTc3J4SXV0YlBUUjJV?=
 =?utf-8?B?d0pXWmROakI0N3lsSldZNS95eHc2ZU1wbDc0RkN4OFFGSmorTCswbEZPSktO?=
 =?utf-8?B?Q28rd0ZCbVNQQjMyKzRFR1RTYzJDMXJRN2V1Ly9mdkdER0tzWWFjcE9LaEJ0?=
 =?utf-8?B?dmpxbzdQNzdvd29Xa0w4Y2k4TUlicHYxVi8vSUpqVDcySXErazMvcGdzYTY4?=
 =?utf-8?B?NnBYdzFaWmhpSUZ3akRPQ05Jd3l6elNkN3dMWGhmYVg4MVhtTzZMRmd4SWtY?=
 =?utf-8?B?bjhaSmRWbVJsb28xdTNPVlpJRXAwWXpLVU5GeERkQjZWZkF5UWFEWEx4b1JH?=
 =?utf-8?B?RDZiRzRzeVMxMDVWQVdjTUdYRzhibWRac0c0KzR1ajQxYnJFUEE4aG9RQUtz?=
 =?utf-8?Q?zI0pPTUlmhC3pmT60gwkMaUIPxpKA67E?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EBC8DA8DCA9DE94FAE6E0E66CF1EF02D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6309
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:5:1c::25];domain=DB7PR08MB2987.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cb35fce6-2ac8-432c-8c94-08dd616bb3b7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|36860700013|1800799024|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bkxPVWZmbXgrRDdrNEx0MkJpeUhXUEkxeEdXQ05IOFJodEdVMDk3czFZMTQ1?=
 =?utf-8?B?RUtZMDVxU0FmUDJ3akF4a1dKSnlIS1FubEpLWFlXS3dlU2lsb1FhSFljS0tT?=
 =?utf-8?B?NFF1UFhFTXloOGpxcm1mQW9uMUR2WXdUU3diUmhRT1N4LzRTaXBLR0F0bnFU?=
 =?utf-8?B?OVE0dkc5czlDeTJCZ0x3eU5kVkRKb0xPN3NWaXYydllkOW13Um8wd3hVZmpa?=
 =?utf-8?B?cmhzNzRBL1Qvcm9yN2Z3LzlsQlErL1htaVNMUDBOKzh3clFwMlNUN2k5VUNT?=
 =?utf-8?B?YWFvRGFrenN1cUFXK3hkQmQ4clR1cHhXeHNwb0orZUlpZlBubDRSQm43S2xY?=
 =?utf-8?B?Vm41Qm1GV2NJN3BnaDladFV5NGU3M1R5cUlEUjhTOExBdTRLV280VkwxMGhS?=
 =?utf-8?B?MmphVzFnek1oa2U0eU80MUhxMVZGOHNqcHd2MGRCemZHUThteGFnTlJGU0tJ?=
 =?utf-8?B?RVVteVZ2TTlqd2pFdmVlRDdSZ1RpaHRrR21hbEtlbWE0c1RENm5NQlNZKzZS?=
 =?utf-8?B?MGp2N1ZQZmNMOG5sR3h1UFhOdldyRWthVkMyTlROWXdwVXI2QVM0ckVUZHdx?=
 =?utf-8?B?Nk1RVUhjNTZyMXpXcmkxWW5WOUl6V2ljd3hMTjlpaXJxUnJSOEFUallVd2tY?=
 =?utf-8?B?ZG5KMkdxWVdJYXFILzhMWXhnRDBOTGhTWjlhbVM1QTJaODV1ZDRQTCtFQytm?=
 =?utf-8?B?V3YwL2Y2b1pmWEF6N3NQL0tPRXpvWVIrSmxrOG0zeW9adTdxVHZsQmVPay9Q?=
 =?utf-8?B?dHdnUmJkQXZNNCtHQkFFMVF2QVd5T01ERDcxUHhheTFuVjQ3SEV1bFlSNUY2?=
 =?utf-8?B?T2dZRExNbUtoR1JVeWE0VDhIQzFRelk3dVpxVHQ4MExydGJkenFzbjJZQjhC?=
 =?utf-8?B?aDV0a2twSGRncXpzeXVQaXNaSllOVk1BTzhvaitsdFZxMDdWQjc1UnROSTN3?=
 =?utf-8?B?bCttbkRFNEFSaU1CNUZLTnd1SFd2L3JCRWtyRzFkbHBFQUMwUC9lWWh6RGJw?=
 =?utf-8?B?ZzFPZWxVR3BlTUM2S3hXVUZuTFhzNm11cXVxRjRWbGE3WFZKMGlqYWtPWmtu?=
 =?utf-8?B?K2N3M29raFZib2RzaHM2Z2w0TS94TEdlVUxYYWdvdlh5UXJPVTJLZ3RoOVVO?=
 =?utf-8?B?UDlqNEtGVVlYams3bWJyNzF6bXpJaFQxNlNKUTRXb3o2TEtwR1RIMWdOOVht?=
 =?utf-8?B?TkNwdnRRNTNkS1UyRFBzTlVMVlJpZC8wUndFZWxkN2kwby9ZaGVDWktmTDUr?=
 =?utf-8?B?U2JIdlh2WmxJaHN4ZTdUbHhRUTVrUGhnaXN0ajBMWW9lZzNicHFaNnVxWnFo?=
 =?utf-8?B?WTVGUVhUWEYvUmpDV3RxWmJBM1JOZVVaQU5WckliM1BOWDJxZjZJK055dytl?=
 =?utf-8?B?NkJUQjVHekwvdlYxR3FFdDhvbkx1NWxwNTBwZDBSWUl2dVpqREZ5MzA2MVJz?=
 =?utf-8?B?ay81Y1dxS0JjVkNrdlNlajNpU1F6WlZqaVVCSFZFNkxoZzFIZnN0ZWZ6RjEr?=
 =?utf-8?B?SnBCR3luSmcwVkhCK2UwK2h4QTNBUncvUTR6NHN1bGdHNWNqa0pmWVk0QnQ4?=
 =?utf-8?B?cEdLV0FqTyttZW1Qb1FYUkFTYmZxeDRnUDNhelZHSTFCNFErY0NyVFFNWTJD?=
 =?utf-8?B?bmVhNHFEeVdlMzVQNmY1d3UzZ1NQdlhodEo4NDJrVEtZVklZcmdmRUZqR1hM?=
 =?utf-8?B?SUFqNjhEcEgxK0Nrd0NCMVpPZ0dET2lNK1A4Y1plWHZDSElBRFFHaDZjMElh?=
 =?utf-8?B?MktlR0V0azJrZS9ranRObW9NTVZ6U0tKODhZT2dyRi82NjgxK2M0VDQ4eG1j?=
 =?utf-8?B?c2xYck9leHIzQnBneHFXekdQbFpiaUYzZGN0NU05cGc1R21rWDZWdUUrck03?=
 =?utf-8?B?Tm9Mc1VHK2t2MGpWM1BxYnB6MEw3Y0hyN3pOR0ZKUnJ4eUx3WldZeWtsbGtW?=
 =?utf-8?B?YjB4SlArTnZPbjBNa2lHSlZiVlRRZDBTNGNQRDBPdW9NY05KL0dVbnF4TUVO?=
 =?utf-8?Q?WQ/eaNUHQbLCpVCUVdd7ZVHvtQtiNs=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(36860700013)(1800799024)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 13:42:24.5057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8636a0b9-5dd3-4f8d-9240-08dd616bb8be
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8267

SGkgSmFuLA0KDQo+IE9uIDEyIE1hciAyMDI1LCBhdCAxMTozMCwgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IFRoZSBqdXN0aWZpY2F0aW9uIGZvciBkcm9wcGlu
ZyBwMm1fbW1pb19kbSBmcm9tIHAybV9pc192YWxpZCgpIHdhcyB3cm9uZw0KPiBmb3IgdHdvIG9m
IHRoZSBzaGFkb3cgbW9kZSB1c2VzLg0KPiANCj4gSW4gX3NoX3Byb3BhZ2F0ZSgpIHdlIHdhbnQg
dG8gY3JlYXRlIHNwZWNpYWwgTDEgZW50cmllcyBmb3IgcDJtX21taW9fZG0NCj4gcGFnZXMuIEhl
bmNlIHdlIG5lZWQgdG8gbWFrZSBzdXJlIHdlIGRvbid0IGJhaWwgZWFybHkgZm9yIHRoYXQgdHlw
ZS4NCj4gDQo+IEluIF9zaF9wYWdlX2ZhdWx0KCkgd2Ugd2FudCB0byBoYW5kbGUgcDJtX21taW9f
ZG0gYnkgZm9yd2FyZGluZyB0bw0KPiAoaW50ZXJuYWwgb3IgZXh0ZXJuYWwpIGVtdWxhdGlvbi4g
UHVsbCB0aGUgIXAybV9pc19tbWlvKCkgY2hlY2sgb3V0IG9mDQo+IHRoZSB8fCBleHByZXNzaW9u
IChhcyBvdGhlcndpc2UgaXQgd291bGQgbmVlZCBhZGRpbmcgdG8gdGhlIGxocyBhcw0KPiB3ZWxs
KS4NCj4gDQo+IEluIGJvdGggY2FzZXMsIHAybV9pc192YWxpZCgpIGluIGNvbWJpbmF0aW9uIHdp
dGggcDJtX2lzX2dyYW50KCkgc3RpbGwNCj4gZG9lc24ndCBjb3ZlciBmb3JlaWduIG1hcHBpbmdz
LiBIZW5jZSB1c2UgcDJtX2lzX2FueV9yYW0oKSBwbHVzIChhcw0KPiBuZWNlc3NhcnkpIHAybV9t
bWlvXyogaW5zdGVhZC4NCj4gDQo+IEZpeGVzOiBiZTU5Y2NlYjJkYmIgKCJ4ODYvUDJNOiBkb24n
dCBpbmNsdWRlIE1NSU9fRE0gaW4gcDJtX2lzX3ZhbGlkKCkiKQ0KPiBSZXBvcnRlZC1ieTogTHVj
YSBGYW5jZWxsdSA8THVjYS5GYW5jZWxsdUBhcm0uY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IEFja2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gLS0tDQoNCknigJl2ZSB0ZXN0ZWQgdGhpcyBvbmUg
b24gdG9wIG9mIHRoZSBjdXJyZW50IHN0YWdpbmcgYW5kIGl0IGZpeGVzIHRoZSBYVEYgcmVncmVz
c2lvbg0KSSB3YXMgZXhwZXJpZW5jaW5nOg0KDQpUZXN0ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1
Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCg0K

