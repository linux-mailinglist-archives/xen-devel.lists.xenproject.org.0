Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3A66D5D95
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 12:34:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517811.803662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdzZ-0004Hn-Df; Tue, 04 Apr 2023 10:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517811.803662; Tue, 04 Apr 2023 10:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdzZ-0004Fi-A8; Tue, 04 Apr 2023 10:34:21 +0000
Received: by outflank-mailman (input) for mailman id 517811;
 Tue, 04 Apr 2023 10:34:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjdzX-0004Fc-PX
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 10:34:19 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4008d808-d2d4-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 12:34:18 +0200 (CEST)
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2023 06:34:14 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB7152.namprd03.prod.outlook.com (2603:10b6:a03:4d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 10:34:11 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 10:34:11 +0000
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
X-Inumbo-ID: 4008d808-d2d4-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680604458;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Z2Wc7JsRF9HraoVD2sOHIDwXVyvrEyRv6dD3C/bsKWc=;
  b=Qcnom77GNv107goEZSn28eN5UKY6vt7jB3gfddXUYl/Jm17iXk2evY0t
   DCQQqJTnx0+WX+rlnPGwfBaO7/OF+bTSa8DThztSrhFFECVCfkJTqffb0
   Nqt/d5dSa7cT7s+l6fCdnR2ZC3qE90+TxWAUtGwY95R/HLALHt9Jvufau
   U=;
X-IronPort-RemoteIP: 104.47.55.174
X-IronPort-MID: 104166344
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FHiTMqjcwEtLIImMS//a+f8uX1614xEKZh0ujC45NGQN5FlHY01je
 htvXWnSOKyLZDH0KNh+bo619U8OvJ7Qx9ViHgNurCBmFy4b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT4AeCzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQEFiorTi+It9uwmpuDVPJ3huB7Bc70adZ3VnFIlVk1DN4AaLWaGeDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEsluGybLI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeXkr6A02wHProAVIDg/WkXrrseTsFenC4NeJ
 Xwa5wAAobdnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8ry62OCUTBX8PY2kDVwRty8L4vIg5gxbLT9BiOK24lNv4HXf32
 T/ihDc6r6Uei4gMzarT1VrKmS62r57FCAs8/BzKX3mN5xl8IoWiYuSA91/f6vpRKZeDeVOIt
 nMEhsu24fgHCNeGkynlfQkWNLSg5vLAOjuMh1dqRsMl7270pCLlep1M6jZjIksvKtwDZTLif
 E7Uv0VW+YNXO3ypK6RwZupdFvgX8EQpLvy9Pti8UzaESsEZmNOvlM22WXOt4g==
IronPort-HdrOrdr: A9a23:S5DihqBl3tUle2DlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-IronPort-AV: E=Sophos;i="5.98,317,1673931600"; 
   d="scan'208";a="104166344"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/l62gojXGd1eAiq9ylUwiU2Zhu7qtUCLDHvZNeQAW82Zw8efMJzaVJ5OmdvVz/7PBoP2XHg7GWUTJ/EZgFBoO5XoyvMdxS0FgvpmThWhFAoYGnRb+e4EprW2sQml1w2JIodzGZQiTpV4vJ7yId4nIFl3On/a1IsuLZP3hUyTrit5wYasz0xb6pDtYl4w8JdXE8d8OjzBG1u7zyxahhjIDup5Y395fmS9aLVUXQTMCas8mfGRRxFp68LGriLETNK2DF9ESF1hZE1edTYJAm2rfTqvTxcBBxpQki7PAZg02V3A0s8FxddaIbBvG3HDsbJwrTljpHwXa/1wHrQnCNBog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XksOnesjBMGLFJg6HigPvb/LKfQp1MR2TWqNugXsJlo=;
 b=ULbfhGkchc5+zdXVg12PDH25wKV+MJ1dSJQ7vhk1rds0i5nxYQvQeSv0XnvlB+8GZMTe1kB1V2vKWRBTWdKNYNIn74/XRSgjRlShe6l0j1YDFBd9BBDQoZcmetQRRynqh2YIJvAZan1cqxXh2waPASNdDW4BPSjV6q7nR8WztcQShGBDV19AyEFLmvrlQY9DDoQ3tSNMEJb1IsWH9qpXSTbJbv2IIFTRSbOPKI7voIrGtic6BHCxOqYe8scjWETJO7WUm/phE5BvBAkD4TMXBJtnx0J3KdKbty5NtOKnzSn3TwtTZGdIgbMk9eLn17GT5jEJA90O4G/pu5qsjg3C3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XksOnesjBMGLFJg6HigPvb/LKfQp1MR2TWqNugXsJlo=;
 b=Lf/+hqYuoIO+5Fq88iV8VZ+VHJHxyp+keBQroAmM9UNZZ6GQI8oGdfZ4yJ1zW3Vy+UNWPgdYz1b8Vt12ZNBdL+edQ7wo2wGY9XuSnnlySCQKPgsdu763SFrzY7QFXpRmFciTxTCfvOgnhtD1aOmm7kxt8iK47VdgXd8XiSb1rlQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6c5cdffa-f3fb-8f40-c44f-ad7431451929@citrix.com>
Date: Tue, 4 Apr 2023 11:34:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] cmdline: document and enforce "extra_guest_irqs" upper
 bounds
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <54e126fc-484b-92fa-ce66-f901f92ec19c@suse.com>
In-Reply-To: <54e126fc-484b-92fa-ce66-f901f92ec19c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0487.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB7152:EE_
X-MS-Office365-Filtering-Correlation-Id: 458fd087-1ea6-434f-a4ba-08db34f8207f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F1QKM5MZrDkhU5DpVh/Mw52NTOEOCmgK23txuc6CBKTEuy0i+V4SKL6HVjHCgN65cAQ8nLMIimn760P8KXStPNX21JO0MPnutMwVtel7rDcCN955nyTncSRhxO1r635wy0CIZf3I2ki4jme1H/8y/4pUK0hEDnJd/zH3Xn1lWHFbPbtw7LD0n4ZzsPz9GIMFiOLw4rGC0s7jUZbK4UPQmrj0XW8dIeWqgkbQlHYVtwz3w9tmfSkwvLgKyiIDEtcPTtUYJq4v8lFsyQUGxtwJP6znJ+s+DfrpwZCTeRJm76p4QJkqme60agbXRY/Fn1ieqHAzLv/4Ev7po0ld2XLxZOM/QyZi+hRCM8SK/XVIctWunLwxFiM38yqW9YhzBKXoZzvsWs1CwN9e85WtpTbKR9ay7rXPftenGqWpNwmUfbsAybX1c2sitaKnATMAcUX3tffG+29+m+4aO7+b0cLLX2FZXtfRAhpsKVH8XHRk+c4a3QtzaGHnKwwXG3B+M28v0Pkb7NvrLXgkALYi+O0eeT8bgVoep9cKeINb4eBPQ494r3WQfk9rJZB3MwOejE43ovoJwXuGou/Owx7i9Nbyp0HB84HA5MUrfqvVivGXJXNIA4dUdsyFh1HL0Tag8IwJPRckOFZwEw9/LROL7kxPWA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199021)(5660300002)(8676002)(41300700001)(110136005)(2906002)(8936002)(31686004)(66476007)(54906003)(66946007)(66556008)(4326008)(478600001)(316002)(6666004)(6486002)(83380400001)(53546011)(36756003)(6512007)(6506007)(26005)(82960400001)(2616005)(186003)(86362001)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEtUbDQwdlcyTGdTcHFBRjZsWGxzNSt5MzNyRkRTcWR0NGhFWnZlRVBSbnFO?=
 =?utf-8?B?cVFRT1RwbS9PWlNaT0lhanhOM29VTlNNc1RtVVZmQ2JadE1nbzhVTUFFeE9k?=
 =?utf-8?B?bVNDSEVUN2o5UDI0VEQya0hFUzhQZmJYaVJUUUdiRWh2SnBKaFBFeUVpdFBp?=
 =?utf-8?B?QzFSSFZVaWsyRXlpYWNLSGdBZWM3SnV0Z094T1JuUWN0UWY4Y2pHbkNQZjRP?=
 =?utf-8?B?Sk5DMFozY0ZZNWhOVHl1V0M5SnVzSFZTRWRlajZJUURPd1MrbGZwZkhSMHo2?=
 =?utf-8?B?YVZXbTdRTE9adlJUVU5VSmxXNEc3dHRBdElLTlNlZW5Zb3dFRGR5R2Q2Qk1M?=
 =?utf-8?B?U1pNbnBoUVlvNlZWVi8yaTJmREtpYVlIb01UQ251WWp6bWphMkRURUxaTVl3?=
 =?utf-8?B?WEM4Q1BtZW9pdVFiVzlJV1NJcHUzZ0tDaXg3bm5NcGJacEtjV3pHbnRwZy9n?=
 =?utf-8?B?RHZqUVl6a3B1cWpUeEUzQjNiV0N2UkQzVVg0OFE4czNxRXZ0cEw2RUJ6Zm1x?=
 =?utf-8?B?RGJ3VERYajB4dDhadDBUdDJ5dFZaU3dRRHoyQ0dtSmg5TGFVZERhNTFBcWww?=
 =?utf-8?B?MHFUR3ZVSWN5N2l5MjdraTJwY0F4STNNaXAwZ1RqTUpsT0JFYjJDSzhQUXpo?=
 =?utf-8?B?Z3hDRmV5OTZHUXpWejlXRVpyL1FNZEtFUVM5UE5TK0l1QnprbWdKcjMzSG01?=
 =?utf-8?B?K0ZMeUFpcHJZMjV0ZERnbUcwOUJsMjR1ZkdYaWF4RjY1WWtUZkRrREtSeXlp?=
 =?utf-8?B?UGUvMFN3NjVHQkNKeDNqV0tNR1BKZWpIazlKb0JySmdPd2xhbnJrbzBQcjRU?=
 =?utf-8?B?eWRvRUdHcStnOU5sd3RCSDcySkc4K0owN3ZucWdUb1J0ZENCalh0aWJzM3N0?=
 =?utf-8?B?MGdDSnJVYUYxeE5oa2V1WHpIYi9rR0p4NGxydHVQMC8zdERuRXdiWUpicmp5?=
 =?utf-8?B?Y1hFVVFoR2g4Y1U2Q01ZOEdrcUQ3b2JuZjhuZHM0aFI1ay9laXdPK1V0c2pO?=
 =?utf-8?B?bDU4ZVNhcWFncStVdXdwS0ZlZW5TcjZsOE9nbnRoYm1pak1DUy9TQ1EwTTl2?=
 =?utf-8?B?c1RSWFREdjgweGI4NExUdzNKTkFiQXFuUU1MeHJBWXZ5NUlaTmM5WVNXWk9T?=
 =?utf-8?B?MU9XM3F3dG0xU0FtVDBFUzBxaW16bDFhVU9nVFlSRnY2c0R3di9Kck9SbHo4?=
 =?utf-8?B?S2UvVGFqWVE5QVh2dlFna0dFNkpJSzR4WHpuc1hzRjBKREdtRXpZRmUrQlFt?=
 =?utf-8?B?SkIwT3dadjJCRGFUMCtETFoxZWxmQmlIRU52Q0pQa3RiZUszOVhJNy9FSk1z?=
 =?utf-8?B?ckVDQWs0T05GakFKU1BPQ2QrQTlRSGF5YUVFSG5rMytpeEhoQXFMR0tkL0li?=
 =?utf-8?B?T3ZQNGNHT09YdzRnMUhXTzhhQktSS2RwOGxYenFGRUJwU3NVenpCOEdjUzBh?=
 =?utf-8?B?WHVBaXR2a1BhZDlhZktsVUlOU2hGVy85cEdFRXFFY1VYWk5ZR0dNdk12bW9S?=
 =?utf-8?B?UFRhTFZYQkQ0cHdhM05jdm5adUJZN0ZzMUE4ekRicE0zcHFkNUZCeExTR1do?=
 =?utf-8?B?SklHczFsNEtuc1p4c3lYQzcwY0NUSVNQN3lkbmt0T2JZN1dlQnRlTnB1akVl?=
 =?utf-8?B?ZEhKcEIyVFE1QUlwUWp2R0I0aS9RQ3laOFpTV0xpL2JDL0x1WXhkck1yYjRj?=
 =?utf-8?B?Z3IwQU5IK3VGQkNWeGp4Ym4xaTdOdHV0QklhSFZISThjMGV5ZGhwalhhaTZ4?=
 =?utf-8?B?bjZxOGtkNElReml5TGx1aFZrS2JnR1hVS0NYR0dqTlEzNVZqbEl3RmQvc1hh?=
 =?utf-8?B?SlJkbTBxSHlBZjBOSmltdGlLN3JXV2pFNGw0Y3hUUGZVZGxKaTJwdW5PVzB5?=
 =?utf-8?B?eVBjUDM3YVUzekJ6WjhrZk5YUXhUZ24za1BTaDdrZS9JdmxVV0RNV1JWUTFT?=
 =?utf-8?B?M1BVc1kyY1Y2bkczeDlvQ2ljek5pb3ZDM1FXb3h2Q3F4NmxPUkVpc3BpaWps?=
 =?utf-8?B?NDNxQjU3YVNTWkJnbGhVVU5hUU9Id0FLdHRacVc0UURHMG9qdTRJaldKdTBV?=
 =?utf-8?B?NjZzd0RZNnkyV1NCUXZUTThNelMzSkV0QThLWW5mbGc2VUU4UktrVTlDTE5v?=
 =?utf-8?B?NGxWMWNSeWxha2pmMlA2dWhmeThQVVI4R3A2d25xVGhMT3M2N3FDN1B6VExE?=
 =?utf-8?B?M1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LKESl4Hy3Ni+YXuxlH3+PQ80Hsv7uQx3iXwHmAm9ZQZQ0cAEvBHQyZ+KBZrFgJ4dndqPjjkW220a3XJlsNeIejg37wOwnZSDWvt2Kn/5Bdt2QIvzQPBg91vSmVZG78P4i0aMDIzV1WR6QKZwhe0kEO2IvXReCbOJ7kjguHI6miJiDEnsKNGThNaaUUdE1Wg3LCRCiIsULBrA/PawDdtZNnWpgjrjjZuybb9nuCwze2UTXBqvoKW7gFaaY1RuUUyq1uWZBL2CMzgb8wX+dmzebF8ACoAVdXkqp7M3aLciXuaXYH7zTUU38TC9yWYvIIbqZhkqFK3IjPdwYRoagyouCft4HHXbqN7FfmZ8A02LGvsouzlOHz92TNt49f8m3X3R6r4b92fxt2Y6ROfPrQ4Lp5EDtWqwuTF3c0TGUax+I+UcewOVSCmT2Dre3CGS8XnUkCTSIqozkAoDYCAMv6mCv2XENs1sXg2/Uu3amL0NRZMWC6YFIzuwhEQIbM7FihcF8lncHgak6PQLEXhb4NrHNUMwjNmp65zFxptyf5dJpGQ9h+N1hcIYgUIMd9tGgs0cu7QboMqbL3AMVk3nN/zSQOlS1wxezlEmrDunli22unKAglXMIPPsoCtOgTGmRt4qUvsAqylgMWp8adrQd/kZSEhPMHcI/1DT7fXVNjQ7kBojvOadOFfm6Tw2CY+e3ds2mNNBQvLk47KcIQ+b6pZSTYN1g6+KYtNwJ19OSzvUdkjHUKspUPS2mXnqRFXtQthnWs6vxD9EqQheo/S5GdCWwW+IL9FiCy4wlUPiFZR/uVYC2E/m2DNItQqBDy31LrhV0Yj8BhLISvQakvUMuyD2aldCfsTIk/ir8dKbnkYHWdKv8HuuBSu8oUCNp85uA3dDaRuGMcp+Z4kHmgZsrIjm+g==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 458fd087-1ea6-434f-a4ba-08db34f8207f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 10:34:10.8412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+xzU4aZL46DlngxkUJWNuTvvid6O7tBOR7Ai1wneb9sw/9E4Imz8hrhaykgAKr/50TZ3Ls/ORGXGafbQ7m/oIWiD5LHpyugfcZ5d8bsXXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7152

