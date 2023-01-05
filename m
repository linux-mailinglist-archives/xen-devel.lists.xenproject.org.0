Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D5365EE9E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 15:20:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471944.732000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDR60-0002gy-LO; Thu, 05 Jan 2023 14:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471944.732000; Thu, 05 Jan 2023 14:19:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDR60-0002eB-Hg; Thu, 05 Jan 2023 14:19:52 +0000
Received: by outflank-mailman (input) for mailman id 471944;
 Thu, 05 Jan 2023 14:19:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+KT=5C=citrix.com=prvs=36272ec6f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDR5z-0002e5-G1
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 14:19:51 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02593f81-8d04-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 15:19:49 +0100 (CET)
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 09:19:45 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB4924.namprd03.prod.outlook.com (2603:10b6:5:1f2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 14:19:42 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 14:19:42 +0000
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
X-Inumbo-ID: 02593f81-8d04-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672928389;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+yGZRXvGO+UVpHf9k+TYi2cBP1Ac/eKITtQzNYJkGlQ=;
  b=WeGqc1VmVVuS2Y7cUEmO3lUkM3NC6DJb7BDge9IiHIhQbBanAzXNvs8+
   7sVyQ+dfhRkOFehUGcDGC4jRSl0I9OJGNQuUF1/0kiB4Rx4Z9Xwfg9puA
   B7RxamxMNf+q8+M0zSu7ZQZ5u/k2xfwHMzFET3BlCmy+Y+amBT9GaPDw1
   w=;
X-IronPort-RemoteIP: 104.47.70.103
X-IronPort-MID: 91735738
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:SvxiAKnrRdxr73YIM3eI2bHo5gysJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMXDqPOqncajb1eY1wao+x8EgCvJLUytZjGQNtqCwzFyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkPqgS5AKGzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 f0fE2EBZ03cvbmd55CcZcVTqc8EJ9a+aevzulk4pd3YJdAPZMmbBo/suppf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVk1Q3ieC2WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapDTeLjq6Ex0DV/wEQJEj42bFahk8PhoUC/fspzK
 nU/pAQh+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313qiQhSO/P24SN2BqWMMfZQ4M4t2mqodsiBvKF45nCPTs1oazHizsy
 TeXqiR4n68UkcMAy6S8+xbAni6ooZ/KCAUy4207Q16Y0++wX6b9D6TA1LQRxa8dRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:8cJE46g8U3u9jJtJtR8kelhTFnBQXtIji2hC6mlwRA09TyX4rb
 HMoB1/73TJYVkqNU3I9ertBED4ewK4yXcX2+ks1NWZMjUO0VHAROtfBODZogEIdReQysdtkZ
 1KXINaYeeAb2RHsQ==
X-IronPort-AV: E=Sophos;i="5.96,303,1665460800"; 
   d="scan'208";a="91735738"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XzoHwUik2GVOOmptzIG5rMi4xwNuoXZEa3p72ClICGxDm4wzZO1Tus1ADDJvR6Ht0d1ku2qCLbUiUJm9HuZG498hRXRQWoS613HmOxaV+3XTTUyVBTaTYviAeIk/k9bfutYAQCshJSYTlmr5uu9MytOtDZxshMOW4sRLWUqVytXE7rTdUuh0xn1ZuuEvHYdmUTPKXtIIkoBa95gpSYFHvLaoQMqoroAG68U+kRYTbUUw5eyIPK8CXpBH2ae2Iz2bMbMV6iKfc/SZ9R0MnPTYkpaLBgDyTOdOI0OW4zxjeAT8LW21sYYGaas8So2Yt86vi5dXF/AWiWBw4W69FJVi7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+yGZRXvGO+UVpHf9k+TYi2cBP1Ac/eKITtQzNYJkGlQ=;
 b=AdROlE6D309vvUFefv6kkO+1igeyry1s7hTZZNfcuBhpc+HmbHAESBjuWc4SAXKkv94PJz/zW2j27rHTlSdHz0zBUnw/acZSb9GQQjn/cfZIHyDu8yMFVr/9d417Hk+rtMKuid/OvEjQpDdxMdgFK0C6n6J3d5wlFLjkiI//K3Opow1OAYFn2KtZSttv/4P/EL7QkdYymlaQCD87S8cCpSal4jhQ4BmN66pSbgqJ85PNdLj6NTFaVhX57mZdleGKMDreYTMiqWLzrxf4Pb2rWv5IzW2be+tjhizYEEzGb2Yc96GfBzBTVE9pi6Ip0ebU5ZKttmORYWuU7PrDx7Lc8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+yGZRXvGO+UVpHf9k+TYi2cBP1Ac/eKITtQzNYJkGlQ=;
 b=qSb6hO2wsQq6gNj0WspyOcQdMHIi3q8eBdQRZQr5HOLGU8YyUJE5UjtqhWU+DUbW5O0/+Iptqa562F8dLy+ZUQcAwVR+LCZ2mjK+70gFgmVlcGowXLOxR1ZhEFALUjfOjIgT2BfDaSYArwc3K9W5DdjEGEROwDVJqZPx3crYsKQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 0/2] x86: adjustments to .fixup section handling
