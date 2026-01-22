Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PcJCP9gcmnfjQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:40:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E1F6B84C
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:40:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211704.1523219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viyf9-0000Oh-Jo; Thu, 22 Jan 2026 17:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211704.1523219; Thu, 22 Jan 2026 17:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viyf9-0000Kz-Fx; Thu, 22 Jan 2026 17:40:07 +0000
Received: by outflank-mailman (input) for mailman id 1211704;
 Thu, 22 Jan 2026 17:40:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paBm=73=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1viyf8-0007E8-Jk
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 17:40:06 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62c47435-f7b9-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 18:40:04 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB6512.namprd03.prod.outlook.com (2603:10b6:510:be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Thu, 22 Jan
 2026 17:40:02 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 17:40:02 +0000
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
X-Inumbo-ID: 62c47435-f7b9-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FhUc9aODWoES/NYxNFwNaiOSnzs89VmP4Ga0gQAan0OUUEd4DE//Z/dfytgLUudAfgpiZ++1QQFDCTkZKRjFN17TupSQJdv6Ply2Muo6Nz1+TfkSFkHYGVSFrR3fvW72pAXrX626b4I/F5X69G0mnpYWXIW15QoFchrZAcrcGrFnmP6o3xpvxafqYHjFmey4FKUlLkxfOHTQzcD7e4W+s7bTD4ADfUSb72S3YD8ZwYc8SwxxnpspznFl3RkWpRXAi4oZf6COfMcHDUVNvtc3cu25/DWH6Cx76yPfY2eMQzii4GP19Euc3+SdioiniZnug5k0QIpiljMBj972sQSqjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WREtdnV6qFOwxoPQs5fE9uNviKczFifP5pic1h0CCY8=;
 b=KouDaf2P6YdManB28W7xvZCDweiEmfuG1EJ3E5XxbJ7L1X7GftzzlX+iLWitoaGsxuR40RSJSYS1Zs+XTjFl7KLL0Vg+ZLd0BnH6zHkyXqkWj1r2kW8JcvmfGDYRtEWiNu0bB3hiNB7l7VuIuBrdA7Afq/M4PlBlquJ7+9yl+/8vmNHv9ZLdgJTMWl3R18gI9kpcwd3IjOFnGO0xV+BNSKzPHavqU76QBFQHxN6eRN8Iap7ilg49YSh0OzwqH77jX6EDhMw2WWWl90V0QlVsbRi1ilf+m/5N8sLYu/v3sgVk1hCwjni4m4BIUPodZrrA/r7y+dQjctpAzUIdxDAw8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WREtdnV6qFOwxoPQs5fE9uNviKczFifP5pic1h0CCY8=;
 b=voScXZiZeU0SnzyYJAEbDFyltNNZ828VFV1dCBQ9IWvjTEvXvvbeqF5K4hUfHwHTx9EggzQKHtpHI51UWvQS8MCdgexM1wbL8RMQ8QxAd+WZWEpX4MPCYm4IfV0lpajOFXHzOj16ii7+VYSdZosFAf2mCVc1+dwzVjDpziCpJgs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 3/3] xen/mm: limit non-scrubbed allocations to a specific order
