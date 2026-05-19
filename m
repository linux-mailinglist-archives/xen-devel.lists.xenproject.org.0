Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gL1qEe0SDGoZVQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 09:36:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EADB579308
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 09:36:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312473.1582563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPEzf-0004iP-UF; Tue, 19 May 2026 07:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312473.1582563; Tue, 19 May 2026 07:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPEzf-0004g3-Rb; Tue, 19 May 2026 07:35:59 +0000
Received: by outflank-mailman (input) for mailman id 1312473;
 Tue, 19 May 2026 07:35:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dongli.zhang@oracle.com>) id 1wPEze-0004fx-JS
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 07:35:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPEzd-00B8lW-VE
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 09:35:57 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dongli.zhang@oracle.com>)
 id 6a0c12db-5cb7-0a2a0a5109dd-0a2a45049582-8
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 09:35:57 +0200
Received: from [205.220.177.32] (helo=mx0b-00069f02.pphosted.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dongli.zhang@oracle.com>)
 id 6a0c12db-1dec-0a2a45040019-cddcb1208370-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 09:35:57 +0200
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64J0bful914005; Tue, 19 May 2026 07:35:25 GMT
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4e6h1suftn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 May 2026 07:35:25 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7)
 with ESMTP id 64J7YnP2006009; Tue, 19 May 2026 07:35:24 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com
 (mail-centralusazon11011071.outbound.protection.outlook.com [52.101.62.71])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4e6f1ffch3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 May 2026 07:35:24 +0000 (GMT)