Thread-Topic: [PATCH 0/2] x86: adjustments to .fixup section handling
Thread-Index: AQHZIPZlI/g6KVqo90Cr/TLfuVP4Fq6P35OA
Date: Thu, 5 Jan 2023 14:19:42 +0000
Message-ID: <2385cc5f-0680-2ce2-4411-d56df75d2133@citrix.com>
References: <ae3f21f6-6a66-2fe5-9d4a-3f93e6dd64d7@suse.com>
In-Reply-To: <ae3f21f6-6a66-2fe5-9d4a-3f93e6dd64d7@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DM6PR03MB4924:EE_
x-ms-office365-filtering-correlation-id: 3cb2e80f-323d-4994-ef58-08daef27e371
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 hQwRc0j1GL58PpwL+MmfEOPPtToKA2KvqnJRrHPRa5qcyfkrfVHfak6uIRI+6QL1oblI5/+cQ1cLSVJwU6UuCZCA4eKRzLwF1hDfCWq/s9Cyyt2OsNXAp8kZ9MQ1d0Pd+qx35qs8C1w4Np3hmWv3vHNfuUSjALX00ZQ2FmW/FmOOXvZQPdf6mfdFwY6bIznQLlI4ARj+FZPiqFyDvl0r/BCZHFPi/owoMku+vAMSJQJNdJeINXDTZwpM3KjUbCK1pRJfr5MOtGISisVPfD0MMCVVsFvBJPnORFZPBmHCEnTjKO9TEfD8bNIY0jnS7LcAH8t9WcnsPMGGUSnGc5oTgXr9ukd/R6S8+1tFA0rYDEnLBhldOP+Bk8M5Pfxdg8oNbdEis3MK94xz5+m030+MaHz+UvUzPM3bM9mAUMqcGj1kRLU2kTEwnisal1I24vNDp2pvU0szJcsc7TAWC23nTjLlF8Aj9L4wWuM8UiMqfkLIbrCLrWrz2zxm2v0H54d4b8Dj60Vo+jAyeB80tKQTQK9udbZgzpqNaz90QXvm+6T6He0edKZTJohkF0ZV5Hbzcu82X+LrtSlfJu1ycLi/H+ifwDFkQelJOPjebQtkRZx9uFNaHiNG5g9wuxm7yFR3sAy6YxvR6ojIYESr5uERcNi11DPPu3LKQTBloDUH5dZbI4DsoEu/gks+aX1nHg5rKhoF2pF8/UOd1U+yQA99ljzYmwfn3KD+0KDRHrjmFqUcXbbzcvu2Eokp14w3AzJ/Jv8N2oX/aRAjpu5NeJ+hRkdxT58UV89B89B/Tme0S6M=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(39860400002)(366004)(376002)(451199015)(107886003)(6512007)(26005)(186003)(8936002)(71200400001)(83380400001)(6486002)(478600001)(53546011)(6506007)(31686004)(91956017)(54906003)(316002)(66946007)(2616005)(66476007)(8676002)(66556008)(76116006)(66446008)(4326008)(64756008)(41300700001)(38070700005)(36756003)(82960400001)(122000001)(5660300002)(110136005)(2906002)(38100700002)(31696002)(86362001)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?djJXOUkxTTZtK1pUMjdUYy9EdkVJamxiVWpEU0YrTTVVczB0ZzkzaGRlem4v?=
 =?utf-8?B?VXZWV2NlZUFKTlNJM2ovdFMvNjBJYTh3YUZlWUYwYklUMXVWcDg4cE1XWkY5?=
 =?utf-8?B?QXFDYTF3aEF2b2JFSmpibFpVdk9aL3Q1ajBvQ2kza1ZKeDBja1l3YzZXaWFh?=
 =?utf-8?B?NTJDeURYQVMwMGZXc3d1NjNJWUlEWU9zZ1JzTTBNV0hwZjJjMG50OU5xSDRt?=
 =?utf-8?B?ZXYydWxqNkpzWk52ay9FZGluNnFZaFhJNjBYSW1QVVhlTGRkVklDSHlQK3ha?=
 =?utf-8?B?dlM5VGFlekJBT2lBVmw4Z1R2QURYalVxRVcyN2YwYUNJdGxmMXB0M2xUY2VV?=
 =?utf-8?B?VDAzdGw1dFpZQ3gwbkJtZ0tGekJ6aW91d254K0thR0xjc0tBVjlxNy82UGd1?=
 =?utf-8?B?eGU4Z3RKSHRMRGtzWHphZzQ1M0RmVCt5SFhNbEFoR3NoSVY1NXAyNVpMSm5Z?=
 =?utf-8?B?WHB6MFRnczhKblIrcXpoQmttMkwydWhqa0Y5cmlVbE9FYjRVdXVvSUZBdUxv?=
 =?utf-8?B?UHcrS0tvaUdQdE9PRjY4UUg4VUFpclVPNTh1Y1NlVGVhOFJ3aWF0Yy9pUHNw?=
 =?utf-8?B?bjhDUjRYdmJMVGFuU21ZTGx1QUVZZ05GRVhOVEMxS2pzaHY1RThJYVJPRlV0?=
 =?utf-8?B?U3d4T3BON0lYN0RLQlljcEdGSjlRWUJkMktOdWlkMGpzRURPZkhwaFRQUUZX?=
 =?utf-8?B?KzJ4Y1M2WTEwVFJXQUJZL2NyZldSR1YxZzhibUZwVVZZMTRrVXd0YXhqZzBx?=
 =?utf-8?B?SG1YdU5QR0FLaEFiZmVGdmJRY01vY1FFRlhtd3UxdUVVS0djZm5UVE5uR2JC?=
 =?utf-8?B?ajlSVy9IZW8wVVRpc1kvNCtOWHNwczQ3QkVsa1RBVXp3bCtVQ2hncnlQdVd6?=
 =?utf-8?B?YjBrUTZCWTE3czFyRFNUNHZJVFM2aVVmdVMrOHBHdE16UkZHUFVCbUh4WnBl?=
 =?utf-8?B?c3lTeXpOOTdENXhnSmpRSWM1OG9oS2ZyV0hFOHpCQmpaNm8wVVJJM1ZYbmFS?=
 =?utf-8?B?RDlnWHNjeS9LNlRHeDFCVW4zQ0JXR3RnN3ZRcitpNEhWcHh6VDBqeG5KNUFo?=
 =?utf-8?B?YlVDZ3FuT3V2dHpVR2VFSXJWNFJMK2lSRWVoN01FU3RVTG9XYmlHcWkxa2ZT?=
 =?utf-8?B?TUV3ZHJ1N1ZYTXJRL3g2T29SOVpjNEdoMlluVmxyWDJUOHJrY2FvTGNlYi9P?=
 =?utf-8?B?UWxaeXJNOXE1RzczdVZkWjFEcmRWOXdmMjUyTmRTVXVzT3BaSmZwOWp2WjFE?=
 =?utf-8?B?bUVCM1ViTzZaU0ZBYVVCZEZ3YUJWampXQ3pUK3hUdWxIYnNDQ3o4S2tlcXlH?=
 =?utf-8?B?NnhFRGFQSnI1WkNqOGxKUmlIOG1YTndKVkNUbit0UUlkTHUwODFDK3A3czAz?=
 =?utf-8?B?SnlmMlVjTGlJUURLNVJhUlo5QnBEQXdtMGM5WWxBL0NkenkxQzZ2VVJlM2RF?=
 =?utf-8?B?SWgwSTRCM2xkUHhOUXhoaktQTG90ZHlCWWN6cll2azE2czI5OHlkZitiS0tu?=
 =?utf-8?B?eTJmbTFEbEppRmczbkZPcUJZY0d5OVU1c1JBUzBMdDdBN1pDTkptWStKNE8w?=
 =?utf-8?B?YS9sU0hLeWJOSUtESDFBQkRIczBLbkE2eUpKTlE0d1pKVUZmOG1nTDdjNUZw?=
 =?utf-8?B?OGtoRW54Zjg3U08zRmkydnVkNzFhNTFKL3lJNDB0UDdtUXExbWYzblB5dTZs?=
 =?utf-8?B?eDJiTmh0dEV3SEpUNW9SN0hHNGRGT2xZR2lBZzlkcm9PVS9ldTY3MENaS205?=
 =?utf-8?B?SEFLR0tqU1E2azFIS2Jkc0d0dmE4VW5Rc3JLSlV3bksrVkpsWVBpMEdDU0s1?=
 =?utf-8?B?SmFYbDdpd0Q2TlVNK3NEemdjbmJRT09pOWdnbEdHQVF5Vm5EYWNabmhXeFJI?=
 =?utf-8?B?WE82VDZEaHZDS3NjVCtnOUpKWFhneDRxMTU1M08vQ3JKME04SHNHUFA3Zkk5?=
 =?utf-8?B?ZCtGK1hSMGtNV2NsRlNlN2hRcDJWTE1Uc3VDSmRJeUVMbTdzYVBrdm5SZm9K?=
 =?utf-8?B?czdXTHE4eWpLNWt2VEVZZmNBYno3QnBCVjBPa3Jkd29wZ0RGVjVaeEZ1dXBa?=
 =?utf-8?B?dVFOVEJab2owUHJpNVNtS1FaL3FtYjFWaG5xV3JGaTZzQU1OT3BOWnJCNUFX?=
 =?utf-8?B?RFJFZGtVNWpVLy9hWjJtbERHZUcwNFlkUTdjMWRLbld1UWppcVlQdEJiYlVr?=
 =?utf-8?B?MUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8EB551F302AD8546BD280F143C24B64E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ye27i/udrfAaB2JaV24MGVsHHVVcsgWwd9inFkOck8tcTaT0rh05CsjM5C/jNBtXlgd0evdKXnXRmGdIKA3pftmRUrJ4J7tAV2Ly+r8x3rjI3Y4l13MOsfqSAEa7zX8x3banpSVo/rsIQJ/DI7S2TCoR6OX8duFVvQt3ckBYWWhdtcIQ0Lx8nlcRKyQJKM4RXXLSk2eHjBfKXVV8dy+udbOIvJeLRao7SngElIYkzajpgcmEVgSTBpHleQ1o2Umj1QHF60hraFjEPa5o9J1X8BJKI17YcTJcmgx62s1BSPjP+Hm8Erq7Zclmd6v1glNerJ4jYoz8AUPgXo3wodnzg+i5n90I1Ti9QOEjFw1m9FAbjcPZ+PAuwli/7/vXX9u+0fCAqx1xLh9JodlbFMFgBYMiMXt8WQB4PHW4adIcemACqIsUYVVWRWLp7FPEOg8aGG4gRShSx5onYAa4y0f+mKt0aPRJz4Y8KxY5nNlO9k3reGvpf0UujGfNJcMTZomX7MAaQvhwb01OjKwnz6dF+7yB/n1k2cJWRFL/N5nHvoBoEcqbTqcRt8IVRPBbsYljgvePjujTlbJ2OnmHUMImHpXVZHC1umznR28Db8k8ecbZIlchgUcuZGaamUsOibnD2zaafTCh3LxQvKvyOwKpsGVINPRUp/Gadb02seYfLL5va6sz7JKM/lgRz9yQD/wVQcsCMB6DWbCYpwXOXVn8OdD7mYp1D6pHapbu68BSKbIvMElsmxXmsOWhcTjBtce9oqNdnDqSQyucJ/O1ZKGDG1TDbmPcSf3+8gxNXwMkk1EpVaFpZnHQEyBxGaeo4RWw
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb2e80f-323d-4994-ef58-08daef27e371
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2023 14:19:42.4848
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e0wH7PX80qklJj2XrcXnc/0iRC5UMxZh/N8D+gCVXIqT6IOGFhFZPaby4cnL1Uwq9mRghO4Hd5xOUCVsntB2yI0ke+68BnrE0Y1qcrmF7LA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4924

