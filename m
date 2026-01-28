Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMvfNdrZeWlI0AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 10:41:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1876A9EF19
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 10:41:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215321.1525523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl232-0005sm-JO; Wed, 28 Jan 2026 09:41:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215321.1525523; Wed, 28 Jan 2026 09:41:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl232-0005qD-GZ; Wed, 28 Jan 2026 09:41:16 +0000
Received: by outflank-mailman (input) for mailman id 1215321;
 Wed, 28 Jan 2026 09:41:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m4J3=AB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vl231-0005q5-2M
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 09:41:15 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b9164c7-fc2d-11f0-b160-2bf370ae4941;
 Wed, 28 Jan 2026 10:41:13 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CO1PR03MB7794.namprd03.prod.outlook.com (2603:10b6:303:275::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 09:41:09 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 09:41:09 +0000
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
X-Inumbo-ID: 7b9164c7-fc2d-11f0-b160-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TPftC9qgS1cSGnEXPlR9q5LWc5KRNx218CYv2N02WlxRFI7U58xJL1t8Oc5xINLEyBbIgMmwrb8Dpr3ZOsB9TgKLUlkZ3yHSk1r7zq1KMBKBMaXbFRyfyBs4rQwuK1ISnK11J+eehioHJ76BKkNjiyijx0JZ2RzvUrUvl2Q+4fDvBROHsVzZkGzdxjxUYXr2Jw97KdeGtixRcmX9mrlP1utiLntfWubFcGzUDJU9Ofd/DaA2yCI1uOm5SzXir1ouTiiVj6H/ERok1dUIm1WTKcL1q75/JmsLjaSxuZKhezQWUkyJHKj2H9h5lUcSOKTtZZ7IhNlem/79n7rQHZ02/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhhRkBIRWleugWgVZyHf5eP9T4PMo6oyFl/6iT22GaY=;
 b=E3rt4hVr2LnpH411qW0RFF27k1mpp+mi9dDCZ3p99ryniDdYHcrSRZNGaGQ5gIKj9IJjajAXZ+dopvCjYnIdsG61qY2w5O15Ceh9alKHO97mYVWzB8mpAx7cfD7LRl5Jt14aPtxlnCCWZnUqyp4CrsVhVfgk9AUJJyiVpH4mUcyHX1sOpG0eZPMWh400/cvT02zpIRqlUskz9zBj5CchowXU10p+PSD1jCH3UB/qLtnuWqf9NpjrgpezYpNSzPwOTK/CjSY9vAuFJ+9738MR1KCO4INrxMuMkJoyx/dL7IiIkkLWK6oOcWqfBt2ERBff3C/qqurP9Vj2C86wryMFng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhhRkBIRWleugWgVZyHf5eP9T4PMo6oyFl/6iT22GaY=;
 b=HvNGk2fT9YpxnQ01ReOF3rJqdt1CGccoahPgVq1/JlIYHEpBlpui2Yk4G3XMVOWkTJasCj1xuwffNtV8JW3FJKQf5F/v8SHKB2cQAWbfOkGViR7bxLBdGPZSTkNdsn9qfzhpNX1pSeltkZYpoalbAAvmzeBe2v0IwJ5xmtf6B88=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 28 Jan 2026 10:41:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH] CODING_STYLE: Establish a policy with regards to
 copyright notices
Message-ID: <aXnZsg9mRD_atvt2@Mac.lan>
References: <20260127182403.141459-1-alejandro.garciavallejo@amd.com>
 <aXnEdQxyevj-wMuv@Mac.lan>
 <DG03YWKDDNUC.1622RXX7ZJUW8@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DG03YWKDDNUC.1622RXX7ZJUW8@amd.com>
