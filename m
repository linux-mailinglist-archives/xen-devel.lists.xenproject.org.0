Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDS0Bb4kmGkJBwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 10:09:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2F8166063
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 10:09:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236941.1539417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtMVP-00064r-2T; Fri, 20 Feb 2026 09:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236941.1539417; Fri, 20 Feb 2026 09:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtMVO-00061k-Ue; Fri, 20 Feb 2026 09:08:58 +0000
Received: by outflank-mailman (input) for mailman id 1236941;
 Fri, 20 Feb 2026 09:08:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uNHm=AY=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vtMVN-00061e-My
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 09:08:57 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c89dd144-0e3b-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 10:08:56 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB6559.namprd03.prod.outlook.com (2603:10b6:510:b9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Fri, 20 Feb
 2026 09:08:53 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 09:08:53 +0000
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
X-Inumbo-ID: c89dd144-0e3b-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zSHDeQBA++Op7otgKBB6Y1OVXtnJM+DXVyIe4LWOD0CZB7o+vEzQMx1xcMBHoWkR2Znr97Rv7a/L2xZwSRAl/MvU//nQ5iTDT1W+wJwgamZqBbkiSHpocraotKYozmm9eNKgMCiTTxjxzcbd9aEAYB33BFEuhAtiCNdXP0CN+WB9idIwkEH/v/dy6T6rOxmtjlvF/tL0jJZFm6UBdIQfH8SpKQi+mVsJiITPTrHL6ZUdtxGx1TTTO4CHZ7xwumZwHE11Ia8LA9zEE+44W7ONOiM7FNHyYEseGnfblx+zY6zD3gZ4G75Lh9pd06nMXvfFDwlS+MWg1UGczWOT/p5qPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ch5n7Tuk19BZzjNzkW+Ns5IUSueuFlMnY63JCf9zJk=;
 b=ORcNS4K5/Kqez5HsUtrMFa4/8fzwBYrQoHQl+0WCr+8QsXEezlf9qw8SUfwqEnPMJ9c0li5vPiYHOAwtf1Ddb2n6X24tiwJ/MqS5wxQJTsOcKXFO3XklYsEUJgp5cDB9aclL5+7ScJLwnWajvveNVlEzYDAde14KuBJLtjMchkxZ2KeWU+3Y4eOVnZbhdj04gItx/FDydcXqEpHkCd8jayPUZ7m0xQbQXhEC43NsQrwq0YPL2hsysUWLDWEQl3iGWg3B9iL6G39pT+ns4JkuVRpdIoISO1kaFEo5QgrRVaBWQV5vMxa9JjkGMKSN2tFxIQ3hjIiOOPcRnYJ3/o9+zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ch5n7Tuk19BZzjNzkW+Ns5IUSueuFlMnY63JCf9zJk=;
 b=BxDundQh9HRdmBeINF2u85qQdoxTbTDyYzcH8EzYDq8ejhHX2n4tVc2KGAhT8O8FyM3DS5fC92e0586e48XPdAs9OoH9DHKmDs3f9eHKaCvT2LbwlSGRRhvM8SCdwd9ACXPmFWxG+Lf4lPDac9X1P2/+9JRyKb0Rcl+J0h94z9s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 20 Feb 2026 10:08:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 5/5] vPCI: re-init extended-capabilities when MMCFG
 availability changed
Message-ID: <aZgkouZccz3aUTeW@macbook.local>
References: <25c65557-c97c-499c-a698-571e40cde563@suse.com>
 <67b1f190-a7a8-4cf2-89ca-7186204f0b56@suse.com>
 <d0be8579-fca3-4b55-9c7b-37368231a41a@amd.com>
 <d082d619-8675-4ae4-bd25-f7f99209c615@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d082d619-8675-4ae4-bd25-f7f99209c615@suse.com>