T24gMDUvMDEvMjAyMyAxMToxMCBhbSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IDE6IG1hY3JvaXpl
IHN3aXRjaGVzIHRvL2Zyb20gLmZpeHVwIHNlY3Rpb24NCj4gMjogc3BsaXQgLmZpeHVwIHNlY3Rp
b24gd2l0aCBuZXcgZW5vdWdoIGdhcw0KPg0KPiBKYW4NCg0KSG9uZXN0bHksIEkgd2FzIHBsYW5u
aW5nIHRvIG1ha2UgYW5vdGhlciBlZmZvcnQgdG8gdXAgdGhlIG1pbmltdW0NCmNvbXBpbGVyIHZl
cnNpb25zIHRvIHNvbWV0aGluZyB3aGljaCBzdXBwb3J0cyBhc20gZ290bywgYW5kIGRlbGV0ZQ0K
LmZpeHVwIGVudGlyZWx5Lg0KDQpUaGlzIGlzIGEgcHJlcmVxdWlzaXRlIGZvciB0YWtpbmcgb2Jq
dG9vbCBhbmQgdXNpbmcgT1JDIHVud2luZGluZy7CoCBUaGUNCnVzZSBvZiB0aGUgZml4dXAgc2Vj
dGlvbiBpbiB0aGUgZmlyc3QgcGxhY2UgYWN0dWFsbHkgaW50ZXJmZXJlcyB3aXRoDQpiYWNrdHJh
Y2VzOyBtb3N0IHVzZXMgY2FuIGJlIHJlbW92ZWQgd2l0aCBzb21lIHR3ZWFrcyAoYW5kIHRpZ2h0
ZW5pbmcNCm92ZXJhbGwpIHRvIHRoZSBleHRhYmxlIGhhbmRsaW5nIG1lY2hhbmlzbSwgYnV0IHRo
ZSBWTVggVk0qIGluc3RydWN0aW9ucw0KKG5lZWRpbmcgamFlIGVycikgaW4gcGFydGljdWxhciBj
YW4ndCB1c2UgZXh0YWJsZS4NCg0KR2l2ZW4gdGhhdCB3ZSB3YW50IHRvIGRvIHRoaXMgZm9yIHNl
dmVyYWwgcmVhc29ucyBhbnl3YXksIEknbSBub3Qgc3VyZQ0KdGhlIGFkZGVkIGNvbXBsZXhpdHkg
aGVyZSBpcyB1c2VmdWwuDQoNCg0KQXMgZm9yIGV4dGFibGUgc2l6ZSBub3RlLCBzcGxpdHRpbmcg
aW50byB0d28gdGFibGVzIHdpbGwgY29tcGxpY2F0ZSB0aGUNCmxvb2t1cCBsb2dpYyBhdCBydW50
aW1lLsKgIEFuZCBldmVuIGJ5IHNwbGl0dGluZyB0aGUgdGFibGUsIHlvdSdyZSBvbmx5DQpyZWR1
Y2luZyB0aGUgc2VhcmNoIGxlbmd0aCBieSBsZXNzIHRoYW4gMSBzdGVwLg0KDQpJIGRvbid0IHNl
ZSBzcGxpdHRpbmcgdGhlIHRhYmxlcyB0dXJuaW5nIG91dCB0byBiZSBhIHdpbiwgYnV0IHRoZXJl
IGlzIGENCmZhciBzaW1wbGVyIG9wdGlvbiBJIHRoaW5rLsKgIFRhYmxlIGlzIHNvcnRlZCBieSBh
ZGRyZXNzLCBzbyBhbGwgd2UgbmVlZA0KdG8gZG8gaXMgbWFrZSBleHRhYmxlX2VuZFtdIHZhcmlh
YmxlLCBhbmQgbW92ZSBpdCBmb3J3YXJkIHdoZW4gd2UgZnJlZQ0KLmluaXQsIGF0IHdoaWNoIHBv
aW50IHdlIG9ubHkgYmluYXJ5IHNlYXJjaCB0aHJvdWdoIHRoZSBmaXJzdCBwYXJ0IG9mDQp0aGUg
dGFibGUuDQoNCn5BbmRyZXcNCg==