Received: from BN0PR10MB5109.namprd10.prod.outlook.com (2603:10b6:408:124::23)
 by CH3PR10MB7140.namprd10.prod.outlook.com (2603:10b6:610:123::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 07:35:19 +0000
Received: from BN0PR10MB5109.namprd10.prod.outlook.com
 ([fe80::d9fa:7ad2:804b:bb83]) by BN0PR10MB5109.namprd10.prod.outlook.com
 ([fe80::d9fa:7ad2:804b:bb83%6]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 07:35:19 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=corp-2025-04-25 header.d=oracle.com header.i="@oracle.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-oracle-onmicrosoft-com header.d=oracle.onmicrosoft.com header.i="@oracle.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=sqR5XvwemEPJCCdSjqODNkS+O1pHp5KBn6JxHJTmJeM=; b=
	E+M8rLQ2n/Kejxvo7rGc54kcfzTslGF4gbRHRUQBCC2hop5RE3rOxzbEWB+guZWT
	m3CO3ocU+jWyyXuRfPK6HAFA4UBiuAZqV6OKJBCmDzc1D0NwUP6mpLe4fM8wahIr
	KgiBExarymOGROp8nxzvOxTpWXUEa3ojoEfT9Z7Q5r7WzOi4THJti0ykiZUaA79f
	CExzJUujgVOsPcn8gpwHgUZehaM0nyyKIleIRXNi8jFxSFRS7Q0HPCp+P6ZOdt+Q
	cpzRIs04weDppdMjXUOomopT/+Wea7fsjOS7l9JcdplEx4weTuPamqYBxcX0xxnv
	muHLdJlhG/ho0Zo/SA9HCA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YzPS0vM73LgQ7sSFh9tTqaW98tA04iGHRzEO2cTbEF8qpMuWGo13SqLsnqubNLiAEniXDab/lNiVXZkfpJOXGPEP/EgvYqyGkPTC4yC/wkoq8P4tnEtDZFsJWj+4P43dKZAQ3hTGdZZsQwCqw1O56+m0l8WSnpFZPPb9Iq5FIMXmEXzvxwVRnKJu5MvHR+g5gtqJBXddjRe5alduyr55Yq+8mSAbU9y6Yz9IdWodi54lLR3/zfi6ArLUlic7ras9E2/cRir+A3mcFOAFGpej7Mor8HnSpX7Ulcw1uLfYZQmffs5LmtAcJQNu/84lNWzAiBULKOZdadfBj6aWnO8Ogw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqR5XvwemEPJCCdSjqODNkS+O1pHp5KBn6JxHJTmJeM=;
 b=u9unHoKxHr1ZCaiZzaUzMDIMrxumZWw+CyuqUv1Suon+s8rEBN30WWgvZC9NRBgi9kfcbK3giy0ih0iB9E8QUZagzFqbx2fVC3R7Onux6pczX5/VGxHKN1+pDt/Yjqi/W81QslJ22B9SiYoS4mcD2yr/T2N/SIQaNJARglRzhhCm2raI6tJdlmHSOU/HjZ+eBZu888DVozHJEh2UwxnarmxkD5Vz+IvQmUgEEtqdtuRCKMwtmqHSj9ZGmN9LKn/E3tyTaGjzs95bDYnxxwupl7wavLknLKPd1/JV36Fvl0GuB8GaUM7VPLtzsutcpbxY0il3E6QQIKn0QZyhyZeSTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqR5XvwemEPJCCdSjqODNkS+O1pHp5KBn6JxHJTmJeM=;
 b=CEKl4W1Zo78ZWguvI39QYO2WDl/wUoTS0HFpjyOmJoc6PSbNA3f4Kl8kYcTGcoi4awddnfYIqfS1WTnCalxfL/qJcBRwTp7cRXFa6MQFM5aa3c32mdKMuh9gLzcrUiqVSy3hQvxo6PDRZ1n2EA8DvigSypY89FGjRX12zoX0xHU=
Message-ID: <93e799fd-b661-45f0-9cc6-21823765332e@oracle.com>
Date: Tue, 19 May 2026 00:35:15 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/30] UAPI: x86: Move pvclock-abi to UAPI for x86
 platforms
To: David Woodhouse <dwmw2@infradead.org>, kvm@vger.kernel.org
References: <20260509224824.3264567-1-dwmw2@infradead.org>
 <20260509224824.3264567-4-dwmw2@infradead.org>
Content-Language: en-US
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Sean Christopherson <seanjc@google.com>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Paul Durrant <paul@xen.org>, Jonathan Cameron <jic23@kernel.org>,
        Sascha Bischoff <Sascha.Bischoff@arm.com>,
        Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
        Jack Allister <jalliste@amazon.com>, joe.jin@oracle.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org
From: Dongli Zhang <dongli.zhang@oracle.com>
In-Reply-To: <20260509224824.3264567-4-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0047.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::9) To BN0PR10MB5109.namprd10.prod.outlook.com
 (2603:10b6:408:124::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5109:EE_|CH3PR10MB7140:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d5277be-9ba3-4db6-d9e6-08deb5792d58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|13003099007|4143699003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hVvjA4JH7liMGhrcCajYWvIyXwAbW9os4dpdV2KyMPSUPOil3zzud0EVxEShqZH4XFC4/cYzfp+Oa9nWNhNDVqVOzaZmfIEQN9yS1SpsV3zvAPh3twhQUKZtOivAR4JPP0P1xqBf1MpQp0z1ZtwruazbGnAHBe3vkMKfJOJUX1BQezrg3Np0Uv9k9Bcj6Bc9To0AYf+vC9bVQepjHHe15ylAfhE3bo91LCVnRjPR/ehUEmLjLkdqcXOVNyQKwqO19QSkri6MpJU2J1S433N6Co4dsQEEL5HnfJWBwhErBmsvOMeuwEPTMi2L5hQ4j45OuJL5yr4ayqSSTGzYG+1lzbm4DrSYak5XS+32nWKXwb2xEhCAfWvS9lEFVHXDXgyqW1IB3Vt/h7hvgR6yE76dRGar5Gl0zZV+Z+g0tXKVtbXm8W5UShbrL+wFsclqgtV1p7/FZmD3+Xuq/bbKsWlUR1zHU4af6SHGtElMZ0tRS0ovFKpUdnuw063M+VbZOvPl6sTwoGmW710wLxIU9knydbN335LC0z5KBHw5Uds2Z6zS0OR+7nfGAppBrqgLD7gsVORCMzsvnxsWw4pWuLNuz48BT8w7a4WXAQpStMG/oFmxVVZYDfYRA7HWXWw9P1RagFvtacolNY4F4jzE2Vp0uLGYRp2YZd5PZOaB5fgjs1oOCWuVzbhLBqRRdWgIL5Ms
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5109.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(13003099007)(4143699003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjZWM09CL3crcVQwM0t6Q1NTcnh1N3JLeUxoazRSZXJVU2VFcVNsV2FXM1VJ?=
 =?utf-8?B?c3BtWEtqVzEzM0VaOWpjLzVaa0VaSk9HWFNJOVFMaFMwM3MzS0lVOEhaTExx?=
 =?utf-8?B?OTVmTGhlUGJnNFpUT0xwSGV0MnkyOTA2VUdiNUpUMEdlZDBRbks0eVkyZy9S?=
 =?utf-8?B?QTk2cjJSUGxVWDdWL21iUnFOSE9mQnhBN280bTNPcDVTRlVlQjZGb3I2Lzhq?=
 =?utf-8?B?WWdTZEhNdlpoenkzTHVWUzQ5b1ZTUENWMmRBQXhXN3pXSEF5cG8xM3BlTmYv?=
 =?utf-8?B?bnFHSkUwZlZsaUV1Qk5vL09ydXh4MTNWdjNGY29wYjBITmVBZTdtbldMUkVL?=
 =?utf-8?B?UzFidFM2b3h2Mnh0Z0tRNWNocGRlaTRENWMwRFlxbWpwK3VFZzlDQkJQdDU5?=
 =?utf-8?B?d2RScmVHSGVXK3FEUEc1aXdoeGp1YWRKTzJCUzhpQjIzNXN2SEpJSmlPamlr?=
 =?utf-8?B?L2lYbUhIMnZ3N2RhZ29XeExJYllSTnJudGVHRUpEK25zajNNUVhpdzlTOXJy?=
 =?utf-8?B?WW43YjVRRGtSa3h0RkdjMTVaQ2xKZElmdkFqYTRhdlByMjhQRnF0NWVOc0xa?=
 =?utf-8?B?NDhHOXZsQi8xT0VUNXZEMEU1QzYvRXNMZmZYZ01tRDVyZUs5QnB0dWx0d0Zj?=
 =?utf-8?B?WDA3MDNkYjJtcHd4THFpYVpPV3p4Wmo3TEI5L212THovakNnRFpkTFg0cWhh?=
 =?utf-8?B?WEd2MHZ6MFJLcE1ETjByNC8xVVRGTWg4T1BCTEJZRnN6ZC95S0t5dmhVdy9r?=
 =?utf-8?B?Q0JzSXl6d1laWEdPS0VOYWdhSUVoOWZBWjN3anVFaXVxTDVIWHNycEM3U1l6?=
 =?utf-8?B?d2o5ejVTVEFiV09HZy80Vkxna055RTVMNGh1KzZWSkdKVCtzMVR2Z3hCZUN3?=
 =?utf-8?B?U0tkWmNTUys2b214NHZmSmcxeFRnc3RDbko4alRoaldTVlcrb1J6a1B2SUFD?=
 =?utf-8?B?OXJNa2VPdEdLR2R3SWF5cjc4YytnRnpJejAwNUQrb0FPYzVRQ0VueE9PdHky?=
 =?utf-8?B?NU40Wmw0RjF4TUZML0EwRFJ3a0ZFWmk3WVo0emtYU1F3SDVSc25yaGErT3E0?=
 =?utf-8?B?emxkVDlaYTJjclhaWjcyb1llUGRscmw1UVp3K05id2F4QWJBMTdEVXdXVXlZ?=
 =?utf-8?B?SXdQR2U4OE5TVGVYRmtkaEpCOUJqM1BiT3E0cFpNbWIwZXV5c1Q5WGRZOWtO?=
 =?utf-8?B?anBFU20vYU9Md1VmNTNtYU5xdXRIRUJEKzRTaEVkaUN5dkczc2FQTjhuU1hE?=
 =?utf-8?B?THVkWm1iNkw5TWw1M3lDQU0wdk1KN2U4Y3YxZW05aEZrS2FrSnJlZSt4VGNK?=
 =?utf-8?B?ZzdnRVUxbjRMd3BlZm1IUzd4R0JweXJidjI3NG12VW1lTUVWRW1TSytWNFpG?=
 =?utf-8?B?S2JwcVNwTFRrT0k1bFRBeHpNS0JUNXFwVm5KNEt3ZHpNYkwxRlpGMWNUTXk5?=
 =?utf-8?B?WGNWczZzMHc2R3cvVkdYcFdoRUZ5TVd6clQzc1RRaEsvNTNZaFVINTR2dDFV?=
 =?utf-8?B?RzFEeWcwcm4zM2x5NDBnQW4yVFFRZVlDYzJRV2lxVXg3eGFDZFlIaDJpdWpO?=
 =?utf-8?B?citMbUlnVnJDSWkzaS9Qa2pnVm10T3NCaThtQjB5aFhkajRvaXZpbG9jNFB5?=
 =?utf-8?B?dGpScDQrVFJpTDlzSHJtOHdXVGlaZnovdno3d1RtMWh6RmZwR1BTVXZPZ3R3?=
 =?utf-8?B?V0NqdnlWT1doTmNqeUZabFFyb1YrU3U2M0JLWlRzNit3VHNod2cxa255cno1?=
 =?utf-8?B?T3VwMktLMzV4dnlZNVl0T3BQY3hHRFB3WEhJdUNVZ3NDSkErT2NqSFYzenVq?=
 =?utf-8?B?bkxpS1lPeDcwbCt2QWtBY0JXaGtiUEpFSFZsVzNFOXhJWVJVTHpiRWZCbE9n?=
 =?utf-8?B?R2xPcGw2U3hLbFNqblNLaDBZU3pXSkwvMTlYakJRT1dDWkJRVVBsUnZ4dHpR?=
 =?utf-8?B?QWNmdmwzZ29ZejNrUGRDbnlkN2VaaE9SZUV3ZVRSajczQVd0MjhwY2dJSkdM?=
 =?utf-8?B?V0hrQjEyOStvN2F0Ty9USnZKNHpTeXJRTDFRNTJvTk1TZnd2dXUwRDVLT0FY?=
 =?utf-8?B?TERDekYya2ZxeHYvVHk0RGdISE0zaTBJcmRkM3VmbTI0MVlOVkxVblN2ZUtm?=
 =?utf-8?B?eGY2UHMvY3gxLy9nSlpKckZISHRuU3VEWkJYOWl2V2tYZnd0S2N2UG1uaG0z?=
 =?utf-8?B?L1ViYUVXYXU4NEpFR00zUjFsZWZMVlhFWnNTWkExQ2ttMnlNQ2V6dWFkRERF?=
 =?utf-8?B?MXpwU3cxaS9xbTZnSTd2M1ZYdmNHUkdWVXJTcFFkN3N1SytIcWtoa1JBOXZa?=
 =?utf-8?B?Vkk3b3gvOE5kMElhV2ZuS1hjYUI5L3BzV3Z5V2lhZUxPUUxkeXFQdz09?=
X-Exchange-RoutingPolicyChecked:
	Ik5KDvF04gkfVJPH/GUdU+8dCqZ53U0n8HURFxpxjn2vRmwBNbO2XvoOe3vn0uyq1Q8A0KcnDwqs5EC4WjApFlrO//NyQNktQ3TdqP/hI7Z/u99XVqtZUjutXIpXB4HDc6Dqlbws6cN5xo5sBjrluvweiKLpOKUmc11Pn5Lwv1mAnpCB/TUkjYqlPC2Vd8MDm43AkoVMOFDxanI4MUV2BtlXUzKRK7yeysid4VpYK1GgzRyWDWb5GPrdTAYm9rwNsH7RGDnj6nf/S2WFm7611Sgh5RNxAJr2d6iYGiJPols4HGmwBO0QrxtETu05+cheAPKTmzWE1E7q1aeLff8w5Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EXwswr6Fim/5mSP7c//HLO+9tXedwV9aLiBurEbSxlXI0rDNB7sg6+6uvAPXK3ggD+y1NIjtmr9culmaMjhT7r/dm9frEzXvLTsNNY5RjJ5dIRMC7/X3pqd3mZ4sK7Gn4shGX76uw6SMp8WcKfZWQBxZyF63V6Csf/f1oBLBSy75/GLLHZUMnOEJj/LDEmZq4KXfFKWObBZrMAEpwgSFc/YPCvG/7YaEPsiu2vMTeE9p2hMQh+VaJNWd9bFWvitfyqPRewDGhZgxTMyUBSzEBqSQcpadqzpRdisZBRn5v0I6qHS/fPa90IBbJnqq2Fsl+yJlhSMIrdr0ZLAH82u0sHqM2Imv491C3QN4sbrLtOwNuW8aEsIEFBRLCg7pCgr7eXdyFe8o+jDbwgR+lgrloJdnrzTndRLGljsv0bQmkKgT9HJcxPdfk3UdV/DItxPgkcbBDm90LmYeUdObpTYsHAa/HexEYJs9Z995KR5MyPebG7ZOJWkIPf81fA9XOlzQsm4yUxlgpMMBZQQEE/UH5RoaQXAd9C8x7mHVbKhWt9aK9WAl4h6P1H1MpVB4rTFXDk69eFDiPr/LCo7b2u/W+qTkp2XVVaVysqlqmugurbQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d5277be-9ba3-4db6-d9e6-08deb5792d58
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5109.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 07:35:19.1645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A4wOWKuUS1eMESBChe4QD2YTGhIiFpGhf2n0cjGULtQifNIIPNKFE+i9lWP4A8briC9Urpq01Bl4RkPa44J8zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7140
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2605130000 definitions=main-2605190074
X-Proofpoint-ORIG-GUID: njjRGzj4jrV7Dq1lzpyR1DT_67iOLPa4
X-Authority-Analysis: v=2.4 cv=aoKCzyZV c=1 sm=1 tr=0 ts=6a0c12bd b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22 a=SiqW3_QkAAAA:8
 a=vggBfdFIAAAA:8 a=pBOR-ozoAAAA:8 a=mLnsDVdbAAAA:8 a=VwQbUJbxAAAA:8
 a=yPCof4ZbAAAA:8 a=cWRNjhkoAAAA:8 a=HoIXkeogjgSWeBYbt8UA:9 a=QEXdDO2ut3YA:10
 a=0-oVHmElw7bdUHZZ8WX8:22 a=xnp1pY6zelCj5OLna2To:22 a=sVa6W5Aao32NNC1mekxh:22
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12299
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MiBTYWx0ZWRfX/r9iFmeWgh9a
 ODfEA7rdWTS8JcDl3tg+DEoJs/PxDDvtsECw7HaNBa+VJ7sEa3wVu9Nd09NmfntfLdHnP5l0JzZ
 19DYk8oz1hyCTTbzkHtjiJGp0S7keJmUCVG9PVEE54/0DPxuvnAe9AO6ojMtylf77NRMlaJSQ7w
 HdArtl5j1Wir7S2oa1IHzk0TGC+53VpHaG7SOHeSUpVWd9UVBLcl28MoKuLs9LE5pezFspS4Qvx
 evM4kiSl/fSANzHGNp3gGh50mZ22i5rw3GHW651C9Yx7Ef3uNWDGhsB2KAskQhGLJhOx9Tg0EzR
 4/cFeBB0NYMWVHL1B5pPb/7zTSu9MN8f74XOclhtlbrPDol83dSU9rwHT5SgUtAawTUDiUlEAvG
 L6mgdvmyDb2h2kJw8qfsuEExIQZjBpDY77IoPDb90s8JknR5Q2dWyTENlUGGbyg5Di5dZ+AjWzC
 e8v4c6cnOPNmyt20OTzJV/iWX4RdM6b3/MvTYGac=
X-Proofpoint-GUID: njjRGzj4jrV7Dq1lzpyR1DT_67iOLPa4
X-purgate-ID: tlsNG-ebf023/1779176157-429623FF-F9494337/0/0
X-purgate-type: clean
X-purgate-size: 4478
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dongli.zhang@oracle.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:dwmw2@infradead.org,m:kvm@vger.kernel.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:tglx@kernel.org,m:seanjc@google.com,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:paul@xen.org,m:jic23@kernel.org,m:Sascha.Bischoff@arm.com,m:maz@kernel.org,m:joey.gouly@arm.com,m:jalliste@amazon.com,m:joe.jin@oracle.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dongli.zhang@oracle.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenproject.org:email,amazon.co.uk:email,kernelnewbies.org:url,oracle.onmicrosoft.com:dkim,xen.org:email]
X-Rspamd-Queue-Id: 8EADB579308
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I have encountered below build warning.

Perhaps it is because of PATCH 03?

In file included from ./include/linux/types.h:5,
                 from ./arch/x86/include/uapi/asm/pvclock-abi.h:5,
                 from ./arch/x86/include/asm/xen/interface.h:197,
                 from ./include/xen/interface/xen.h:13,
                 from <command-line>:
./include/uapi/linux/types.h:10:2: warning: #warning "Attempt to use kernel
headers from user space, see https://kernelnewbies.org/KernelHeaders" [-Wcpp]
   10 | #warning "Attempt to use kernel headers from user space, see
https://kernelnewbies.org/KernelHeaders"
      |  ^~~~~~~
In file included from ./include/linux/types.h:5,
                 from ./arch/x86/include/uapi/asm/pvclock-abi.h:5,
                 from ./arch/x86/include/asm/xen/interface.h:197,
                 from ./include/xen/interface/xen.h:13,
                 from ./include/xen/interface/xenpmu.h:5,
                 from <command-line>:
./include/uapi/linux/types.h:10:2: warning: #warning "Attempt to use kernel
headers from user space, see https://kernelnewbies.org/KernelHeaders" [-Wcpp]
   10 | #warning "Attempt to use kernel headers from user space, see
https://kernelnewbies.org/KernelHeaders"
      |  ^~~~~~~

Thank you very much!

Dongli Zhang

On 2026-05-09 3:46 PM, David Woodhouse wrote:
> From: Jack Allister <jalliste@amazon.com>
> 
> A subsequent commit will provide a new KVM interface for performing a
> fixup/correction of the KVM clock against the reference TSC. The
> KVM_[GS]ET_CLOCK_GUEST API requires a pvclock_vcpu_time_info, as such
> the caller must know about this definition.
> 
> Move the definition to the UAPI folder so that it is exported to
> usermode and also change the type definitions to use the standard for
> UAPI exports.
> 
> Signed-off-by: Jack Allister <jalliste@amazon.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
>  MAINTAINERS                                   |  4 +--
>  arch/x86/include/{ => uapi}/asm/pvclock-abi.h | 27 ++++++++++---------
>  2 files changed, 17 insertions(+), 14 deletions(-)
>  rename arch/x86/include/{ => uapi}/asm/pvclock-abi.h (82%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e0b307b2108c..e49676955c0c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14406,7 +14406,7 @@ S:	Supported
>  T:	git git://git.kernel.org/pub/scm/virt/kvm/kvm.git
>  F:	arch/um/include/asm/kvm_para.h
>  F:	arch/x86/include/asm/kvm_para.h
> -F:	arch/x86/include/asm/pvclock-abi.h
> +F:	arch/x86/include/uapi/asm/pvclock-abi.h
>  F:	arch/x86/include/uapi/asm/kvm_para.h
>  F:	arch/x86/kernel/kvm.c
>  F:	arch/x86/kernel/kvmclock.c
> @@ -29087,7 +29087,7 @@ R:	Boris Ostrovsky <boris.ostrovsky@oracle.com>
>  L:	xen-devel@lists.xenproject.org (moderated for non-subscribers)
>  S:	Supported
>  F:	arch/x86/configs/xen.config
> -F:	arch/x86/include/asm/pvclock-abi.h
> +F:	arch/x86/include/uapi/asm/pvclock-abi.h
>  F:	arch/x86/include/asm/xen/
>  F:	arch/x86/platform/pvh/
>  F:	arch/x86/xen/
> diff --git a/arch/x86/include/asm/pvclock-abi.h b/arch/x86/include/uapi/asm/pvclock-abi.h
> similarity index 82%
> rename from arch/x86/include/asm/pvclock-abi.h
> rename to arch/x86/include/uapi/asm/pvclock-abi.h
> index b9fece5fc96d..6d70cf640362 100644
> --- a/arch/x86/include/asm/pvclock-abi.h
> +++ b/arch/x86/include/uapi/asm/pvclock-abi.h
> @@ -1,6 +1,9 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>  #ifndef _ASM_X86_PVCLOCK_ABI_H
>  #define _ASM_X86_PVCLOCK_ABI_H
> +
> +#include <linux/types.h>
> +
>  #ifndef __ASSEMBLER__
>  
>  /*
> @@ -24,20 +27,20 @@
>   */
>  
>  struct pvclock_vcpu_time_info {
> -	u32   version;
> -	u32   pad0;
> -	u64   tsc_timestamp;
> -	u64   system_time;
> -	u32   tsc_to_system_mul;
> -	s8    tsc_shift;
> -	u8    flags;
> -	u8    pad[2];
> +	__u32   version;
> +	__u32   pad0;
> +	__u64   tsc_timestamp;
> +	__u64   system_time;
> +	__u32   tsc_to_system_mul;
> +	__s8    tsc_shift;
> +	__u8    flags;
> +	__u8    pad[2];
>  } __attribute__((__packed__)); /* 32 bytes */
>  
>  struct pvclock_wall_clock {
> -	u32   version;
> -	u32   sec;
> -	u32   nsec;
> +	__u32   version;
> +	__u32   sec;
> +	__u32   nsec;
>  } __attribute__((__packed__));
>  
>  #define PVCLOCK_TSC_STABLE_BIT	(1 << 0)