Date: Thu, 22 Jan 2026 18:38:57 +0100
Message-ID: <20260122173857.83860-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260122173857.83860-1-roger.pau@citrix.com>
References: <20260122173857.83860-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA2P292CA0028.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::15)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB6512:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f8a5df9-8792-4bbd-0503-08de59dd4588
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blB0S0RlVmJZWWljZWR0VWRCY09iT0dCVVIydElKTjk2V0RZTGp3THI1dE9J?=
 =?utf-8?B?TUw3Vy9BdUZ3TUZldG96OWlEWGVYQ0RoUVp1Z0pFa2FEMHFKTkd4dzV3d0gx?=
 =?utf-8?B?Y05BMlJQa25OM1l2TXF3QnV4djE4RzNzUGQ0OUNtUnB6dzdYdDVsVXc3YytO?=
 =?utf-8?B?VGVMdEJqVm1PUWl0aWw1VDRvQnQrU1M3cmhNTTdLZ1FJbDVLbXk1YWNtaUZm?=
 =?utf-8?B?ZmxycWh6MjV4aHYyM20wWDljSkphOWdpaVVuTVlGRlV3cGFIYUVEOXNSeEJs?=
 =?utf-8?B?Zit6bXhRaGhLYWpPczh6UXl1L0xkZHhJOVh6RjNOd1FET3BDOE9POGRiWk43?=
 =?utf-8?B?cGxqU2k3MlBDb0s0TUhLVU5pZUdEeGMwMWVraWYrY3VHOWVaelpxS0Frb3ht?=
 =?utf-8?B?TmhsVkdUVDY1WUJGT1EvMVFJT3lEMFRtOXAvSThPb3g3S0dsYTZJbGR5enA2?=
 =?utf-8?B?Q1FrUmdzQ3VodU9zUTJDTG5lNmhaL1lJbDVBVkQyUU1JbWIrVnZlc0gvSTNM?=
 =?utf-8?B?WWI0blgxN3lWY0pWYVNxNDRMdnNjNzFCK2QyTE5nYkc0NWtkKy9HZmJmeDNq?=
 =?utf-8?B?aVI1aFBGMXByRHFIakU5SEJqZTZpR2VjNlVuL2xMRmpyVitVSTFjSGpXbndt?=
 =?utf-8?B?Umhpdk9ReDFEejRzQjdSKy9KVUdkWkdzRlprTVF6ZXA2QThJVm10eEZ4T1Ez?=
 =?utf-8?B?WnlZblgyMDdOZStHR1V2bmtFeVVRV3pUWUhMbzhRU3RiTFRzUW11b28yUFBX?=
 =?utf-8?B?OXNYLzEvbS9TMzhQaWhxWHpjcmtxdjBzR01yelB5eVR2b3RQTmlKR3VkQk1L?=
 =?utf-8?B?YTZYSnZwblc1bHVJalBmU2FTb3plTEprK2VTVmpBZlJrY2JQVW9mSCtreDZI?=
 =?utf-8?B?SHFNRERvNjBVZkZwT0xxR0pKQ0ZFanYzYTZ4N1BPQldSYnBQcGZtSFVKNGlk?=
 =?utf-8?B?RGM0MDZSKzZ2akNmbVhVdlQydnV4eFdDaDNtZlZMWkNjZFFSM3p3OEt6N24w?=
 =?utf-8?B?QTFNL0hBUUhHMjhpNGNaVDV0UlhMbWRITW15eXYyMDZLZmlxREhOcHFSTkJh?=
 =?utf-8?B?RTVLVUZGR0ovZXRBYndHUzhCbmtydHI0SDZTV2RRMk5HNmFVOFpacUlkYWJu?=
 =?utf-8?B?Ly9iTHE1Ykd6dFNFaXB6QWVTaHNTa24vZitBRm1EOElMdFNuMGYzMkt4WWMy?=
 =?utf-8?B?MHlJRC9CcCtJZ3ZPZ1R2ZllROFpmVHdBOFhOdnhINU9HZ0NYTlIvU24vcDh5?=
 =?utf-8?B?WG1XV1pCZnkwSGZzdHNxcHhlSzl3QVZGbk16bkRLQ1BpL0hGcXhsVUkwbDRS?=
 =?utf-8?B?ZzQ2Q3MzNmI3RENBZVVMSXVsbnQvY1luVVBRNDBzSUhIRFhnQWNtYks4bEhs?=
 =?utf-8?B?N3VYdmtXMkNaRndMdTBmaEhnTjNHcVNxMGRDQlFjM04vbDlRaS9TTmdtT01B?=
 =?utf-8?B?UXNXN0NOTUVmSnhXY3pzeU9OV0ZSMk5XUkdmNVFUTitzZlovQ0h3QWxzZk5V?=
 =?utf-8?B?NDRRblZlVEcyOGhPZVVyQVlVT2lJWlhjZitrSzlwbEhGRWtkenFzc0RMWWZN?=
 =?utf-8?B?MXFISEIwSC9kbGZORXowYngrRkVpSTNJWmtidFNaT2taSlU3T2VFL1MzdFUy?=
 =?utf-8?B?Zy9lUGVGR3JiUStuZlYraHRweWZzaWtUU0ZPN21pZnVSRGpRQWxTUWY5MkUv?=
 =?utf-8?B?KzBwUnRFQ0V2OEVMeWU1d3FHaXcvcEFJNW9NM0syakhWNHhEV0NEdVdnMitM?=
 =?utf-8?B?R2pBUDJtL2I1dCt0SGo4eU11UzRwVDJrUWl1OVlZQWQzYXVIcnVxZmhUSyt3?=
 =?utf-8?B?dlY1UjFnWENtYjJmYyt3TXBQREpKMDFEeGY3RWFSTHhBRXd5L3FXekt3MXlV?=
 =?utf-8?B?VzZQZkNKM2pxZlptWjB4YlNMdHIyWUJqZXZmZ3JpejF1R3BWUFdRUHdaZTI0?=
 =?utf-8?B?U3VPanVXazJDQk8yZ003bEZLYlNsVm1OdzJCWm94MWJjWHJHeWh0VWlmM3c5?=
 =?utf-8?B?RndaY0wva0lTVEJSSDRMOXNmL2JzMFM3blJCRzhzN3QrNVRBa3FXazgwekkx?=
 =?utf-8?B?UHdwdVhaNzZPTnYxcmJnRDY5Z1BxRjVZbWY0STAxK1VTVmMvbGJ4QW9oRTND?=
 =?utf-8?Q?Dr5o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STVxMWQ5Y0RnMjVVQVY3SVU4YlRobVZlemZiSUxkSythMmxzWVJ0Tk9QNDF5?=
 =?utf-8?B?cTRrU1NnRDRBRkdrT01pWTF3aVp3dWJwS05MU3VseVlrYkozcnUvdE1HTG5Y?=
 =?utf-8?B?ZzVmQ3hrSTdFUm9NT3JsZHBVeDI3NXZkLzFmN2JadC8wYnZCTFo3UzN1dUNE?=
 =?utf-8?B?SlM1SnRjc2lMQjg1dE5YdldsdjQ0SCswSVkvbThQRm1LZERpOTdRWkRja2JG?=
 =?utf-8?B?QXNxUVdrRi9qL2EvSzBEb3k3bXplMGNMT3F2TWNwLytid21rMUcrNVhBUDVC?=
 =?utf-8?B?UHRJTDdYdzMzdHZrdlVJZWlDSGhXdlh4M2hQZGNMTUJsT0VYZXlBUjl3eWQw?=
 =?utf-8?B?UWFxanMzYzNoK1NBUWdGMENKTEl4dkg3Y0JCU3E1TDhuQkhFUXNXVGlPNW5u?=
 =?utf-8?B?STFYWnNJVWRzcTI2MVExWlZ6d25iUUhTM0gyQklOaExCV2dtanZEVklmQmw5?=
 =?utf-8?B?bDVlY2dWNHp3aXRlaWYyUkFiTndoRHJ4RVFuT29QTUV4SWt4Y08rRGQxN0p2?=
 =?utf-8?B?YmpGbWRSZVdxUW9ERzhJbTZJZjJYR2xuUmdWRWZSdVdaTGFncUR2eWpJYkQ5?=
 =?utf-8?B?NUZWUERSRnJHWW1MZzFHRyt0eENHODYrOUc0ZHpqc2F0TWlaTHpWMHl6SEwy?=
 =?utf-8?B?UXVOMmxDQ3lqZWsvZ1hwaDcyWHd2bnNsemw4LytaMUphS3lCWEdWMWJ3cFlz?=
 =?utf-8?B?VWJ0ZXdPZDR3cWJmVFFlQ0w0Mk5rbGlUL2R0andlcG03cFlOczVVL3Ercjdy?=
 =?utf-8?B?Vzd5NWU1bWYvZWV4OUcxOFd6K010K3g0MWc5Rnc1MFZ6cmRLWnBGTUJQWEp1?=
 =?utf-8?B?bElyaDZJUytZSnRDSUwwcE1TYnNUNUdYNDNIamNZKzdCd1Z5UTBRTEh1bmVL?=
 =?utf-8?B?T0VjanhZN0hXczhmL25aaVlFK3BFRjZ3YnVUaW5BYU5JNzc0S3Z5ei9ESDk0?=
 =?utf-8?B?NFpvdC90bTdPS3JWRGh3bWpIeVJkeiswOERyQTZndkZwWjhPaXBXQjMxeFgr?=
 =?utf-8?B?Y0h4UkN1VTMvVWhmZXZRN1hvaGRSNUliZjRMMVpOWXMyV0pJUVJkM2FCcHpn?=
 =?utf-8?B?bm1wSGpSZXdScExMMVdUcXVOUDNMamtiNzFKMXltWTVMMnNjZTRYSkFlakEy?=
 =?utf-8?B?Uk94MFJTV0JOM3pXYkN2eHZzWXZubUJEamdoQklQR3ZvSGJ4N08reTNqVTBD?=
 =?utf-8?B?a0kxMm5iUlJMNExRVE5qUUsxUTJ1SEpBQ2c3MVluUWRHOXh2NzNQWXJYUm56?=
 =?utf-8?B?MGJCOHNHVFVPNDRRY2UrSGlIUXo4LytabHJCZVVISVZOZ25BTWt6Nm9SZW9D?=
 =?utf-8?B?MWZKY2d4NThDUEhtU3VKdjRuZ2NiSzkzeG5EUnB3QW5WeWZPMW9qNXZmdkNx?=
 =?utf-8?B?ZVhneU1KbkpzcENDOVRONWNIVXBsbmtFRTFXTVVPN21xYzRNQ2Y2NS81YUFV?=
 =?utf-8?B?REtjMXlPRFJzTmxrQTVGd1NRU3pmS0hzUWRlakxwRWQzbXJFajFhOTcyalRP?=
 =?utf-8?B?MU4xSlc2UklnZkVob2lLYmpFMTlscFNWTTFSRVhObGdMYjdXVnczRGp5V05F?=
 =?utf-8?B?RExadE02WXh6ZTZiSUxEeS9yWEpzbjdQZ1lUZEpaNFdHblZJMTF3bmhNaWRO?=
 =?utf-8?B?a0pFQUJBOVliK3hOTjJUS3ptOE1Zci9USVhueHhYS3N4NXNlMFVYd3BYQ2VS?=
 =?utf-8?B?WXcvTmY0L2F0ekJiK3NxVVVXb3ZCbUQwcGhiQjNnaWRGM1BNZUNxbXdFODFU?=
 =?utf-8?B?dC9RM0lrR2tVY0VsZ3BJbmlTczE0U1JBdlpJclU4cVNCMVp1bXQxbkRXbkYv?=
 =?utf-8?B?aUhVU0J1Z1NXWmRGRDIxR0tTcVlXU0p4TG5YWmRLaXRwRkFjOEZ5Z2lpemFJ?=
 =?utf-8?B?UngrMVY0N1lwUG9yN2lySis1Qng0R3pDRmowRHVQQVlPRWxYbE45S2N4TVBD?=
 =?utf-8?B?MCtqQXpQV3dDcTdkTzVNbUR4RVhrYUY4Tnc4UlZWVlQvWXR6OUxBeUkrWXda?=
 =?utf-8?B?ajgrR3I2WDZwRnRucVdaejRGdnozV1J3cGZ5OWZTVGFXS3l6UXE0U1lBUDVH?=
 =?utf-8?B?cXl5NFM0L1ZRWDg3NG1WRkpzZGV1S0xwWmFvNTRiVUVrRzBHRlo4RFNrWmVr?=
 =?utf-8?B?QU1OTlJaSWNzbGVzTURMQWNlRVIvak1VSkp3alkydGV6THRHNVl4aHpOa1dz?=
 =?utf-8?B?VnlFL0JKK2dnbkZRNUpobHUyMDJXTU9rNDBPQWdIZitmellFR0IzK0x3ZlQ1?=
 =?utf-8?B?YThRVjZWSEJqbTFpZDBwc3ZPYXF0NW5DNndxVU9nQmVSMXBrdTlrcUYycGwv?=
 =?utf-8?B?WlJIQlkyMFVKNTNscExzaFJiM1prWTAxbmxHYS9uTHZTeXpGbXJXQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8a5df9-8792-4bbd-0503-08de59dd4588
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:40:02.3987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 36ip4px3w+FQjLLiTlWFs3Bqi1i3AgI/Cb/57SfRNBzCQTilMrLKIkQ09ujVd8nt09m/thIA+cOllKp6GxGJ8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6512
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim,citrix.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.924];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A8E1F6B84C
X-Rspamd-Action: no action

