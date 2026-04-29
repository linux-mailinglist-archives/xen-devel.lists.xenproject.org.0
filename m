Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INlVKQX98WmElwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 14:43:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 442FD49434C
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 14:43:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297338.1573412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI4GI-00075I-Qd; Wed, 29 Apr 2026 12:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297338.1573412; Wed, 29 Apr 2026 12:43:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI4GI-000718-Mc; Wed, 29 Apr 2026 12:43:30 +0000
Received: by outflank-mailman (input) for mailman id 1297338;
 Wed, 29 Apr 2026 12:43:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wI4GH-0006uP-7C
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 12:43:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI4GG-008goo-JV
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 14:43:28 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f1fced-e002-0a2a0a5209dd-0a2a450498fe-18
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 14:43:28 +0200
Received: from [40.107.200.46]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f1fcee-1dec-0a2a45040019-286bc82e618e-4
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 14:43:28 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV8PR03MB7327.namprd03.prod.outlook.com (2603:10b6:408:18c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 12:43:10 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 12:43:10 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJB2aN2hHw9YPKmxZvhk7ujaLimwoxD4yiQr6vLh6Y59J6eDCzAmT7Akrec5sJ0AOquK7XGa+eCas56lyJ1fnXyDiQ13uA7L3l7Pi8Z/TLAcQXjigwiSSeAs63Bkj6gk/B6T5luf39oXolAi6kYvQRf2qEo9IOrZBsChOO8eECtj4RP8l02I2xxPyyU1NH/RKzbR1zqIJTsyrXq0CXDLWjZN2VHLb+pd338IZyJFteOsx2ZVcG3mP2d31WNZf7d9SSHVE4hBgXYJt7QyeubRkspSApnP7O7ZDrhjyJ7IYWjV/vRJ+NQWVLbmA5WhXdmgWPeHBSo/ocRzq5lNphH22Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MM7EQt8eQWvwZ7DmQscKM+4q0u/hxkPbkYmlBWetSXc=;
 b=qMMQovUj/IfKrNtUyXUGUFV+dIT6g7VsUemL51rP38dfjO1t0+ti1l7+5b9UZd+Ml9kmBTvyAUEkIJ1LPccdH+bCXHaqCBV0FKpGsgOdN0ejbDf0AfWor8UYI0b9wyEK176cTM+z1JzXCOcr62ETFUl093pyiz+effmPYNpJEnUHpcC6Rie5MtHeKVGRqGuetsZWvVLVqJJoNq9N9LKUdTVBiloLSDjiE8FT/FUqSnpbnM5ex1/GGmMjinlxy2a0b8/DiWPBdb+nhaFc6grD1w/dUjd85MqBuNlBvrtbysaRVKMon1M/wGR/hFjsJLLGp6jMBIndra8T6DGAabiRVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MM7EQt8eQWvwZ7DmQscKM+4q0u/hxkPbkYmlBWetSXc=;
 b=NnUZrCuvJyKrSALd3ZesLKiGLOZYXWXxVofd7PDmYlnJln4raWpG9BeJQBy6MvivTS5PH3DgxGFu784jqalAZ7MPcoTthJNSMtfujx2PCv6VOMSmQiero1fePHjj/Jmuco1WqHb7nmesjzwIVg4zZpTZKR8VTVswGCWOAotOSUU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 29 Apr 2026 14:43:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Alexey Gerasimenko <x1917x@gmail.com>
Subject: Re: [PATCH 17/17] docs: provide description for device_model_machine
 option
Message-ID: <afH823FT5PvnCWiK@macbook.local>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-18-thierry.escande@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313163455.790692-18-thierry.escande@vates.tech>
X-ClientProxiedBy: BN9PR03CA0857.namprd03.prod.outlook.com
 (2603:10b6:408:13d::22) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV8PR03MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b6db7f8-6703-4f63-8edb-08dea5ecdebe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OnIVtMFvhYLWyw9qEmvdwJ1gOY78lX30ZBHvdi6uFWv7oQOSqVC38+kYKSe2gvwAkMZHyVdc5VZGNk2SDOqCTAYAqBsUtKJAjkzzCppdIhxB49WfMu4+DnCOVeQBvDl+PYq4ZuWjomghw0Qu6lf8TJDhvdHYilyvYhtY1Ye+pDkUi0NQJGa+u1MJgVphpWwuisHZvL0Zd6VJluDkv3yzTvRtI+Gi8yLqzNGcUZGDLrA2LAJn5Ufor7wt90qDAzy+O90BHhnzAJ/B+H26G+Tyn2WTBw3L7jeXZf/mXsj8jk/8DTmWCmNWEMXmdIOoDCztPHcmzgp7xXXnk9ZT9KfPdoyOtwnOMKny9UNpSfmcLxwSuRYto56XToCQT0fbOcZ568ffHX4LQ8f5OuPcU9DmlbSdBpDXcLd3nCBkY+38BcgYSf1owPrLEu9Tz2W44CjbD/KG8pgRJvqrj7d7nw8n5D2HAKD36vaNr+vX7WkzWjgpoYyJL6DpPNOjiKhV5+yzmBAqFeG3AalhSHEMKTPwNGX5pWcKUY4uqgD0DfSMjg6lUPfvkvzUpe6bCuxdiAVcEdBQ8weXKbxVkhAA60JxyeNu8AbLNBLp2gmqkviSuAkurkMCuG0dcub1BrKX2dh1S2bVHslj5RXNIIu9GxPSkofgrLDAGM9TV2Plvj//K+BTl4PMKMw3Vi2kzRUPT3ujaE0GUyOGxCOg6sMcm+Sf11M83cBHEXHGdaqOC+MUp20=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anRRU1VqdDZOeUpNdTU4dGE3NHJiTkNYODVTMklCazg3ZmNrcytFMmp0VE1E?=
 =?utf-8?B?M2t5Y2xFaVNWR2puV3J0T3UrNW5Ha1ZvcERPQmJWMmZoYmV6WlUwK3piOXZK?=
 =?utf-8?B?L2g4VjNlc1Y5QnEyNTVjdExBQXcrSGpCd3RUYi9BYXpVRS9uMENHeTI4T0xl?=
 =?utf-8?B?WERabXB5TzJxK2dyY2J6N1E5OW93bEg1R0N3WmhPQ2pmOE1ORzNVaWRDazBi?=
 =?utf-8?B?RzdCbHRTeTBtYW9acFBwL2RiUlUrYVVHY080K3dhbitBRTNoV0FpOEUxVTZm?=
 =?utf-8?B?WHBVVFpGS1RmWjRVeUJNWkcvaDdFNld1STdMdS85cUhmVkFjNFI3QWZYLzBS?=
 =?utf-8?B?UWMyRmhLQnVwd0RiYXo0UVNnaWUrZUFNUzZraTFPVi9IeTVBZmFXeWpnRDYz?=
 =?utf-8?B?bXpzZlNxQ0R5OTFjV2pMZmEwU2VaaWR5ODRlUVlwYTFPWTcxZzJYRURaMDVQ?=
 =?utf-8?B?cEtHUmZmUTAraW1McXFLMG9hcXZ6UDM5VUhnZFZMKzJGUzh2c2hVU2JCaG5j?=
 =?utf-8?B?aW1sYWVEZVFDaHV0RXVoUHhMd2p5OXdTSkszdVRURWlXYVM0QW5WNS9OMlJ4?=
 =?utf-8?B?UHNWN3VjYnJGaHpXanREY3k1N2pMc08wa0RET2ZaaFk4RDUrQ2xmVDBQa1Nr?=
 =?utf-8?B?K0VIYVhZcy90VUFrZDdTdCtCdUI1Q3VhZEhvUGt4NHdyWnZ1aTVvbzBSTDJa?=
 =?utf-8?B?eE11ZndxWGdTWFdDUGRkT2E1anlvdEFuMmUxTzlINjlXMlhrMEptYnNUOXRk?=
 =?utf-8?B?U3FNcllNODNqL2c3RGw3MHJleFZhVGEyOFNPNjkzSzA4V0ZvZlhaTWZmZXdG?=
 =?utf-8?B?OWFHb3FHTW1lUGVubFptZndYc3RwTHllK0poaUdDbHF5M0FEMEhwcGRud3dY?=
 =?utf-8?B?ZW5xS3ZSTm9BWW4xTXZ1SWRvUE4yNkZPWFF1VCtYc2xZK0YxaTh3YmJ6UHVh?=
 =?utf-8?B?L3ZBTzZwZnFxbVkzbjZiTytTeDE2OFQwL21XWm43UklpNDIycnBCSkE5ODhB?=
 =?utf-8?B?U2pYWS9jZXNyQ1ZSTXRiVVRoaW5heFdTS3FoeE9GZnhHbldWeFBoTlVMRHFQ?=
 =?utf-8?B?R1I3Z3JDZ2NBWU9DOUhJcU0wdGhzaVI0S1QySDJ4eTFxVW5pd1k1RHFMSlhB?=
 =?utf-8?B?UnQzRThkdjZvK29XbDkzZHZjcjBDQ0lmTFBTUE9ZNjgxaTg4dWdrVWtHLzV0?=
 =?utf-8?B?eldZWHA5RGVaVWJPUzFBaysvVkFhYXVUUUE3b2lJZWFwWm9mQnRsRVR6eUtw?=
 =?utf-8?B?Q2ZUN0NFZDZJeVBncW1mTTVhbUV0dk1FWnNaU0xteHc1SEExak41TlBNaXZw?=
 =?utf-8?B?aHYvUW1sc0sweERIcCtyQVZNL2ZUVTJTUEdubG5hQTk3YStzb2tDbWJBNzFk?=
 =?utf-8?B?by84bmtkVWN5S2R2NUttWWhlMmZndjgxeTRhdkt0TndhcDZ4MVM0TlNSUDJt?=
 =?utf-8?B?OXVhQlYwVlBkYTZVbmx3NFZEb1dKV0xXbm1rT3VlWG1xUnJtNld3dWh4V2wy?=
 =?utf-8?B?ajVpTkp6OENjZVd3UERZdG11cGZSTnpKYTJ1Q0JDSGpXdUpjSjJGdG1DOThj?=
 =?utf-8?B?dTBPaWZodUZhSHErT1dyZUdVRDVramczdE12dDEra3hsdnZnWWVsTS82MmFp?=
 =?utf-8?B?NlFGNmJNMkNmcnlrMjVNZ2g2WEh6UjFOTFNmMEJudWRLczBkTS9TNGMydXZU?=
 =?utf-8?B?Y0NxUUl6UnJtYVBReUE3ckQybi9FWDlvSDBzKzV6QzZhZ25KbVdreVlUOU1U?=
 =?utf-8?B?THdpUi9kcU1DNVFxZzVzK0NkY2dGYmxJWC9PQWNFV2lIWlFlUnRMZitHZ1ZZ?=
 =?utf-8?B?eUlMNmRPQSs1UHlHR0ZMdTQvMHMxc3V6eVFDdGJSMFVEV056ZHdRNjdqVUFh?=
 =?utf-8?B?QUxDZkxyWmNOM3Z5YUxwNnFoZ2JxL3d3MlMyOEtRdUtPb0NJOFNkMks4amFR?=
 =?utf-8?B?bCtKekxuUDBzOThXNmlIYlBVODhHcEp0bGlYbVJSQlRTWGorNXE5Mi9xS2d0?=
 =?utf-8?B?QVRPcEhmalZqSS9BVGk4YXpFa054TlhSZXA0M0tIdkZxUzc1bHkvSlFGZkI3?=
 =?utf-8?B?aTFqNUV1WVlWSVZxSHlScTRJd2wxS0E3NGFPQVd4RENRSk91N3BKemNvdDFX?=
 =?utf-8?B?UkZTMHB5THF0NU5YWGFJWGNNbjlEdm9KcDZFakhzS0VLbGorM3g2cmR2ZHYr?=
 =?utf-8?B?UFNjdTJxSUwwRHYwa0NhSEFmS1QxZlRxRU9RTFgzM0FPZEQ1MEI2WFkzYVVy?=
 =?utf-8?B?NkUwcHBVSEVmeGl3a3RLYVN1QXkyZk44elAxK3F2MjV6MHhOdjN4MUErVDZY?=
 =?utf-8?B?SGliMTFIcHFSek9YcWpMWFB4aXlQeU1pSGNQYytxUU4wYzRkRE8zQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b6db7f8-6703-4f63-8edb-08dea5ecdebe
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 12:43:10.3575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aj5jXwqCLL0Z5gfVxTfksSI37tn33iR+479V2zFJGcjC32BtN/ObI5YhtkkVRQ5CLjhzfTgKlt6BM4b8IQCFNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7327
X-purgate-ID: tlsNG-ebf023/1777466608-2BB6B3FF-5249AA82/0/0
X-purgate-type: clean
X-purgate-size: 411
X-Rspamd-Queue-Id: 442FD49434C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:x1917x@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.xenproject.org,vates.tech,gmail.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,citrix.com:dkim];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

On Fri, Mar 13, 2026 at 04:35:05PM +0000, Thierry Escande wrote:
> This patch adds description for 'device_model_machine' option which allows
> to control which chipset will be emulated by device model.
> 
> Signed-off-by: Alexey Gerasimenko <x1917x@gmail.com>
> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>

This wants squashing with the xl patch that adds the option.

Thanks, Roger.