On 04/04/2023 10:20 am, Jan Beulich wrote:
> PHYSDEVOP_pirq_eoi_gmfn_v<N> accepting just a single GFN implies that no
> more than 32k pIRQ-s can be used by a domain on x86. Document this upper
> bound.
>
> To also enforce the limit, (ab)use both arch_hwdom_irqs() (changing its
> parameter type) and setup_system_domains(). This is primarily to avoid
> exposing the two static variables or introducing yet further arch hooks.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Instead of passing dom_xen into arch_hwdom_irqs(), NULL could also be
> used. That would make the connection to setup_system_domains() yet more
> weak, though.
>
> On Arm the upper limit right now effectively is zero, albeit with -
> afaict - no impact if a higher value was used (and hence permitting up
> to the default of 32 is okay albeit useless). The question though is
> whether the command line option as a whole shouldn't be x86-only.
>
> Passing the domain pointer instead of the domain ID would also allow
> to return a possibly different value if sensible for PVH Dom0 (which
> presently has no access to PHYSDEVOP_pirq_eoi_gmfn_v<N> in the first
> place).
> ---
> v2: Also enforce these bounds. Adjust doc to constrain the bound to x86
>     only.
>
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1130,7 +1130,8 @@ common for all domUs, while the optional
>  is for dom0.  Changing the setting for domU has no impact on dom0 and vice
>  versa.  For example to change dom0 without changing domU, use
>  `extra_guest_irqs=,512`.  The default value for Dom0 and an eventual separate
> -hardware domain is architecture dependent.
> +hardware domain is architecture dependent.  The upper limit for both values on
> +x86 is such that the resulting total number of IRQs can't be higher than 32768.
>  Note that specifying zero as domU value means zero, while for dom0 it means
>  to use the default.
>  
> --- a/xen/arch/arm/include/asm/irq.h
> +++ b/xen/arch/arm/include/asm/irq.h
> @@ -52,7 +52,7 @@ struct arch_irq_desc {
>  
>  extern const unsigned int nr_irqs;
>  #define nr_static_irqs NR_IRQS
> -#define arch_hwdom_irqs(domid) NR_IRQS
> +#define arch_hwdom_irqs(d) NR_IRQS

I know it's not your bug, but this ought to be (d, NR_IRQS) as you're
changing it.

>  
>  struct irq_desc;
>  struct irqaction;
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -2665,18 +2665,21 @@ void __init ioapic_init(void)
>             nr_irqs_gsi, nr_irqs - nr_irqs_gsi);
>  }
>  
> -unsigned int arch_hwdom_irqs(domid_t domid)
> +unsigned int arch_hwdom_irqs(const struct domain *d)
>  {
>      unsigned int n = fls(num_present_cpus());
>  
> -    if ( !domid )
> +    if ( is_system_domain(d) )
> +        return PAGE_SIZE * BITS_PER_BYTE;

System domains never reach here, because ...

> +
> +    if ( !d->domain_id )
>          n = min(n, dom0_max_vcpus());
>      n = min(nr_irqs_gsi + n * NR_DYNAMIC_VECTORS, nr_irqs);
>  
>      /* Bounded by the domain pirq eoi bitmap gfn. */
>      n = min_t(unsigned int, n, PAGE_SIZE * BITS_PER_BYTE);
>  
> -    printk("Dom%d has maximum %u PIRQs\n", domid, n);
> +    printk("%pd has maximum %u PIRQs\n", d, n);
>  
>      return n;
>  }
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c

