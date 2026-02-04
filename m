Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cN8gA7wKg2lbhAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 10:00:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA35DE3745
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 10:00:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220239.1528959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnYkG-0006yx-FE; Wed, 04 Feb 2026 09:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220239.1528959; Wed, 04 Feb 2026 09:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnYkG-0006w4-Bf; Wed, 04 Feb 2026 09:00:20 +0000
Received: by outflank-mailman (input) for mailman id 1220239;
 Wed, 04 Feb 2026 09:00:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f40U=AI=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vnYkF-0006iM-AR
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 09:00:19 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebf61f06-01a7-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 10:00:18 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MN2PR03MB5231.namprd03.prod.outlook.com (2603:10b6:208:1e0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 4 Feb
 2026 09:00:13 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 09:00:07 +0000
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
X-Inumbo-ID: ebf61f06-01a7-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GKTK4lOs9MmQ/5W7ikWfJnwgR00iM6NLJ+lBfQESkDSJOYl+PMlOQZopw9EI+fE+GXfunhRzKDGtBntcWUDFs2ogD4KVgd4SZYl73Msok9rWXK8jOPeA7f9yTDVJs2YdcCiHXXB0W1yMEfs3Biv7/cgGuk/1LFucQyT0V6IGmeRQBUsZ1tYhaA9Rn/wQKkQhaeHDVUrcd3+eQofsT54lPJPRCYeGahPold64ESeQxwG1z8OLZkIyIZjHctbf11XdG96jh9D8R+ttj1hDR7aRrGqoOcvC/oKxd1aNdJWtngX13jXuVOQncDcud+l4VrFfCONa0O/ANmS61KilJMrG0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2rTzhXummHWWEJW7e/2JZ48DWUFsQOh8s3YxlG0PS1o=;
 b=wHLJ5IJwFBtUUJz7b+B2HqNY/ZGmIZo7BSgbx0F+mthDqBrBwkbHP1HihISnHoRJA7kMnpP3D+AXnOAo7udvdZ+pP97ydOSvAmrgtU+ZOS9glcunnjVVeYETIhxkoqRgNAGGWO2mCFO9kDomWxBYknhYV30nxvwxM6K6s7j6wgFjJ/hgEsP/TH8pmBwjpcN1Z4hU3B9TNNcQWSUQA2yGMXtKlAZfbQAclNZQsyqjq7Gl+PampUHkr/zTd37sahB5M/VDOEqFQ9dOt2xH2hZoi+vzCwL5veJ32WxUEMsREhUv/xYqA3JBr+ctF9KDRWf6hPsU6KqgzjNHlGkcljBAzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2rTzhXummHWWEJW7e/2JZ48DWUFsQOh8s3YxlG0PS1o=;
 b=rvY5q7KemI2OA9ug+P5elOajpDqUGM+BRbzF5BgJ1RhFkjW2OJb/65xh5BCrm1G0/WoWr9QCKEzmCfKZJ83mMZEAAZqAyHY7HJ+k8ReCSaTpeKLQ9VTLhXQneP2PGkqqGt5CtRZgz/Bcic2InPn6qbHtiitrPPK0GffNxf+goug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Feb 2026 10:00:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: dmukhin@xen.org, xen-devel@lists.xenproject.org,
	andrew.cooper3@citrix.com, anthony.perard@vates.tech,
	julien@xen.org, michal.orzel@amd.com, sstabellini@kernel.org,
	dmukhin@ford.com
Subject: Re: [PATCH v4] xen/domain: introduce DOMID_ANY
Message-ID: <aYMKk9YtrR7NOKyt@Mac.lan>
References: <20260109140747.195460-2-dmukhin@ford.com>
 <aYL6Bt3Cs3HgeMPm@Mac.lan>
 <0e3a1af4-d87c-405c-a0a7-598929df3f4b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e3a1af4-d87c-405c-a0a7-598929df3f4b@suse.com>
X-ClientProxiedBy: MR1P264CA0041.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::33) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MN2PR03MB5231:EE_
X-MS-Office365-Filtering-Correlation-Id: d8cc4dc8-ff81-43ff-3dcc-08de63cbcb20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUJWOTA5RENNRlhucTVmTXdPVE9NUnkzOXJjVjBLdy9jeFk3OEN2R0RaVTgx?=
 =?utf-8?B?ZDFiMzNwaHdMa2NqU21KYklJZ0dSNW9rZ1lVRGNQQlo1b3ZObUp4NGViZVRy?=
 =?utf-8?B?eXdRcXkzeFdwOWttLzlqa2wzSGRZNUZkSDRZczd6UUpWMjgremo5NFpsRWNw?=
 =?utf-8?B?Skl1akpaUU5ER0tOcThIRmF4RW51STR2dUNoNW8rOFRZU3FDb1g2aWdYOE1X?=
 =?utf-8?B?b3RsRTY2WmVYM1FVM1RVSFgxTTh4S05HU094My9ENW9pSXhTeU9wNUFjTmtq?=
 =?utf-8?B?dlVsZUp6Q3dqNVFSTUFTQVZEYllRK0ZmMmJoR0tyRzAvZ1JuLzFIZTBRNW1U?=
 =?utf-8?B?eis0WFAxMW5BZ3RweXZNYnBhU1ZBRm5UYjNWK3d1OUlRWTNqeHNHTW1IUWxj?=
 =?utf-8?B?MU9nRUFBRzM1YktkVmZ0NUF4RW5BN2JUM25lVzdyV3NEL0dwWkdoeTkxWW9N?=
 =?utf-8?B?OVVDV0NrQU04RXAwaDVrbjVMeE5PbEhPMmlNa1QwZ1JwODRoRzBKQlVYSk9p?=
 =?utf-8?B?MllHZUlHekY3MWhnLzVaUFF1d2lTeW55VWNEWHRtQUJ1SUF5UmFIMVFKeHMy?=
 =?utf-8?B?aHk1Nm9aWFdaTktxb1RqNGd3M2hpMjJjaTU3dHY1SHhSWk9GeVdOUjdaOGVC?=
 =?utf-8?B?ZEhEMGIvbEhqb2Y2L0FWNGd4eG9wZGpMZ2E3NVBueXZ6bDU0KzQ1VHlyeFF6?=
 =?utf-8?B?MTg0VVZMNldGZVhRUEVib2NCZXgwTnhOc1ZPUldtdVZMY2lXWHFTc05MajNk?=
 =?utf-8?B?dFhmVGQ4WjZPQU9RM2dEQUVXNUVaaElSZGRkS2tha0RjcG9Xd1c2VVVFRDU2?=
 =?utf-8?B?MkZwSWZrUVRsNGRXSk93QURlSnpZRlpucExCeXNnd0w4ZEQzS0RwQUlyRU5J?=
 =?utf-8?B?alB1M1IzU2dMNDl3ai9XOGNPK3pyQjB4WG11N0JCOGlsdmV0NFRKWU1vS3gz?=
 =?utf-8?B?Vy9SWXJiSnBRWVJkd2RQSUZnaGgveUpPdy93S2hTNHQvZ284TGxRbHR0ZG1R?=
 =?utf-8?B?QUZvZzJkd25Id0F6UXdlRjRieS9FNzNra0hGSzJMMFpyUEJvMUZBUzlxVi9W?=
 =?utf-8?B?L3d1SWZIekdDUnFld3d6dFVmRmlJTzczV1N3T3lTUDMwNVdtc0I0Sjd2SnR0?=
 =?utf-8?B?aHBENG9LMzVmZXAzNWRNT29aUUhwNDFvSW11enU1YVFHazR5aDVrcjFUb2Fq?=
 =?utf-8?B?aDFIT0t3dkZNcTZnamJTTCtPUmpyVHNrSmpRaE9sZ2J5a0YvNjBrVDd4Nnlt?=
 =?utf-8?B?ZmIvME9oZS9EMG5MKy9nMkRvMTA5bDZjTXVNR1JCWVZKbURhZ2NLQWVQSGdj?=
 =?utf-8?B?SlhoZEVGWVdXZUJNSXNuR1pIdkhTUGxCbEFnQ09kajhGMWg5NVZ5ZEZSWHpo?=
 =?utf-8?B?L2IvbTZDWnE0bFpzUU1rWEt1NytPODBtUk9pcVQ4dTcvbVhsbE5WSG96b2p4?=
 =?utf-8?B?WHlxV2tKb1U5cnpPZnR1eVJPdS9NRGE1OGlaSXJIL2xkRllEQzIrL3BLZlVi?=
 =?utf-8?B?ZWtOeE1oTll6TDBUSzBPL3BYcmlTQ0hJaW5YejJDbXpGaFN3NVJxMlRGK0po?=
 =?utf-8?B?azRhSjlId2djV3Q2aDY1VXBFTmgzRUxyNjZsR0RQeENpUGMrZi9ZL1Y0OTN4?=
 =?utf-8?B?ZVZwSXJSRDB2bjlZTkRRQmNQVk04MGJHS1dKK0RFanpiM1QzK2hVSW1YYitZ?=
 =?utf-8?B?cjZ0RlV0ODFpRHBZRzlLc3ZJdGx2OE5SbXJReExZN1BRT0krR0Q0RmliVy9J?=
 =?utf-8?B?RlphYUpxZWkxTDA2YnVvSmplem1QMSt2NGJxaHp4NjZiVEk5Zm9GWlVBdmN4?=
 =?utf-8?B?RmpROW9lNEtLVWluTzZhcC9QWVBKNE1BMHQwNk1GYzQ0QUtJV1ZKYTdDYzlQ?=
 =?utf-8?B?RFVuQjVncmNQMHpDcWlxU3RqcVJENzg0WkdLR1doZkRlRFBkUVJHbDVPUHFn?=
 =?utf-8?B?Sjd1Y1lRMmNXK08rMnlUN0E3SDhha1gxd1FuNWZzZUV1Qk85UGswSFV5d0Ru?=
 =?utf-8?B?dm96bnErWWlwWE9sbHJWZVBMay9iSEJuWVpEWTZRaXMxNjRuY0M3VFJ5ZFda?=
 =?utf-8?B?TEM3a2RuYWVUMmhMTDhoYmFzUDY4YS9VdlZVb3lTZWhLd0JyY2VZd1BnSDFy?=
 =?utf-8?Q?7vWI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sk45MjlOY09IOFFLbExuWXYwVWt2cjRaOXpZdzJOZWViRG52ay9HY3h2UCtQ?=
 =?utf-8?B?OU5ySFZETXJWTW9xd3FmTjc4d2ZnU3J1Z1Z5UWtPSVpDR1U4cFZxaHZyWFVu?=
 =?utf-8?B?VjNrc1JuK1R3c3QvQUc1bmgyRDNlQ0N0alFrcC9VbXZJblUwMUNxdTlNaUFs?=
 =?utf-8?B?MjNKdjl1OEJsQzFEYmFCZzNRSDZiSTNLODJrd3BKRE5sM0xzdXRMTmhrVFB2?=
 =?utf-8?B?Q1hPVXNQMWpVY0IyelNlQWNhL3R2YTNuT2syeldNTFh5TW9POGtLL0xFR2Vt?=
 =?utf-8?B?TUErYlJFWHhoZERxaXZVdktUMitjZjZkMm5iRWJwWkhDY0oxUWVPS3gzN1Jr?=
 =?utf-8?B?MXc0bUtqVk84U1gvL04rQVFyVG02dlgxMkdWQ1ZCdTkwa3M5YjNHajVhajRt?=
 =?utf-8?B?Vm9QRDlzK295NS9RYXdZcThNeU9xRERCSG1qRG9FSzBVUnBRRlIyWFE5bS9N?=
 =?utf-8?B?elU0c0FKRy9GS3l5eE5nTjVDbEI3bUEzZHNlWW5JL0JaOWdWcEQ4U0h5UjZK?=
 =?utf-8?B?c0xnUExYTmxPWkRCWjhSSk5WQmRTRmwzRXFhSTJodHI4WHpZQ29SckVyOUd5?=
 =?utf-8?B?amFKMnlhYXhibitTU3hBdlZLT2dEQnd0UFJEcEVTYitwWlozdEMwUDJWVElE?=
 =?utf-8?B?NTBmRnB0VW5pUDIzbERwZGtVVTBSS1l2dENVZi95TEpzdGxieUdDeGxTOUkr?=
 =?utf-8?B?VUt0a3R4djBzMEtSRlNqZTZ1c3gvSEpzZWFnWk95Mmdkb3MraDBGNml1ZU5j?=
 =?utf-8?B?a2dzU1lURm9TeXlzOTgvblpTL0ZRL0s4WThDQ3lxYWYyUHFCbDdybWNUYWRJ?=
 =?utf-8?B?SzBaQjNaUDlDcEkxSE5XaTduRGlwdk0wQUtaY0FvUW9PWklyK1ZaQjRJZDFo?=
 =?utf-8?B?Rk5jdWFBd0tweTdWVkFqLzI3ME41YjBOSzcxby9tb0VZajB2Q29iWllSMnNn?=
 =?utf-8?B?ZWNFUmgrekJrVXRFbzZFMmx2YWs2VGtSSW9zMHpmTnZhS1EzT2FWQnVEUjhY?=
 =?utf-8?B?L2FnOFdBaFBvM1hIYUQvdVc1QitiVVFGdUVndXppRldPU2psdnVoMEwxT1VO?=
 =?utf-8?B?SXFDemVuVHRiL2JIYyt2bE1hMjdDUFFORXpKbHBYelJ0T0c5RXk5cktmUmN5?=
 =?utf-8?B?cmVja0Q1Uko2dGdCT1Awc3dsZmg3VHVLcktWRzZEbTB4RzUwTkp0L1VCbHp3?=
 =?utf-8?B?SE92c3VSY05IVVNtT3lXTHpZN2g3azN0SGVwUTZyMS83VHVFMWlTMlM4RGN6?=
 =?utf-8?B?dFlQOHBnWjQrcm9lQ2dueTZjbG1NMFJ5K2xmMlN0V2VoSldEM1VsTnpucjdN?=
 =?utf-8?B?TWRuMitERmlWYkppQUh4S1B4WklNdW5uaWJOeWNNZnJSZXd6TWtFKzVFWURP?=
 =?utf-8?B?cE5YUDQzNGovMGtGL0YzemRQazBYbVFMcFUwQTRtYkw5bnROcnhRTDV0ZGk4?=
 =?utf-8?B?a09ZSWNra3VYMkRZVUZwMGlleDlXYXN6anlVbEFsN0wzTVVjZEpOdHBLMVZm?=
 =?utf-8?B?WDJueUsvMjR4eklYMVd3SGFLYWQ0WktVemVMbTIvS2dDYTBMNU9ObmdOTlh3?=
 =?utf-8?B?dU9GS21xMEtDWnhuZzVTU0lSb1FTL2ZTSkVoUWxjek1WNnR0SkhOQVgxWDFW?=
 =?utf-8?B?a0lSMmV0bW0zR1A1ZlVTYUNTdmVYWUNFRWI0eEgyOVFEcldDdWdCRWxqLzdl?=
 =?utf-8?B?SlZmaVRFM0xRbXJtZXRZZkppMStmN3pNVldLVkNocVRVK0dYeFhFamMyKzY1?=
 =?utf-8?B?OUpZeDNBL0Y1cnFUM3M5YXJZSUg5cGhBUS9UZGlLNUF1RTU3aFkzbTN0SFdu?=
 =?utf-8?B?Z0NyZDJOZzNneHJpdm56ZWwyVnJZZXoybFRELy9mbDRXSWEvOHJZYk5JOERF?=
 =?utf-8?B?RVU3TGREVkw3ak9PZmlVNGpkRjd2MlUrNi9iSWhxMVNuTzZ4RHNFcytwN0VY?=
 =?utf-8?B?QkY3K1FOaGFXZDI0cHRUQm4wR1JuY09sT0p2MW9RSCttcmZGK0twd2p0NkZY?=
 =?utf-8?B?czhqRmxSbTlVN0wxdDMrQ2U1ZFIwNmVBME5yN3BmM0F4TmNlYlgrUDhhK1do?=
 =?utf-8?B?bDkrRVZuZkxYYnZiaFN1VmZaMW9kdGdEZ3ozUGg3aUxRcGFhRHE1SWZKbVlG?=
 =?utf-8?B?ZHluNWZITkFzbkRKekRYQkVJaVBTcjlKNkREbGpVQ21JVHcrTlc1SmhXUC9u?=
 =?utf-8?B?S0RxakhNNERrTE1uRGw1alBJeXd5bmhkNFhvQVlVbTBiUGwrSDc4OWcrV21K?=
 =?utf-8?B?UStkUnpTbjdzSUdybG43ZmNLMk9kcXByNlh1KzhZUFoyWWhkZEZxOGhDdWRw?=
 =?utf-8?B?K0pDdG85R2h2d3Z0UG5ZRTJRR0w2SDlpK0UxbmFndDE2RTdnWEEvUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8cc4dc8-ff81-43ff-3dcc-08de63cbcb20
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 09:00:07.2745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 86wPchZ/jSmY1Kzi3P3h5bO5ifvpwTxblGJWdFtQDqqEY/Xg4QDcaH24i4Q2GX2ZliexztVmyXiC/w3b7TvL8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5231
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,xen.org:email,Mac.lan:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[xen.org:query timed out,citrix.com:query timed out];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:dmukhin@xen.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AA35DE3745
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 08:56:10AM +0100, Jan Beulich wrote:
> On 04.02.2026 08:49, Roger Pau Monné wrote:
> > On Fri, Jan 09, 2026 at 06:07:48AM -0800, dmukhin@xen.org wrote:
> >> --- a/xen/include/public/xen.h
> >> +++ b/xen/include/public/xen.h
> >> @@ -608,6 +608,11 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
> >>  /* DOMID_INVALID is used to identify pages with unknown owner. */
> >>  #define DOMID_INVALID        xen_mk_uint(0x7FF4)
> >>  
> >> +#if defined(__XEN__) || defined(__XEN_TOOLS__)
> >> +/* Domain ID allocator: search [1..DOMID_FIRST_RESERVED-1] range. */
> >> +#define DOMID_ANY            xen_mk_uint(0x7FF5)
> >> +#endif
> > 
> > I would attempt to word the comment in a more generic way.  While this
> > is now only used for the domain ID allocator, it's likely to gain more
> > uses going forward (Juergen already expressed interest):
> > 
> > "DOMID_ANY is used to signal no specific domid requested.  Handler
> > should pick a valid domid, or handle it as a broadcast value depending
> > on the context."
> 
> +1
> 
> > Also, I would remove the tools guards, I think once a DOMID_ constant
> > is allocated it becomes part of the public ABI, and it cannot be
> > withdrawn.  See for example DOMID_IDLE: it's only used internally in
> > the hypervisor AFAICT, yet the define is fully visible in the
> > headers.
> 
> It was me to ask for it to be guarded like this. DOMID_IDLE (and perhaps
> others) not being guarded (at least for IDLE: by just __XEN__) imo was a
> mistake. That mistake may in fact be correctable, if we could prove that
> the ID cannot usefully be passed into anywhere.

Even if it's not passed into anything, does it make sense to guard
them?  The reserved domid values are already consumed, ie: cannot be
reused in any way.  It just seem to me like more ifdefery churn for no
specific benefit.

Thanks, Roger.