X-ClientProxiedBy: MR1P264CA0086.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::31) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CO1PR03MB7794:EE_
X-MS-Office365-Filtering-Correlation-Id: ba0592ce-db0d-423f-783b-08de5e515dff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OERsZTJGSWx6Qi9uV296aGZHNHFzSFZCb2NFYVpIVG9JQVd5Nk1RMlZwWUNL?=
 =?utf-8?B?TkphRk02dThRMldsNitKVmFNVWIzeklwZC9rQ1l4MG5Xc3lRVnRWQjY3blhY?=
 =?utf-8?B?dllKb3RGeW5jSXVVYktTWktKRDdqWjI2b3dWcndNWXdiL085dmJIMURocDF3?=
 =?utf-8?B?bVpHRkkvb2tJbWRaaTBoVGg2RVhJbVdNRnBKVnIxV0psRC9qd2RlL2FtUitW?=
 =?utf-8?B?SDBzRnkwR210aG0vOTdjV1BDR0xTRXZDZWdySlB4MjBrUUU0Z1lYNmNXdGNP?=
 =?utf-8?B?UzhBU0NmQlNTMDcySGtXWmg3RTNxTnc5QXFPeHIrRXdXNVhsTjZhSTRqK0ZB?=
 =?utf-8?B?RHBzK0tYbFRYV3M5dEVaeldDL21lU21nOU5qSkVJN3RLK0tjYmltWU1rZ3lk?=
 =?utf-8?B?R2hiMldKNVVETityUVJ4MTNUbG5EK2h2UE1maVBsTFRpaWNKVVZ4bnJUQWg1?=
 =?utf-8?B?NWdWeS9iZEVGbnVXeWtBTmw3QjBXK3loelRHSVFPN0V2Q0liMmp6UzlMTEZ1?=
 =?utf-8?B?MGJpTTY0cFEzZ0tJYjZJQldhREZDYU5UTVFNV1A5eHo5cUhVMjRpNjVSRmRs?=
 =?utf-8?B?QmR4eDVHTElZVk85VVozUVhOdnFwL21yVGtqODlxSTErSHRYd0cvSm05eFZJ?=
 =?utf-8?B?ZnFtT2F6MVV1Rlp3bTJpR1lpTGU3aVBBTUtLc3Z4elJMRTM5My9tUHFxMkRR?=
 =?utf-8?B?OGM2T2ZJbEZvY2hyVWVkQ1hoRWJJZmo5UWIya3c5UTRzL1FDb2E2Y3BLSHNj?=
 =?utf-8?B?ellRVzhHMVlqK0xwclRYNVc0UjBlSksyL3dUT2JRcXBCMlkrZWhsRXdOV0ZJ?=
 =?utf-8?B?VEI0S09JN1pJNVpWOE9sQ09TdGRZRUVFYndpcHBBUGFIc3JXdG10MldPaUVz?=
 =?utf-8?B?djRlTHBVc2c2SzRCTGZscDRoYkFOcUswQXpCNlB1cS8xK0F1Z0JpMDVybUll?=
 =?utf-8?B?VTNFZ3pUbnVpWTFickJVWlVrN3JjcUd2c3h4VGU3S2FRdDNqTnRVM3R1VGJ3?=
 =?utf-8?B?SFZWc0xveFM5SEc5YU5kUVp2TmRhbG5iVExPbDhQdCtmSGJlbzhJakpaT3Iw?=
 =?utf-8?B?U2xqb05ScFQ0ZGtHMTZJN0VOSU41c0EyT2tTcmxwZkpTbXdINENIK1dNNUZt?=
 =?utf-8?B?T3RhTnpGN0xJSTZYeExmOEdFbm1RWEI2aWEycFY0Q0t6dW1DRFVuMS9Ocnha?=
 =?utf-8?B?bHNHMldDSzMyUWxmOVFEYWdoK25kUFJML3hkTHBsVUZncVlmWDRIL1JrZWhq?=
 =?utf-8?B?QUNwU0VGbnVTMHNyWDFvSjNXSkRoMUI4bHFpempMd2I3K203anIzODIvaXBR?=
 =?utf-8?B?M2JSTTRuaXFlR3pGUWgvc0pDT2RuSG9sZStBWEFUWFkzV2JNWEtSSXlKUW5x?=
 =?utf-8?B?eDV5cmxka2tsUFBRZHJ3WDV3Sm8yQ3orZHJxaGdRS0Q1SXZRMis5M0RZN3F2?=
 =?utf-8?B?ZHoxZlBsQkY1Z2pwa2hSWjFXbFVkWW4zalNhZDBQVU1TbnNTTHZXS1BPVG9q?=
 =?utf-8?B?THZGVjY3ZGtvQ3hrZk5JMVBveEplcklabnZvN0l3YkhOZXVvSDAxZ1EwNkMx?=
 =?utf-8?B?N0htdnVqcmZvSHp4aXFQWjN5bTdiejNXbUxrQ081TU1haGpIdDZOWVczZmEr?=
 =?utf-8?B?cldGSnBWVlN4a2RLMzcrTHcvRjd1UVJCOHJ2bkwrZHB3QktTcVV4OTVVREdK?=
 =?utf-8?B?RFRITUlPWitKN0hQR2RBYmtvQlpJcCtmcmFJbUJuUHJwVjQza0VzdWJkL0pY?=
 =?utf-8?B?bDg5U2JKb3NFQURlR1doNHZhdnA1NklqeHJ5VEFXWjFRZ1R0UTFXY3FkQVVJ?=
 =?utf-8?B?ZFpkYyt5ZG5IWTNNaFN4T1VaTlA0YjRUQncvMVZ6SnBraHJDQzRxemt5T0U2?=
 =?utf-8?B?eXZHUHBOcGIwQkwyeTY1QW5jWTJGOHpiRFAxRHJWdUNMa0F1SmRWWVBGT09F?=
 =?utf-8?B?U2V2NkN4MDFHSE9ad3pFRjZyS0xJNUZJcDRCSzhIbjAwb3dSd1YzODMvZ2hh?=
 =?utf-8?B?K255c0dyWUZSaCt3YXdlTUpPOVVqNGl3KzV5eVJ1N0k1dDZNdHVPWlF2SWE4?=
 =?utf-8?Q?q07XzU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUYvZ1Zhay85b0UzTHF4WkhIeEdXWndNNWM4SmlHSzhMaUx1NGQzY05ESkhE?=
 =?utf-8?B?am5Ccis0cGVxNmRwMlJpbFJvbUVUd1RpdFFsM3NkVFQ2bE1qRWZ5QmRqUWVw?=
 =?utf-8?B?UWIvZ2xCTDZjQ2gzYW9Jb3lBL1U0bGpiZDJTWkErMzI4LzRwYzk0M3hyVFVp?=
 =?utf-8?B?QU1XaWtycndpb1NWRHZuVXI2eXRHWm43M2ZTRmxQdFlBNVdmMFBMaW0wTVNS?=
 =?utf-8?B?RlRwaFRRbDBySGdJWnpiQ2VZYS9hRFk0cS9KZHBvdTlQOTRTa3c1YXF0UnJH?=
 =?utf-8?B?YlFlZVR4WWlDa2w4VlR5eUZhaWNlQUxxYlFkY3ZES3dRRmdad2xMWmk2TUg1?=
 =?utf-8?B?OGgwakdFdmx1V2hCTFprN1YvbFYvTGQyVjQ5ZURyTWliclJ6RGJtNzJ6Mjlk?=
 =?utf-8?B?NzdCemd1KzE2Z05SaENJdG1Pa3pXb2FNb1FJemllRnZucTZ3ajE4Ylh2aDhi?=
 =?utf-8?B?WEpMMUIzVzhUcHpvOThWV0xWaVJ1Wjlqa2NPV3lRY2F1Yy8zUjhEYzZJYUp1?=
 =?utf-8?B?TWxET1dvclcwWEFkNkhpdEludFZTZzExeU1iejY2VzNYNWFxdExpUUI0WjdW?=
 =?utf-8?B?QVdmWDVyeHB1eUNWdHVnRHpHS2U3UU40elM3TGI4TVo3MFJWUW82QW84Ky96?=
 =?utf-8?B?aGxOYllnd1llemlyKzZiaEMxVDh2R1lpUW9VOFNPMmczelE0QlV6MDRjNlJL?=
 =?utf-8?B?VkhsK0RvZlYzaVVKNkhxS0gwcU5kYWp3bUs4TEFYWHk3Y3I4c2dML1ZrdWd2?=
 =?utf-8?B?Vmk2Zmd0K0pVeVNYN1VER2k5VXU5NVFTOEcvemIrM2M0T1gra3RCM0ZvZEg2?=
 =?utf-8?B?enZETWdVTmZTVUFoc2FkcTZSNVJaZ3dhUDBNUTl0dEJKTDlSUUlaNWtlMXhN?=
 =?utf-8?B?ZCtlaDJOeVpRQ1BNSGVoNVR5UFhVSmYrRjNhNUE5TDBhVTQzdmxEajQrMzdF?=
 =?utf-8?B?dWo3TzNhTW9lTGJjakx2UmtabGhHUjcrK0x0Rm9wam9QdUxEbnJhWEN5VnVY?=
 =?utf-8?B?TVlnOHFGSmF6SVIvTFpHRXlhdWRGWjFrWkN1YzNzb28zMkdpa2c2MU1Jc1JT?=
 =?utf-8?B?VmlWNTVnVS8xb1NmVG1uVzhQZW1GQkNKNDZCeE5yTXB5NXE1WjRNVWVBZTN2?=
 =?utf-8?B?NzdJK1dxM2h5RjNQMHVpNkFYU21UVmhSWVhTOWlPYXAxaU5keUN1SEx2T2RB?=
 =?utf-8?B?YnpKMXhIZmNQZitObUp6ZUs1NFdweEZ1TndhUVBQaEQyQ3NZWE1XV3B2dUEw?=
 =?utf-8?B?dW9vdkpzelVIY3QraDhUVXFLSlcrZFRDSEllQnM4dnBYeGxMWXliaFpCdW5q?=
 =?utf-8?B?bDNGdnZtVklnTVZLZXp6QjcvMGlNWHh1eWtUcXNTT3luaDYvTDhWaVV5YVhz?=
 =?utf-8?B?Y1RBV1lSN01SYkdZaitUaFVIamlKWk40bjNJNEFEMkpzM2VlZ1FaR0hhQzFw?=
 =?utf-8?B?TG83UTlUSExuVVZ4amVVcitEVFN2blpiRUMwWmpGcU15enRVbXhQbmhiNHNy?=
 =?utf-8?B?QnVXc0dwd1ZHSlE5bHlnNkJCOENvZGJYSm8xQUlHVW9HY0xzNm54eStrN3VC?=
 =?utf-8?B?elNXQW0vaXdEUEhvRDdGb1NqbWx3UmtDczRwVW1OWkRkNDM1TUdjTm8va2Q1?=
 =?utf-8?B?M1FwV29Nc2ZwSUc5UUFIV1Z4NjYrYVdHOGNtWEwxUHVUMkNKQldTbk5CKzVO?=
 =?utf-8?B?Lzd6aE9sNkI1amFaQ0E5di9wUEtEVm1FVTIwYTR5U2c0bHZYcll4cEFBbCtw?=
 =?utf-8?B?L0JLeE9OYkh4T0Q0L2JzM2N0MktTL0dRZXhLRlB1MnF6S0k4bHZldU5oV2Nk?=
 =?utf-8?B?dzAvQXdaYXVYbERjOHdQWlEyczBadThxQ2ZXNDdmaGxKZTBEL1hZTXZPUGFz?=
 =?utf-8?B?WGxsaVB5UGNPb25peFRVL0ZSd2t2dGJpMVVmMVpiYWpxc3NkSHJqZGpGUzdr?=
 =?utf-8?B?d3RINE5ZbXh0NlFnTmJtanF1OTNkaFQ5V1ZFLytNZHFIbktCMmtqdmVIQS9G?=
 =?utf-8?B?L1QvRmhIUGdTcWx6dVBsQUNKTUR3aXJTdlVJZnZXOUxmSG5ud09rSFgrSmta?=
 =?utf-8?B?aFozNk9iM1Bza2c0S1BqeXQ5U3pSQ3hCZHhmQkI0aG93QVZxVGlReVN2R0g3?=
 =?utf-8?B?dzlieUppcU9GSXVOTE02RjM4TWJQN3loNC9nRkVVNnVxOG1DRG9maWFVNG5P?=
 =?utf-8?B?L0F0RTEzQlpZQWRocW9NWmVETnZ4eHhDQnlDV2plbGlKaytnQVZRaFlQL21P?=
 =?utf-8?B?NkFmcGdzWndwa3JaTU83MHdYeXQrKytScm1ScUcxTEFnbEhqY3ZQZ3p1RUZV?=
 =?utf-8?B?SkIycXNRbXNRYVNkOWxmTFhLWEN0b1dJVDVIcXFBUGYycXNvQ3dVQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba0592ce-db0d-423f-783b-08de5e515dff
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 09:41:09.8651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XHkIPWvR25oIFEyo0Yyd8TBEo8O4pFfnPnTvJwicX7MKENxyXXkooA6AMoAoXNnu5sd4+62tRtkB7jWidXTRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7794
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Mac.lan:mid,amd.com:email,llvm.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1876A9EF19
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 10:18:03AM +0100, Alejandro Vallejo wrote:
> Hi,
> 
> On Wed Jan 28, 2026 at 9:10 AM CET, Roger Pau Monné wrote:
> > On Tue, Jan 27, 2026 at 07:24:01PM +0100, Alejandro Vallejo wrote:
> >> This patch modifies CODING_STYLE to severely discourage use of copyright
> >> notices when their presence is not legally mandatory.
> >> 
> >> Copyright notices are redundant on commit, misleading from the time the file
> >> receives contributions from anyone not represented by such notice, and actively
> >> harmful for attribution by the time the original code is long gone. They are
> >> plain wrong when added on code motion.... the list goes on.
> >> 
> >> All attribution worth keeping is version-controlled through Signed-off-by,
> >> Co-authored and the like, DCO and the cumulative contents of git history.
> >> License banners have already been superseded by the contents of licenses/ and
> >> SPDX tags.
> >> 
> >> Other FOSS projects have already moved away from explicit copyright notices
> >> where possible, and severely discourage their use when not.
> >> 
> >> Apache and LLVM take active issue with copyrighted contributions and Chromium
> >> takes issues with copyrighted contributions not attributed to the project. Some
> >> Linux subsystem maintainers already frown upon copyright notices too, even if
> >> it hasn't reached the point of being a mandated requirement yet.
> >> 
> >> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> >> ---
> >> The actual changes are almost verbatim from the LLVM guideline, but it's not
> >> exact. Wording can be adjusted as needed. I care about the core of the proposal.
> >> Saying "please, drop the notice" on contributions where it's clearly not a
> >> legal requirement, or have the contributor state that it is a legal requirement
> >> and why. For fairness sake for all contributors to the project.
> >> 
> >> I'd prefer taking the Apache approach for new contributions, but I want
> >> some discussions to happen first.
> >> 
> >> Thoughts?
> >> 
> >> Relevant examples:
> >> 
> >>   - LLVM: They banned copyright notices, unless part of a vendored
> >>     components.
> >>     - Links:
> >>       - https://llvm.org/docs/DeveloperPolicy.html#embedded-copyright-or-contributed-by-statements
> >>     - Relevant quote:
> >>         The LLVM project does not accept contributions that include
> >>         in-source copyright notices except where such notices are
> >>         part of a larger external project being added as a vendored
> >>         dependency.
> >> 
> >>   - Apache: They banned optional copyright notices and relegated
> >>             mandatory notices to a NOTICES file that also contains an
> >>             Apache copyright notice. See links.
> >>     - Links:
> >>        - https://www.apache.org/legal/src-headers.html
> >>        - https://infra.apache.org/licensing-howto.html#mod-notice
> >>     - Relevant quote:
> >>         If the source file is submitted with a copyright notice included
> >>         in it, the copyright owner (or owner's agent) must either:
> >>           * remove such notices, or
> >>           * move them to the NOTICE file associated with each applicable
> >>             project release, or
> >>           * provide written permission for the ASF to make such removal
> >>             or relocation of the notices.
> >> 
> >>   - btrfs: They are highly discouraged.
> >>     - Links:
> >>       - https://lore.kernel.org/20220909101521.GS32411@twin.jikos.cz/
> >>       - https://lwn.net/ml/linux-fsdevel/20221026074145.2be5ca09@gandalf.local.home/
> >>       - https://archive.kernel.org/oldwiki/btrfs.wiki.kernel.org/index.php/Developer's_FAQ.html#Copyright_notices_in_files.2C_SPDX
> >>       - https://lwn.net/Articles/912355/
> >>     - Relevant quote:
> >>       Let's say it's OK for substantial amount of code. What if somebody
> >>       moves existing code that he did not write to a new file and adds
> >>       a copyright notice? We got stuck there, both sides have different
> >>       answer. I see it at minimum as unfair to the original code authors
> >>       if not completely wrong because it could appear as "stealing"
> >>       ownership.
> >> 
> >> There's more cases of other projects taking similar stances.
> >> ---
> >>  CODING_STYLE | 18 ++++++++++++++++++
> >>  1 file changed, 18 insertions(+)
> >> 
> >> diff --git a/CODING_STYLE b/CODING_STYLE
> >> index aae5a47ac2..97f80245ed 100644
> >> --- a/CODING_STYLE
> >> +++ b/CODING_STYLE
> >> @@ -24,6 +24,24 @@ license, e.g.:
> >>  
> >>  See LICENSES/ for a list of licenses and SPDX tags currently used.
> >>  
> >> +Copyright notices
> >> +-----------------
> >> +
> >> +Copyright for the code in the Xen Project is held by the respective
> >> +contributors. Because you (or your company) retain ownership of the code you
> >> +contribute, you know it may only be used under the terms of the open source
> >> +license you contributed it under: the license for your contributions cannot be
> >> +changed in the future without your approval.
> >
> > The usage of such direct language here, by using you to refer to the
> > reader / contributor, set a different tone from the rest of the
> > document.  Maybe something like:
> >
> > "Copyright for the code in the Xen Project is held by the respective
> > contributors.  The author of the code is the owner of it as stated in
> > the DCO.  The project cannot retroactively change the copyright of
> > contributions, unless explicitly accepted by all authors of the
> > code."
> 
> Ack for the tone. The particulars of the wording might need tweaking even in
> this version to constraint the scope of "contribution", "the code", and so on.

Yeah, it probably needs even more integration to make sure the terms
used match the rest of the document.  I didn't take much care into
that, as I was writing this in the email reply and didn't have much
context.

> -----------------
> 
> I have the same question for you I asked Jan elsewhere.
> 
> There's 1 question in 2 forms I'd like to have an answer to from a core
> maintainers.
> 
> Would you be willing to ack a change along these lines?
>   1. to a Copyright Notice policy within CODING_STYLE.

I'm fine with that.

>   2. to the relegation of existing notices to a NOTICES file in the style of
>      Apache. Apache in particular mandates the file not be touched unless
>      absolutely required for legal reasons.

Hm, that might be more complicated.  I am however not a lawyer, don't
expect the rants below to have any kind of legal base.

What about the public headers in xen/include/public?  I don't think we
can just remove the copyright notices from those files and place them
in a top level NOTICES file.  Then OSes would copy the headers
without the NOTICES file and end up effectively dropping the original
copyright notices.

Also, what about people importing files from Xen into different
projects (apart from the public headers)?  If we remove the copyright
notices the imported files won't have them either, and people is not
simply going to pickup the top level Xen NOTICES and import it into
their project?

How does Apache deal with people importing their code into separate
projects, do they mandate the NOTICES file to also be included as part
of any code import?

Thanks, Roger.