... just out of context here is the system domain early exit from
domain_create().

> @@ -659,7 +659,7 @@ struct domain *domain_create(domid_t dom
>              d->nr_pirqs = nr_static_irqs + extra_domU_irqs;
>          else
>              d->nr_pirqs = extra_hwdom_irqs ? nr_static_irqs + extra_hwdom_irqs
> -                                           : arch_hwdom_irqs(domid);
> +                                           : arch_hwdom_irqs(d);
>          d->nr_pirqs = min(d->nr_pirqs, nr_irqs);
>  
>          radix_tree_init(&d->pirq_tree);
> @@ -771,6 +771,8 @@ struct domain *domain_create(domid_t dom
>  
>  void __init setup_system_domains(void)
>  {
> +    unsigned int n;
> +
>      /*
>       * Initialise our DOMID_XEN domain.
>       * Any Xen-heap pages that we will allow to be mapped will have
> @@ -782,6 +784,19 @@ void __init setup_system_domains(void)
>      if ( IS_ERR(dom_xen) )
>          panic("Failed to create d[XEN]: %ld\n", PTR_ERR(dom_xen));
>  
> +    /* Bound-check values passed via "extra_guest_irqs=". */
> +    n = max(arch_hwdom_irqs(dom_xen), nr_static_irqs);
> +    if ( extra_hwdom_irqs > n - nr_static_irqs )
> +    {
> +        extra_hwdom_irqs = n - nr_static_irqs;
> +        printk(XENLOG_WARNING "hwdom IRQs bounded to %u\n", n);
> +    }
> +    if ( extra_domU_irqs > max(32U, n - nr_static_irqs) )
> +    {
> +        extra_domU_irqs = n - nr_static_irqs;

Why the extra 32 here?

> +        printk(XENLOG_WARNING "domU IRQs bounded to %u\n", n);
> +    }
> +
>      /*
>       * Initialise our DOMID_IO domain.
>       * This domain owns I/O pages that are within the range of the page_info
> --- a/xen/include/xen/irq.h
> +++ b/xen/include/xen/irq.h
> @@ -173,8 +173,9 @@ extern irq_desc_t *pirq_spin_lock_irq_de
>  
>  unsigned int set_desc_affinity(struct irq_desc *, const cpumask_t *);
>  
> +/* When passed a system domain, this returns the maximum permissible value. */

This comment is technically true, but it probably doesn't want to stay.

~Andrew

>  #ifndef arch_hwdom_irqs
> -unsigned int arch_hwdom_irqs(domid_t);
> +unsigned int arch_hwdom_irqs(const struct domain *);
>  #endif
>  
>  #ifndef arch_evtchn_bind_pirq
>


