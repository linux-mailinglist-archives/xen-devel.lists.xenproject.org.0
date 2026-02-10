Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SH9bKPRCi2mfRwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 15:38:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 040A911BF7F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 15:38:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226439.1532948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vposQ-0006P8-Te; Tue, 10 Feb 2026 14:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226439.1532948; Tue, 10 Feb 2026 14:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vposQ-0006NQ-Qd; Tue, 10 Feb 2026 14:38:06 +0000
Received: by outflank-mailman (input) for mailman id 1226439;
 Tue, 10 Feb 2026 14:38:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gjf6=AO=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vposP-0006NK-4L
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 14:38:05 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1aa8cbf8-068e-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 15:38:04 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB6514.namprd03.prod.outlook.com (2603:10b6:806:1c5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Tue, 10 Feb
 2026 14:37:59 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 14:37:59 +0000
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
X-Inumbo-ID: 1aa8cbf8-068e-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UopzUhs2C61/d85CrChPBEpAwvZGDguHXxw1ysqaedRwE1OdQnkUTCB/CEfUAws5Aup2n4hlpmGvNvtudX64HloQB4cE65WIvEQZt/b/fD6WLEwX4IRmdfX02fJAbXGW23ZtL243eu8w/XfajRxfve5ikeCVWG/6xVXO/aw8rw3vxKshZpEUoImVS+ZCOSbMVTEiUaVMIHyXE1J9jPX3b2XgOWKRcJVnfZoa3YyytTFcmKfv9ZvevL9jTffL3cKhpK9rCAdtIuylIB9WYXqWPJUlhWRzmnm8eR5q8XsZgjh11r9XrrRUPyFB0vRopNOd7SXiKBJ09aZWrpq7vhjx1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pz9cjut48Hq80XyhU1j02ksFnId54df0Cp/IRYYatGc=;
 b=uTK1o59za4FOIWBtLpcZ/RtWD3qirVDpFV5AFI2GiTveP8m0SiccxXHiOOk5qIEFuVky0FK0eOLyc1/Q/IvJdM4xkdBC+al4byCLHyl7VSzaLsKxZfqRDggpRIpiTM6SrfvHaLsdlikNn7vFxcISiM/L/PXAAvSG0o3Krp5u7dzmE2y8ZoSRMkeoVwQ9cdMjJRyPUAUD9Oy/eBwUrP3ZaHlV9xr+zGjMq+NPMonMV0eUZ8TYYKBjBYjJUi/rC51LfcJdIPMCRkEd/pH0DhFnJw1LuE0YyxukhNyEvSXfvFP7dykgkWTO3UGs94IRUmc4WxpCFBVnOJSL4NjUDGiMxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pz9cjut48Hq80XyhU1j02ksFnId54df0Cp/IRYYatGc=;
 b=cQB4vBt1NVqYGAhD3TT6jJpM97PqWB6OyJGR1mtqSbB6hbT0H9oIZzuqjtAgsWADrK47L2ZrM/jlqJjKtk1hY0ra4tHiuRvd00117vnsmjuDJVP6/S/2eA9BVpA2O1fIbmh554dwEVbKOWS2Z/+LuG12az66EEUCyW8nHjgUcr4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 10 Feb 2026 15:37:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] non-x86/symbols: check table sizes don't change between
 linking passes 2 and 3