The current logic allows for up to 1G pages to be scrubbed in place, which
can cause the watchdog to trigger in practice.  Reduce the limit for
in-place scrubbed allocations to a newly introduced define:
CONFIG_DIRTY_MAX_ORDER.  This currently defaults to CONFIG_PTDOM_MAX_ORDER
on all architectures.  Also introduce a command line option to set the
value.

Fixes: 74d2e11ccfd2 ("mm: Scrub pages in alloc_heap_pages() if needed")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Move placement of the max-order-dirty option help.
 - Add note in memop-max-order about interactions.
 - Use CONFIG_PTDOM_MAX_ORDER as the default.

Changes since v1:
 - Split from previous patch.
 - Introduce a command line option to set the limit.
---
 docs/misc/xen-command-line.pandoc | 13 +++++++++++++
 xen/common/memory.c               |  3 ---
 xen/common/page_alloc.c           | 23 ++++++++++++++++++++++-
 xen/include/xen/mm.h              |  4 ++++
 4 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 15f7a315a4b5..3577e491e379 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1837,6 +1837,16 @@ presented as the number of bits needed to encode it. This must be at least
 one pending bit to be allocated.
 Defaults to 20 bits (to cover at most 1048576 interrupts).
 
+### max-order-dirty
+> `= <integer>`
+
+Specify the maximum allocation order allowed when scrubbing allocated pages
+in-place.  The allocation is non-preemptive, and hence the value must be keep
+low enough to avoid hogging the CPU for too long.
+
+Defaults to `CONFIG_DIRTY_MAX_ORDER` or if unset to `CONFIG_PTDOM_MAX_ORDER`.
+Note those are internal per-architecture defines not available from Kconfig.
+
 ### mce (x86)
 > `= <boolean>`
 