X-ClientProxiedBy: MR1P264CA0200.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB6559:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a5833bd-86ae-4143-34bd-08de705fab58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eFZtbmFPek5IMkVpQ2k3WS96dmFqM01iNlg0aW9wTWlla3pDQmNubjIxS1Yz?=
 =?utf-8?B?amZ2K0NPM1hlREY2UXQ3V25vdmxsN1F6WDlyM2JRVUJSa1lPZGI5Z01EK1pY?=
 =?utf-8?B?WmhYWk8wM2l6K0NybGxQeVkzMXFabHF1SStQRTNJVlc4d0ZBZ2hzdTcxRXBJ?=
 =?utf-8?B?YzFXUjdxcWxRQjJZOW4zYVlncGJPZkV5dVZZTHkzdmV1MVJ1N21MdzZSVFRm?=
 =?utf-8?B?RFhZUXdqY1RZM3drZlFXMGtNVUVaeklIUzVZUnZNUk5FYWJBMHZHeWZ2YVBK?=
 =?utf-8?B?aGUxajdaN3hmdmdLQi9TVTNwSUJZMHJpby9ZMkRaTk1KMXprQlF1eS9EbG83?=
 =?utf-8?B?bklONS8xVnA3cmFFN3NveVYxajRDNklNTm5lRCs1KzJvZ2VLMGxQeDNBWHc5?=
 =?utf-8?B?SU4rWlBiUXBqbVVUaFRvOWNRRnlvajFjajBGMWFoZUM0bmVMZGw5bWcwcjQ5?=
 =?utf-8?B?bTd1ZkdGS3NlU3NRQ3RMMGgxT3M0N0tRbldGQ3lrdG5yelk5QkFEZUY4bGVX?=
 =?utf-8?B?SmxhaGVLSHJURFZBWGRXZVFFSUJrYWM5YjdFN0xNREpsUWJvMmF1dS9GUEln?=
 =?utf-8?B?NHlBTzFENURxYmtpbG9KczUrdjZBK3duUytXYXlRekhoWWZiMUpFbkhNZUps?=
 =?utf-8?B?S3JQU3J1Q1l0VWM0ZmZqeGtlREJMWXQ4M2RoUTdIY013c0dMY0RHTE5TN3hI?=
 =?utf-8?B?SjhkNGNhTE9aSG5mQUtOZUZsQUNpWDhDVW43aitDWlI3T3ltWW9ETlpITHVO?=
 =?utf-8?B?WER4cnJqV0c2OHROUEYyY245N1QyOC85MmI0a0YyMzh1NkUrRHBkaW5iOEE1?=
 =?utf-8?B?cmRwQ1diSnBleWZpNC9KczBvTmZPckxCOXNveXBiRUlpNXZNZGlRMFRpbE91?=
 =?utf-8?B?blBNSjhUZnBtelRXRTRSaTg2TlNxdGF0dEhYOElmOGRodmdlQlpJbHp4ZlVD?=
 =?utf-8?B?N0dTSUVqR2Q4L0s2WXlnWFJiM3IwMERJeER0VkFrSll2b3MxQ08yMDlQektR?=
 =?utf-8?B?NlFkMVFPQ3FJV1c4MXRwTkFzampMWTlhOGlqYkRvOUt5elIwbHVhemxwWXpF?=
 =?utf-8?B?SnlPRjlmbGxTSlZidjFuamZpU3VVY2g5OEZmcS9SaTRDZDlVME9CNjhVeERD?=
 =?utf-8?B?eFVQaHNYMFZkNWVERGtBYVJPY0FXbGo1dFJCeTFGM3VQRDhWczM4N3BZbnlC?=
 =?utf-8?B?TVZ6MWhOY3YvSGcwQ0doUUtwVk5TSWhkMWdDeWxSbTh6QUx3ZDJDVnpybmpS?=
 =?utf-8?B?Tk1OUnQ2eVlBR2NkbWJ1a3NiM2dPeTcxeGxsMWEwcmlFZk1Ka3gycURxdUhT?=
 =?utf-8?B?YVdUeFU2anJHMEZSN0lsQ3Zrc1hya2RIUEdPNUpMV3hicFA1a2JhajZZSWI3?=
 =?utf-8?B?dVBibVJjcDhINlhjT21BM09Ca2lNcmd6N2F2Sk5CbWZkd3FobnN2RVhxWFFz?=
 =?utf-8?B?QnVMalRpRzcweDFNa2lLYWg4QjduVEFyek9DbTV4bDFWWXdBS3RQWVdGNHM2?=
 =?utf-8?B?TFVxOXZFaWJFTmNYSDhmVFd2eHdVN2Y1WGNkYklVWmxnV1drZ1FvNnM0NUha?=
 =?utf-8?B?VkRXUVNqak1xZHJLYjlGQmFxTzR5a1FxcHQzMWN2cVF4dktqa0FiWGFhb3lr?=
 =?utf-8?B?T2xUVzl4SjF4eC9YUFhGOXZhaXFxdXUyZ2VpY293aXhIcFh4ZkxVMmJKcEdh?=
 =?utf-8?B?VmJQQmROT2RxSFlwUEdXTk9qdUR1UCtPRkYwa0FpaGxMV3ZnSWoyT2FCZXBq?=
 =?utf-8?B?K2ZZdkhJdkZGTWx2aVRDa2oxcUQ2V1U0UHBVSXZVOXZzakZyaTFGL0dDV2R0?=
 =?utf-8?B?bXVjR3pnR1Z3LzV0UEI5M09kam5DbFJrU1J3dUdab3doVWZGSisybTVrUlln?=
 =?utf-8?B?SFlGc1JBNlJLU0YvR0E4RkFVVVpZWTNnazlHT2hSOUVVbGxHSEN4K0Ezek5C?=
 =?utf-8?B?bHE3eG40aXNUTHVyWFhjRDNNdmVHSmJiRE1hTEpqR2xQU1NFc2xDUCtwSHBO?=
 =?utf-8?B?emU3NEUwZ0JHQnNOUVAxekVlZG9LRHI2U2xLNjhCNGVnSXZOZG9hS211Uncw?=
 =?utf-8?B?K0R2VisxWFNqZEFEYnRVcmlsTXBCd0xZajFpcWlua2VwUldBRzc2cit0c2lV?=
 =?utf-8?Q?LNlQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3ptYTZMYzdzNGdmWTRiZUJtNlVoQzNUVC9vU1VYdHRiVUlyM0dzeVR0N0l5?=
 =?utf-8?B?Rkt3UkdBSzkraHNlVUlBZTNxTytqbG5SUzZ2ZkVpN1BDaFdEbWtDc013Z2FY?=
 =?utf-8?B?KysyNEczNVpZbWsrUHBJdTd5TDFDKzBEL0RaQ2JOUEt1SlJHNWt6dlIySGlP?=
 =?utf-8?B?cEJ4M3NPelRSRXNJSGdmZDd0dFVBZjlGcHFWRVdNY3J4WUNzN21YZHA0M0JT?=
 =?utf-8?B?eDA5Mm5tYS81dmQ0QmJFaHZ2d1BMWlBaYm5uV2pDMmsxTXVNWktGMnoxSVM3?=
 =?utf-8?B?b1RuNHJlWm1GbzNhekpveWgrWHl5KzY3eENoQnJDMkl6QlRldHl6UHBSSUMx?=
 =?utf-8?B?V0ZmTlNXRVVvU21saVJRUkU3bXN4Z1FPdFdBS01peEt2a3JkMW9rbjNmOWpi?=
 =?utf-8?B?Wk1PdGttenVrNHV2Tjkzd2MxUzA0SlN2YVJPNkFUU3h3bUNyYjNObjBNZG53?=
 =?utf-8?B?NTFoeFFHbmMrTUZMc1ZsYy9OblRuUG1ldXgzbkw0cmQ2SjY5VFAySko1TkpJ?=
 =?utf-8?B?T2lvb0o2NmpwcUNLZ0lPUUFpZWx1RmpZQ2tJOGdKaENRVWFMQjhIZ291MHhM?=
 =?utf-8?B?eEVFcUhmbDZWcjNuaWpsSUVNU2grTWRQMTRMcWV4S29sUitCdWhSck5BaWdR?=
 =?utf-8?B?WVluTjh2Y0h5OWdYT3QrTnlUNCtIVXhGSHp5aDRRMitPZkZwMVFSTjhWam13?=
 =?utf-8?B?djdBLzREdDQ5aXlhTEVIeXJlckY2bkErMXY4STJVUTA1N2pCcGVnTFBiTnVq?=
 =?utf-8?B?VHFuWWVjL1BwUy9vMFdxdjZMSWFiSytkNTEycFhWUzRibzltVkdiRC9rM1hi?=
 =?utf-8?B?MlhBdmpDRytvWU5nUFQ4bkk4TW9RMjJjcGJpbXNSZUs4MWtlb1crb1BEL0ZS?=
 =?utf-8?B?QzU3U0RrcWhtbTdqNDFxQWhmUWZreVIxVWl5MGN5NEZoZGxRMVppQ0ZDaVVt?=
 =?utf-8?B?akxrNHFLRkExOXlzYkx0d1ZKRXo3dGpsZzRjbk1NWU1tWlQyb1FlU2Y0UDZr?=
 =?utf-8?B?a25xRTlnMm5ZNGdXWERCM1pvMm1VMklaTWxkejBOa3BaL2pqcXlXU0tvTW03?=
 =?utf-8?B?QjJsbGk4L2R0dFlSczNiamFQbDRGbkQrTURhOUJrN2FQeWlXODJ3RnhWa1Ay?=
 =?utf-8?B?M2phbk50MVA0NS9WUWt5L2lCakt2cmhzTnpEM2s1SXJPcTN3NEZCYWhkQis4?=
 =?utf-8?B?RWlINzhDOUoxK0wrY014S29VYTVYWXRLUXptUnNOZThIc3IzazNadzlEN2FH?=
 =?utf-8?B?Ui9BTXFBVG9ZL2dEby9URlZrWnVKMnJLUmtMYVVsSjFJc2krMGYxeUxSSGRv?=
 =?utf-8?B?YmpwbkZ2cklqcjBrc2ROd0pQMmQzY2tCNFJoOWgwS3RHQVF6OGdWQ1JxUThV?=
 =?utf-8?B?azdVMVpoT2tiam4xK3IvbGpJNkJnd2l6Wk8vdkVkWk5nVFJZV2JyZkxqeW9K?=
 =?utf-8?B?aXowZHZYcEVocXBad241eXJPYVd0TlRZOC9QK1g4QXJiOU00ejJvdXB5NG9p?=
 =?utf-8?B?VjVBZDY5ZkdDMnltb1dvUHBmMitVYWtNUVNraGVFYWtWaFlNc0FUNGo5Z2Q5?=
 =?utf-8?B?cFE2UTJ1YjY2V1dTNHhRakR2czRKQjFNNlNpZjNYOHgzUFllOVhkSjlPSUhl?=
 =?utf-8?B?ZHB0dEJvaUY4UzMzekhrZUZrbFdWdldBcU9POUFjaWhZL3pSZ1drVWNtNHU5?=
 =?utf-8?B?M0g1VVNxNVpjMFp2eTFPUElnWFFBbG1aTkVQTmMyNVRjaTgrRHFRQVV4NC9P?=
 =?utf-8?B?YVFGWll6WmRsY0Vnakd2UTNIYjVRdHFlVlN2a2pHNDgyTDJaZ0hYbzljd0py?=
 =?utf-8?B?VHZ6dHF1S01RNWhYditGTGZOaGVCWGl2UHdYWXdqVDIyelNPeW9WNC9wdDNG?=
 =?utf-8?B?UXp6aERpcEJaZFBTOGx6WGdTZTgremhQYk1Xdll2SmpnZ1ZOYzBmM3Y0N1U3?=
 =?utf-8?B?K0g4dnpVRFdHb1A3L2NUS1lnTmF0blFZQTE3VFZCSkcwTmhtZFEvQ3pGOUhF?=
 =?utf-8?B?SE9HeXRXZTdkSlBhazdHenpWK1ZsOUdRbkFQM005WWVKdk5OaFM5akJjNDJ6?=
 =?utf-8?B?VzZKc3pWdkllK05rTkpNYWc5NXhETDdBN3NzQ2RTRXU0Q0RpTjBsZEhEOTNN?=
 =?utf-8?B?MEltL1ZVNktKUUp3TnJydVg2RnAvYzVIOTJlc0JrbW1DZy9Rd29PUUNQbDc3?=
 =?utf-8?B?akZqWkR0UXpEVXUvQlh6bmJtN0V4NThKR1k5N0YyeFZXN0FmaE9ZZmR4MW9U?=
 =?utf-8?B?aTNkbTBtQ0dZWHE5WkJTZFJidDlTamF6UGxZdDhIU0Z5am1jSFNvWjBpakpL?=
 =?utf-8?B?M2hXNXp1aEtEajVIWlhVaDl2YWtOallZWFhVZ2w1U1NRK2p4WmdMUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a5833bd-86ae-4143-34bd-08de705fab58
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 09:08:53.3965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Sh8ainI6fMpYosVD6j9QPoFd91O+r7kZZKbHSSgLdYbtTv8+cVNyGK/WTQLYifGOf9+BTWb93pogruz/9xH3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6559
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:stewart.hildebrand@amd.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6A2F8166063
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 08:13:58AM +0100, Jan Beulich wrote:
> On 19.02.2026 23:21, Stewart Hildebrand wrote:
> > On 2/10/26 05:55, Jan Beulich wrote:
> >> --- a/xen/drivers/vpci/cap.c
> >> +++ b/xen/drivers/vpci/cap.c
> >> @@ -376,6 +379,20 @@ void vpci_cleanup_capabilities(struct pc
> >>      }
> >>  }
> >>  
> >> +int vpci_reinit_ext_capabilities(struct pci_dev *pdev)
> >> +{
> >> +    if ( !pdev->vpci )
> >> +        return 0;
> >> +
> >> +    vpci_cleanup_capabilities(pdev, true);
> > In the case where pdev->ext_cfg transitions from true to false, it doesn't look
> > like this would actually result in the respective capability->cleanup() hook
> > being called, due to reliance on pci_find_ext_capability().
> 
> Hmm, indeed. Yet that's a problem with vpci_cleanup_capabilities(), not
> with the call here. It may have been merely latent until no later than
> b1543cf5751b ("PCI: don't look for ext-caps when there's no extended cfg
> space"). The cleanup hooks themselves (it's only one right now) then
> also may not access their respective capabilities anymore (nor even just
> try to locate them).

Cleanup hooks should be idempotent, so in principle there should be no
need to check whether the capability is present before attempting to
clean it up.  However cleanup_rebar() does check for the position of
the capability, and the MMCFG having disappeared would prevent
cleanup there.  At least that capability needs to be adjusted to cache
the position in the config space and the number of BARs, so that the
cleanup hook doesn't rely on PCI config space accesses to fetch any of
this.

Thanks, Roger.