Message-ID: <aYtCxOVsoLTd1fNc@Mac.lan>
References: <b61b7054-b27f-47fc-b268-f1dae3f1980d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b61b7054-b27f-47fc-b268-f1dae3f1980d@suse.com>
X-ClientProxiedBy: MA3P292CA0036.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB6514:EE_
X-MS-Office365-Filtering-Correlation-Id: db22b715-15dc-4d98-4f2a-08de68b1fcd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmJYdkRRMHdRNTRVTktFTThnbFU4VXk1QmNUQlRtY1pDQ0dYYllLSnVTTnlP?=
 =?utf-8?B?dU5rMEhvUXZzM1Rjb2lraldSaFFuU2ZTVlQ4bHk3VHBSN1B2NHRIMVhSOWxy?=
 =?utf-8?B?Z0k0eEhkRHIzS3BzSStVaFpTTUJqdjNqSE1vbkhjV0JBaXF6MFVLOXhrL0lt?=
 =?utf-8?B?SkV0ZjhDdFR3MVBvTHhTVm1ZUHF6a3hJb2VKT3RIMVo0RHRqMmhFdGM0SS9Z?=
 =?utf-8?B?ME01Q3hQTS9qZ0pXVGp6Sm5qTzJ3dzlIOHJYNGtNMDYyM0R1dDVobVFWRjhD?=
 =?utf-8?B?RVdHTDRFcUljNlMvVjNXTVdBV2ZVWmZTNWlrMUI2cmxGdDlNSGE4eXR4SjZZ?=
 =?utf-8?B?bTNDSWJqMGxBYWRGZnRVY3cxaVh2M1I1RkZRR2lMTGNOTHBEY1VsWHBOUGNy?=
 =?utf-8?B?a3IzR1Yxc2ZKd0RJZE5zejcxN2hBNlpmWWtWdWxCaGRJaGJyZDlRL1FRdnFG?=
 =?utf-8?B?TlhKcTdrQWNqdVU3RytaVkNhdVExeTFvWXExWUR6S1VrVXUwKy9acUF2UlRi?=
 =?utf-8?B?ZnhQS3dva01WQVdReXBSaHh5RWUyb1FNUjgzV1FCMFdNZWhJY0F2SGIwWXpY?=
 =?utf-8?B?d052UlptNDcrb2VpV3p4TWpSV1RaVU05VnVrYU94ZTFZYUN2ako3bmRiaGpw?=
 =?utf-8?B?ZCs2ZTF5ZHh5Tml2dWxWanlSUkpxZWdsdldtNFJuYXN1Q1lpU3BjUzdaY3JG?=
 =?utf-8?B?YjYzTDFBalhqTDVUYithUUxWWGlIa21xVUYrOEVHRDc3VTlVYXZncjRUWVhn?=
 =?utf-8?B?RXpHRWJkclhOZER1WXJXcjQ1WGpBVjJScDY3c3BiV2JBSW4zQ016M2lUL2JY?=
 =?utf-8?B?ZStpNHEzdGdWMVhJTHN5ZEJYcjdkMUdwKzJkNC9BczV6eFFqc05kYk9UVmJ6?=
 =?utf-8?B?bmwrZG5wWktZSzhtckx2aW5Sdmp3eFVubHRkOUhOU2t0WlZzWm83N3JwanVP?=
 =?utf-8?B?TFVGbThaN2dCZzd4WEl5UUIyK3BDeUFNeHlWS1U0a0hPSWFnVXI0Yk4rbU9s?=
 =?utf-8?B?TVlRNkt5a2VDcjVHQ05LemdBVTJFUHBraVZBZGtGRTdMVzgwcnJudERVOVpC?=
 =?utf-8?B?VGpvTTQ2OWZEV2FMNHVNbUptR1pvR1huWkh2cWYyY1NRSWNrRFA2R0pjTG9t?=
 =?utf-8?B?TkU2N20zdDg0NUVKZlNzZlQyaFRrQjdvSVFtSVU4Nkx2TjFHSXcyRkczZEdN?=
 =?utf-8?B?aUt1cCtIUGNNTWlVV1J0WUc0MEhITTltbTZDclNUOUs2eVJyTEJDeGw4dGpV?=
 =?utf-8?B?ZlArTEdvYmpJTm8rZmtjUThUT1pXS251LzIrYU84U2g1YVJvSUZPK3JwY3dt?=
 =?utf-8?B?N1dDdzI0S3czZ0lONDdZalNmb1MvT1FLVlRDN1FCZW1Ia2VhWWlua2xLcXlG?=
 =?utf-8?B?YTQwMCtUTzZvR3RTK0VSaG9aK0xPYkNBMzV6Zk04V1ljbnRNRlBxeG5QeWQv?=
 =?utf-8?B?UVpsUW4zUDI5bW53M1ZVQ3hRTXRicEpwREJZNm9FcFBEZWdRaUM2OUdEU0Yr?=
 =?utf-8?B?L3Jza1JiZXJiWTAwelVhUFJncXZjajVvVkRhT3RtNU5IQ3NzUjE4ZHFrY3dO?=
 =?utf-8?B?TUp4NDEvNVkwRzlGS1pYTkNSYlhCNFlEdGN2Qnl4WWVVVTdPVy9ZWVZuZnhL?=
 =?utf-8?B?ekNxZk0rdjZ6b2NBMXczZ2NZVVlkLzl1UkhlZUdOOXdBRmVBanc1bDZmRnJm?=
 =?utf-8?B?UjUxUWhSaXJjaE92REtBeEk4YVBob3NPa1p0RU9FRVo1ejJSRXRPYVExRVRr?=
 =?utf-8?B?c3NMVExzc3F1bU1lZGpWd01aTEpwR3pBenZRV0dEVG8wd25kVXFmSjg0YWZ1?=
 =?utf-8?B?eW9ObVd2OGFNcUsrTm1jdWRFbFlPUnArNFFrUFlpcUxDb1YxU1VkN09CQS9C?=
 =?utf-8?B?Qlk4WkVMTXVJL1NZblNYQXZwTDM1dnlza0xYbWN2RlR3UkpFc0U0UytpNkF1?=
 =?utf-8?B?U1cwVi9EMHdzRENveUk0dHpkb2k5VWtOMnVaRFRzUWtHNnRoRXp1ZnVndXpt?=
 =?utf-8?B?aW9oNmxyczZ1QmwvNmtpdVhKb0sxdzFRTVhxVkd5UVpETG8va29MMWRTdkkx?=
 =?utf-8?B?YUtYOEMvQ0hVaWdGeTk3dERVWkdoWHZEWUd2V3NaVUhMWmpBS2lLamVBQ2F0?=
 =?utf-8?Q?W1Y8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEdHOTRUK2xxSXkvMk9GVmkxVGRXemNxWXdKTE16Q1l0N2J6YlBzZlEzS0Vi?=
 =?utf-8?B?RUxSSktXM05xMk03Z1NkckJkNWt2UkNnV0J2Yi9uQ3E1SHlvL3QvV0hQUVpV?=
 =?utf-8?B?bzB2V00yYXdkY25RNFpkcTdOMXNZNFhlV0IwNVFwR21KQ0ZmUW9VY2J4UlZS?=
 =?utf-8?B?TEErL0FkM2VlR08wQVF5b3o1WGp2a2ZCY3IxRE5VZTJ1NDh0Q3g1dGl4akkr?=
 =?utf-8?B?eklyV2V6NFZyTmViWDBZWUF6OTllK1FiTHNvUWVac1cyekdlVUh1ZTBYYklH?=
 =?utf-8?B?NXZyZklLZHZ2ZFMyd3VYSFlHOWUxOC9semhKemVON25KS1lKQnMvcnRrdEhD?=
 =?utf-8?B?WS8zbkVxL3d2Mjd6UDBlcyszcTQ4bUxDaUJWSi90cnJ4Q3hZL2F1cFc2LzE2?=
 =?utf-8?B?ZFFBZjN3c1JhYlRXYVR5WE52OTFCOHFVKzBBQ0VsdjlzUXRQek5Qakg4OTha?=
 =?utf-8?B?b0FrL1pnc1FYUU9ucXhENDZUTFoxQ2JzYzAzK3dwYkZJOVg4Y3UrUXB4Y3dF?=
 =?utf-8?B?SUU5VkZyUTlwdjRRbllLYmorYzlyMDNEZlhod2VqRjhQalVqcXFVa3g3SmFv?=
 =?utf-8?B?eGZvMEpXTFhzcWhVQ2VnMkZXQnNFSmpNM3hjcGE5L1BKWG10MnhNUmV0VlZD?=
 =?utf-8?B?Wk42eVFpbXhTZDBva2c3QlJENmxvZE1TZGM2UlhMSkltcGp1elhMeVd1aFRi?=
 =?utf-8?B?dDVZS3pzeFF1bTg1S2h6ZVF0ZnFUcjBxTEI2YjVVeEE4MlcyT09sVXEybGJk?=
 =?utf-8?B?K1dJZ3JnSysyYmVRN2FjOWIxZDQ5OUU5YzhONGovR29OcU0wN0tnaTl1aGU5?=
 =?utf-8?B?QWtZTW5LU0NZMm5yS0RUczUwdE9RV1FKRU9mbEFndS9RZUVydEhJRDZTVStB?=
 =?utf-8?B?bCsvVFowb1dkbm5BM1gweHZpUWZlWHJvK3JzVFV3dG83RGN0WHFPUVNhek9P?=
 =?utf-8?B?RFhRMHNyK2RIeGR0S21EUEM5Qlh3MFE1SUY1Wkx6NVNpR1k4d09CUFllbTBZ?=
 =?utf-8?B?MzNpdWJ4dDAvTTRjSklxSVh3eU1WY3l0YkRWNW8xQm4yQjBlajVvU2dWdUtK?=
 =?utf-8?B?ZDB3RnlqWS9TTFFSdUJTZzJ1dEdFZWJRbDVMWWFOT2FEbnQ1V01EWmI5NXZm?=
 =?utf-8?B?dExPSCtlQkRRazVPL2tJWWxMUkVjVERtZm1CeHQrSytIelJrakVtZkZiS0RW?=
 =?utf-8?B?VVBPQlN0QUh6cnh5MTNyWHU2aXpYclVLMUFPMWpJNHp4bFVXVnA1dXJ2NEMx?=
 =?utf-8?B?T2VkSXBMbTJ6WEFHODVLY0ZXbWFtK1pBT3JZTVdNWncySUkraUdUYVR6d2kv?=
 =?utf-8?B?cmF0Y2JhTmgwbjFOSkhYZlZiWjVCMHZQRVNLaWpWNitDVkFnT2t4cmVIWHJ5?=
 =?utf-8?B?S2NuNUpwYTM5aTVJMjUySzRTYTQ5OXNrZU5iM0N6SE5Xa0h0N3NaSzAxeTVp?=
 =?utf-8?B?c09HcDJwbkV2YkVSVnBHdXd5RU5JeWNRT1Z3Yzc3VkFHdXY0NUQvYk8xeGVl?=
 =?utf-8?B?eXNOeC9kaVVnbFlDZGtKdmxMd3lGYzI1TUk1VTZrakVLcEtSNC81YVBUaEhT?=
 =?utf-8?B?Q0o3a1RGY1ZacGpQMWNsMVI2enNXTWFQZ2l3SUlHTWtiT2x2dm9pWVpzWVZ4?=
 =?utf-8?B?SE84YW5uK01QdmJqTmFFVHY2SUZXeG1IK3kzSnh1ejdBNnptMXN6Um0zQVBS?=
 =?utf-8?B?dnBVa1dPbGhRT29oSEZQaUJrN3pzN3FpWHVzYlU3UndPcHQ3ZDM3TGZDN2Fx?=
 =?utf-8?B?TGNnZWNDaU40Tk9ScWRvdFZjNjdwWFpGejlFVjY1SEd1OE1udmlpcXdkTjFC?=
 =?utf-8?B?elc0QjFwOUtoS25qWDBPa3N5T1B3NnNxU2hVNXVKM2lUNHNjY0hvN212VlNE?=
 =?utf-8?B?MWJBMnozR3U3bHF5b0xic2NGdzMvSGJSNlVtTnpjM2RBc0UyenVxM3M3R3pw?=
 =?utf-8?B?bG9qdkhZYVNkVkRXMjM2Z0lWRTFWajRYOHNEcXh4SVp5cllobHZKcHdtZm1i?=
 =?utf-8?B?VjNjejZlcVc3dFlneUUwZjcwQVd0cDhhUWtjVWJOU1lISzBiQ3dwSHBFMXpV?=
 =?utf-8?B?LzhvYkRrQUtZZ3dTTWhFa3RJdzBXdWozMGdIN1hOUDd0Q2pqL3QzeFZOeWxs?=
 =?utf-8?B?dFlkNjFjejRyWkpPUDhWOVE0ZmFGaE0wVWxJSUd4VVJVdlNEbURpdWFxM2hs?=
 =?utf-8?B?ZE1VMk1hNXBmRFZ5YnlpYjdCdFZZN3VqS2Z5NWlqNUlaOEZPUDIxdTNQdzFs?=
 =?utf-8?B?dDduU1JWOG1WZG5HMlh0YWNiY3JoRTl4MURHWWZuME5NRDl0RWtpbVZrUmZa?=
 =?utf-8?B?ZlQ5YmVFT2ZDa3dRd3dIemNEaURLVzI1c1p4QnJ3OTc2bHhQZyt0UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db22b715-15dc-4d98-4f2a-08de68b1fcd6
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 14:37:59.6449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HXnzYMPqsa26fTAG8Fd6PxcmqqomFE99lnn1Tc+1hppPrIhvmoAry1afd0t9SlwARpH5hhFlKtAEpTtQ6oX93Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6514
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,Mac.lan:mid,citrix.com:email,citrix.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[lists.xenproject.org,xen.org,kernel.org,epam.com,arm.com,amd.com,raptorengineering.com,wdc.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 040A911BF7F
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 03:45:37PM +0100, Jan Beulich wrote:
> Extend commit 1df11ccceb1a ("symbols: check table sizes don't change
> between linking passes 2 and 3") to other ports as well.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Do you know whether the risc/ppc builds in the CI are OK after this?

Thanks, Roger.