@@ -1878,6 +1888,9 @@ requests issued by the various kinds of domains (in this order:
 ordinary DomU, control domain, hardware domain, and - when supported
 by the platform - DomU with pass-through device assigned).
 
+Note orders here can be further limited by the value in `max-order-dirty` for
+allocations requesting pages to be scrubbed in-place.
+
 ### mmcfg (x86)
 > `= <boolean>[,amd-fam10]`
 
diff --git a/xen/common/memory.c b/xen/common/memory.c
index db20da1bcaaa..cf63bd077d42 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -56,9 +56,6 @@ struct memop_args {
 #ifndef CONFIG_CTLDOM_MAX_ORDER
 #define CONFIG_CTLDOM_MAX_ORDER CONFIG_PAGEALLOC_MAX_ORDER
 #endif
-#ifndef CONFIG_PTDOM_MAX_ORDER
-#define CONFIG_PTDOM_MAX_ORDER CONFIG_HWDOM_MAX_ORDER
-#endif
 
 static unsigned int __read_mostly domu_max_order = CONFIG_DOMU_MAX_ORDER;
 static unsigned int __read_mostly ctldom_max_order = CONFIG_CTLDOM_MAX_ORDER;
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index c9e82fd7ab62..d2d5e4762d59 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -267,6 +267,13 @@ static PAGE_LIST_HEAD(page_offlined_list);
 /* Broken page list, protected by heap_lock. */
 static PAGE_LIST_HEAD(page_broken_list);
 
+/* Maximum order allowed for allocations with MEMF_no_scrub. */
+#ifndef CONFIG_DIRTY_MAX_ORDER
+# define CONFIG_DIRTY_MAX_ORDER CONFIG_PTDOM_MAX_ORDER
+#endif
+static unsigned int __ro_after_init dirty_max_order = CONFIG_DIRTY_MAX_ORDER;
+integer_param("max-order-dirty", dirty_max_order);
+
 /*************************
  * BOOT-TIME ALLOCATOR
  */
@@ -1008,7 +1015,13 @@ static struct page_info *alloc_heap_pages(
 
     pg = get_free_buddy(zone_lo, zone_hi, order, memflags, d);
     /* Try getting a dirty buddy if we couldn't get a clean one. */
-    if ( !pg && !(memflags & MEMF_no_scrub) )
+    if ( !pg && !(memflags & MEMF_no_scrub) &&
+         /*
+          * Allow any order unscrubbed allocations during boot time, we
+          * compensate by processing softirqs in the scrubbing loop below once
+          * irqs are enabled.
+          */
+         (order <= dirty_max_order || system_state < SYS_STATE_active) )
         pg = get_free_buddy(zone_lo, zone_hi, order,
                             memflags | MEMF_no_scrub, d);
     if ( !pg )
@@ -1117,6 +1130,14 @@ static struct page_info *alloc_heap_pages(
                     scrub_one_page(&pg[i], cold);
 
                 dirty_cnt++;
+
+                /*
+                 * Use SYS_STATE_smp_boot explicitly; ahead of that state
+                 * interrupts are disabled.
+                 */
+                if ( system_state == SYS_STATE_smp_boot &&
+                     !(dirty_cnt & 0xff) )
+                    process_pending_softirqs();
             }
             else
                 check_one_page(&pg[i]);
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index d80bfba6d393..cf3796d4286d 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -232,6 +232,10 @@ struct npfec {
 #else
 #define MAX_ORDER 20 /* 2^20 contiguous pages */
 #endif
+#ifndef CONFIG_PTDOM_MAX_ORDER
+# define CONFIG_PTDOM_MAX_ORDER CONFIG_HWDOM_MAX_ORDER
+#endif
+
 mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags);
 
 /* Private domain structs for DOMID_XEN, DOMID_IO, etc. */
-- 
2.51.0


