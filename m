Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B9051181C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 15:09:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315014.533330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njhPJ-0000zb-I0; Wed, 27 Apr 2022 13:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315014.533330; Wed, 27 Apr 2022 13:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njhPJ-0000x4-EM; Wed, 27 Apr 2022 13:08:37 +0000
Received: by outflank-mailman (input) for mailman id 315014;
 Wed, 27 Apr 2022 13:08:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8dk3=VF=citrix.com=prvs=109ad7ccf=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1njhPH-0000wy-Kg
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 13:08:35 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 217ab2da-c62b-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 15:08:30 +0200 (CEST)
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 09:08:08 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MWHPR03MB3357.namprd03.prod.outlook.com (2603:10b6:301:42::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.20; Wed, 27 Apr
 2022 13:08:04 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 13:08:04 +0000
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
X-Inumbo-ID: 217ab2da-c62b-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651064913;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4a1pylHtIyeLWeqdGrWIC/pytrCE33KvdLSOGCsb71Q=;
  b=FQsh3OXCajQ0LgYKCAtCfIiZ2Z8SfMbDtuJ1mgEN6GqpRcB6UmsA+oq8
   87IO2VRIM+Tgo3k4VaO2BMybTeAaFaUZKFZj8k1gJTWufTYjXLUPkWS9/
   24CBiu1w37AXOeTkL/89gGHY2VrdxLPSw2KhNkPXXxtVXm+0jWtXb+NwS
   Q=;
X-IronPort-RemoteIP: 104.47.66.48
X-IronPort-MID: 70038820
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:XDZQkaDlmVJTExVW/1viw5YqxClBgxIJ4kV8jS/XYbTApDIm3mdUz
 zQXXT/Sbq6PYGrxf4xxPt7l9EIPuMeAndQ2QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Jj3dYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhIx
 u1QtIaRWD4lZKfXocQdVydYFjBHaPguFL/veRBTsOS15mifKT7J/K8rC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6h4B8yTK0nJzYYwMDMYr8ZCB/vBI
 eEebiJidk/oaBxTIFYHTpk5mY9Eg1GgK2UD+ALP/cLb5UDIyBNT9pfLMebFd9yBXP9amku6u
 kv/qjGR7hYycYb3JSC+2nCmi/LLnCj7cJkPD7D+/flv6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDZsH0QhmQsHOC+BkGVLJt//YS7QiMzu/R/FyfD21dFDpZMoR65IkxWCAg0
 UKPk5XxHztzvbaJSHWbsLCJsTe1PitTJmgHDcMZcTY4DxDYiNlbpnryohxLQcZZUvWd9enM/
 g23
IronPort-HdrOrdr: A9a23:4JqGN6r03SlT6D9WTdd5XOsaV5tyLNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXbsibNhcYtKLzOWwldAS7sSorcKogeQVhEWk9Qw6U
 4OSdkYNDSdNzlHZIPBkXGF+rUbsZe6GcKT9IHjJh5WJGkEBZ2IrT0JczpzeXcGJjWucKBJcK
 Z0kfA3wgZIF052Uu2LQl0+G8TTrdzCk5zrJTQcAQQ81QWIhTS0rJbnDhmxxH4lInNy6IZn1V
 KAvx3y562lvf3+4ATbzXXv45Nfn8ak4sdfBfaLltMeJlzX+0WVjcVaKv+/VQIO0aWSAWUR4Z
 7xStAbToJOAkbqDySISN3WqlDdOXgVmiffIBSj8AbeSITCNU4H4ox69MNkm1LimjQdVJsX6t
 M140uJ85VQFh/OhyL7+pzBUAxrjFO9pT44nfcUlGE3a/pXVFZ9l/1owKpuKuZIIMs60vFULM
 B+SMXHoPpGe1KTaH7U+mFp3dy3R3w2WhOLWFILtMCZ2yVf2CkR9TpT+OUP2nMbsJ4tQZhN4O
 rJdqxuibFVV8cTKaZwHv0IT8e7AnHEBRjMLGWRK1L6E7xvAQOHl7fnpLEuoO26cp0By5U/3J
 zHTVNDrGY3P1njDMWftac7hSwlgF/NKQgF5vsul6SR4IeMNYYDGRfzO2wGgo+nv+gVBNHdVr
 K6JI9WasWTWFfTJQ==
X-IronPort-AV: E=Sophos;i="5.90,293,1643691600"; 
   d="scan'208";a="70038820"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmxMecN4vyCjET3oeJMa4Cwf1N/4px9acr0RveskWQhKcrQgxK8E6J5rjHkdXGZLbufYKXIjthGTs+Yi5Fnmhdo5i0tjtmatWCdK5HbyI9vth+oUFIsHWNjkrf40Gt2RFhrcV/6ttRlv4pMT1S8SE2scGzYy3t3M+Dud+tryvUYFrRxjt8c7q68A29CZJXOZ/Xn+jjFXko2tp4ed0b7NSfA5CfyVpl+r64McV/0REWD1ydcuyvAIbEGkz/+jNY8xr4ZOpoVUHSShK8Mrfp1bROr1KRqfI4rqOqTHy8HDNju4Hi+m8L28wKQ+D2fAGkw4HOSAbdaPQvtmbFuNrY290Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4a1pylHtIyeLWeqdGrWIC/pytrCE33KvdLSOGCsb71Q=;
 b=A+h0oLEbfAo7oVbq3Vds6mYR/x2z01VR13aelOZlnE1XgYS2DKmt9YzjMqU9c16CYSOwsOZhXIdasjIyuWo+U64QL9yw6y+398iYJkaIQKdtuS+z+irlnk7CMb64H0qWZV+j+rY1Dnu61pOkkIC3WasOiehGpKe5bml78XJbR1iIWtpdZlgZE5114SEM00jlB/AszHHzDIhq1C26nbUnsy2POMQuzNfeui6JKa4xudMqNWYHfnqyZ28H9XpmwhqVvFlWOZb1z0IReq6w4ihAbF+zhOS98N/XnFpowQtoJrVFh4H0R46AM99zuNWl7YbDKrQhHX/bOPPjKp8CJSC7cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4a1pylHtIyeLWeqdGrWIC/pytrCE33KvdLSOGCsb71Q=;
 b=sUE1RnRXSvYrG6oaqp1a7K9aPX4Fqk6wlaow2IiqlALNbFFKAr83uk7e9eawR15d+qzxDM6sJlPUfoQPqEcgebMpSOydPPacyKkI4mjaYTO3iERaTy623H8faZhs2ryeta4VMHKbNPs3w1s+lgPHA6foQO9cSqrj80TDHcTRySw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH v4 01/21] AMD/IOMMU: correct potentially-UB shifts
Thread-Topic: [PATCH v4 01/21] AMD/IOMMU: correct potentially-UB shifts
Thread-Index: AQHYWH7CdQN8poxboEyKGipqz5RIIq0DvqqA
Date: Wed, 27 Apr 2022 13:08:04 +0000
Message-ID: <00d978cb-be83-79de-ef02-5b6ad1042f52@citrix.com>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <0dec8285-a348-53d4-f9fa-552c7c1c405f@suse.com>
In-Reply-To: <0dec8285-a348-53d4-f9fa-552c7c1c405f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d84f9115-3cba-47da-80f3-08da284ef700
x-ms-traffictypediagnostic: MWHPR03MB3357:EE_
x-microsoft-antispam-prvs:
 <MWHPR03MB33574FB84AB947863FCE353ABAFA9@MWHPR03MB3357.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 mH6NJSbgNvOdKy1nzucJUEORxtPdeLuW/1HIJmkF5HMgmZA8ZcpT3HU6r9Pc+8g7SzK1KZ+KZg1ZlxIiwB1S5KfJ206l9FuHwvE25zYTYYkzWP1SIJ30vTUY1o2hCT6Mi+t/q90gYesxjnWrLP5gPFlzZmaIJ9mSrydekzKI3W7l3TYK/qQYrJy679BLui6PLR8bBK/2T5AGrsO9r+udoOjeqYGdkLTbaJssm9O9apDV26C/spmyUAiGB2YW92cSvfZjROWlu6KDnSCuYyMiCwQMExv7AIibF3sZWwFFH/18dTfrA4SsLLRo0I4KVfhGXfpayjZn+B0fQN9Oi0xQ5iYK1LwOwD/Zp4gz4Xu4TsZbUBSj6/lv/2cqF86Xe2QjznXhXxOdNVPZnjERP53sSMdTq7XABBNA23FRSCAEx3lT8nv4KfNLMkC52OT0XgpG5V7xpxBE/FYyAQIIRw62qenII1us2j/Wlj6SWvLg/jcVZyP0up94XBwEA3mNJby6cPbo+Uh5Avlr3UofpLryEQ+obpU7hcQrnXuzpuIJLEXp8ZpB60pGvGk/LdfWc+5rcmLbiDpkNS3BkbziXz9iH9o/pIEIiEWdsYPdorq5ehyp6v4bcx+Za8bVeo81HXj8CsinCyaSErJ35SuTDms/xpFNdd/bGgbHQQU6RLBcXOXwFNnTaHXgY116YvFTh19Ywxi0c13XpJtuFKo6hk2ImohHObi3SZaNrZ404lnHKSyKzI8rE1hh7t/FA0DqVLyFuFrNnszvLS3cUgGt6bo5nA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(86362001)(31696002)(38100700002)(82960400001)(122000001)(5660300002)(508600001)(6486002)(31686004)(8936002)(2906002)(71200400001)(316002)(66946007)(76116006)(64756008)(66476007)(4326008)(8676002)(66446008)(91956017)(54906003)(110136005)(66556008)(186003)(83380400001)(53546011)(6506007)(107886003)(2616005)(6512007)(36756003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dlNHUElwN2QrVW96WXhTQytGNTVKQTZPNFVtTzVqZnlYVVBwUnhyR2E3WGMr?=
 =?utf-8?B?d2JZMWdmUG1IR2JzNTg3Y1I3dmZoRFMyMGNSejBsNHdtbGMvY1dCLzJyT1hS?=
 =?utf-8?B?VGYrTmhyL08vRlgzYkE4Mm1SL3JIbDFmQ1RNUkFCYWE4SmMrSnJpcFJxb3ZV?=
 =?utf-8?B?Yyt2T1kyT3c5RWNUWVZ2QmFpbXNySUx4NC9OZWpROFVoa0RseW5sWHVvTFlu?=
 =?utf-8?B?VjRLUHBTdm03ZU1ydk14K3hzKzdPVytuYVJ2a3g4bWN6ZWFqVDNFS3JiK2Zq?=
 =?utf-8?B?RzFGWmhmWEVlcU5CS3lzSU03WWN2cXMxK25lcGxxTi9YR012WTZmM1hVVFNB?=
 =?utf-8?B?b2VvUFAvU2pCdEpFaXExZDFKMElsWHR6VEowdjFqUndEeTlmSVNWRUN6ZlQr?=
 =?utf-8?B?MWNET3ZXM0YyU3ZqakdVenFQVXlrQkpldDZyckk0cWtZb3RmZnE4b283Zjl2?=
 =?utf-8?B?QU10Ymg1c1c5dHFVMk0rb29xakhLQWRkdVdwd3VsZFhnQVo0dC96a2h0ZVZJ?=
 =?utf-8?B?QWxWc3liVmxyTWQxczBmMFNMN2xLQjZtc3BxNnFEbk9Ld3Q3Q1NURnFiUEE3?=
 =?utf-8?B?L1VYYjJ0dUsxaEZQQjdrMmp1RXhkWDFtT3hOSXJUY1l6Rmh1aXk2MzFtSjl5?=
 =?utf-8?B?bjdPL0FDcU1SSFNocXIyRjNMVDc0QlppbjNOQVRrZDdtOXQrOS9EMG5RcVBR?=
 =?utf-8?B?SGhQdTNVRkNzczIxSlZDRHZRNzNEbmMrTUdFUkFONGdBRUExN084Si9tUHFM?=
 =?utf-8?B?Q2hMeVp6K3NaZGhtcVFoeVRpeEo0R3dneUExZmNLSWhRcFVzOElIVzNjUzR2?=
 =?utf-8?B?d0dNdkpxM1dwUWhUQVFsVldCREk4ZFF6NU0vcUtCMVlPbXNuOEU0bU1GaVFF?=
 =?utf-8?B?N2Rjd1dYSlhmM2dFQXc0Q1RHaVlReGJJWDdTaGxNQnhNZUU0QzJkc1F0SjhK?=
 =?utf-8?B?V09YSjNYekNPWEo4dGpmcDcyRW5OenA2UkcvWmx6VC8yWENhUUEvWlVQT1pp?=
 =?utf-8?B?djhIUUFGOEs1M3doZDZybU90b2dsRnJ1YU96L2RwZ3ViRlJBUENwVUI4TEZl?=
 =?utf-8?B?dDNwWUFXbzdtRFJJWCszMThueUtTRFpBMEVaSlNMUFB0aHNqTThCVXlFSnVY?=
 =?utf-8?B?V3lYa3BPUW45d3hzMG9iWEJIN2c2djZNdUplOVVHUlVKYzVBV3BGOU9IMEZm?=
 =?utf-8?B?VnZBblphWm1PVnIyQWxOejNyVjM4ajg0RHZuSEZQa0I4SERDVVplYXV5VnE1?=
 =?utf-8?B?V0xiZjh2M1BSbURhRTdEeGw1azNuT0pzd2FmVFcxOTNzQmUzeTg1QjVoNUp1?=
 =?utf-8?B?MjBnenVYaFV5eXZ6VnAvMnc2WkVnSGlKLzIyczgrTWNnVXpxT0lyQ2JtQjQ5?=
 =?utf-8?B?SWF4ZmlJNGpXMU9LK09jQmFFU3BrVzIvMDZZMWxQWThZK3JIOU5rZFhOcUFO?=
 =?utf-8?B?bEJRR1cxOEpuN3RTWDkvL0NyRWVDZm5rWnpMZ3BKdGJ2OTBiM1Jia1VnYlk3?=
 =?utf-8?B?NDZwc3RwTnNQbnZZZmVTVGFzSVd1NCtCL1VLSjF5SDZsUnJsenlBV1pSWmtM?=
 =?utf-8?B?VXZSdTV5d0JlSVJxdnFPcDU4dVF0dFQ4alRGS2JxanlpdGs3T3Z0eHlxYWZu?=
 =?utf-8?B?ZnpESXQ2YmV3ait4Tjh3N2FCVEVBTk03dTRudUVNRkVRSXlhVHN4UlBmMDk4?=
 =?utf-8?B?SkdMV1FLeDhvKy9PQnF5QjF3SmtDUEhOV3RqSnh1djRlSXpMZ21ueGhkRmxl?=
 =?utf-8?B?aXlNQWpQUVdnb1NXbVpLV2tLd3ZxNnM5U09acHZvQjE1WlYwKzFKdWN1b0Nk?=
 =?utf-8?B?eHdQNitLL1JXdzJmdWc5Y1dqeldhakR5cFdKMUN3OElQMU5kMHFyckE0VlJM?=
 =?utf-8?B?ZTEvV09TUzdpYWY2OFZqcVRrSXRlNjFuWDU2NnB1TU1pVGxaMm5IOGRBc2VP?=
 =?utf-8?B?UFIwbmlwMy9qTnhKKzZZNlRoOEJJZWR3QSsyNWNOOG04K293OU9XWU50WWp4?=
 =?utf-8?B?VUd1RTFPZm43aXlOWGsxU2FCMjJ0dUM3Wms2RjVQcUJxeG8wT1dCWGFQV2pl?=
 =?utf-8?B?RFhwK3ZHWVMzRE9UYW5RVEZSWUE0bDdaVDcwUFpPYk91VGdYZzJzWlRKZlRp?=
 =?utf-8?B?ZXQ3VzhIb2gxOUtYbmxIWFJxRHU0QlpPSTlYM2xRZmlMRDIzbWgwUHdnUW9n?=
 =?utf-8?B?aWpwNXRnbW9maW9DVnZudW1QYy9qRlZWdGVWQWxoeng1UU42cTlIVWUvbXJk?=
 =?utf-8?B?b2QyQWt3NWZZcEJETHpJVGxTbGM3blY4djdXanhaYTBWd3JnV1plcFIzMS8x?=
 =?utf-8?B?K2hReGlHZFF6b29tbS9SRGkxZ2xnNlk5U2tXSFFJRVdqQ21BMzFQcDMwZE1G?=
 =?utf-8?Q?cD1Gz1EmWUC6l400=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B33AAE417898FA4792015C0080E1ABEB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d84f9115-3cba-47da-80f3-08da284ef700
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 13:08:04.2599
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ouEw6iKC5YoIuhunIwkw6kJ4RjAa3uZZaqGiIufzVSP346jImiFlQZOpC3IVkBF5QGEy71x4NtSXKrmEIsTLTusGO4ZOxqGruikzoTwAjIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3357

T24gMjUvMDQvMjAyMiAwOTozMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFJlY2VudCBjaGFuZ2Vz
IChsaWtlbHkgNWZhZmE2Y2Y1MjlhIFsiQU1EL0lPTU1VOiBoYXZlIGNhbGxlcnMgc3BlY2lmeQ0K
PiB0aGUgdGFyZ2V0IGxldmVsIGZvciBwYWdlIHRhYmxlIHdhbGtzIl0pIGhhdmUgbWFkZSBDb3Zl
cml0eSBub3RpY2UgYQ0KPiBzaGlmdCBjb3VudCBpbiBpb21tdV9wZGVfZnJvbV9kZm4oKSB3aGlj
aCBtaWdodCBpbiB0aGVvcnkgZ3JvdyB0b28NCj4gbGFyZ2UuIFdoaWxlIHRoaXMgaXNuJ3QgYSBw
cm9ibGVtIGluIHByYWN0aWNlLCBhZGRyZXNzIHRoZSBjb25jZXJuDQo+IG5ldmVydGhlbGVzcyB0
byBub3QgbGVhdmUgZGFuZ2xpbmcgYnJlYWthZ2UgaW4gY2FzZSB2ZXJ5IGxhcmdlDQo+IHN1cGVy
cGFnZXMgd291bGQgYmUgZW5hYmxlZCBhdCBzb21lIHBvaW50Lg0KPg0KPiBDb3Zlcml0eSBJRDog
MTUwNDI2NA0KPg0KPiBXaGlsZSB0aGVyZSBhbHNvIGFkZHJlc3MgYSBzaW1pbGFyIGlzc3VlIGlu
IHNldF9pb21tdV9wdGVzX3ByZXNlbnQoKS4NCj4gSXQncyBub3QgY2xlYXIgdG8gbWUgd2h5IENv
dmVyaXR5IGhhc24ndCBzcG90dGVkIHRoYXQgb25lLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IC0tLQ0KPiB2NDogTmV3Lg0KPg0KPiAtLS0g
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfbWFwLmMNCj4gKysrIGIveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X21hcC5jDQo+IEBAIC04OSwxMSArODksMTEgQEAg
c3RhdGljIHVuc2lnbmVkIGludCBzZXRfaW9tbXVfcHRlc19wcmVzZQ0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgaXcsIGJvb2wgaXIpDQo+ICB7DQo+
ICAgICAgdW5pb24gYW1kX2lvbW11X3B0ZSAqdGFibGUsICpwZGU7DQo+IC0gICAgdW5zaWduZWQg
aW50IHBhZ2Vfc3osIGZsdXNoX2ZsYWdzID0gMDsNCj4gKyAgICB1bnNpZ25lZCBsb25nIHBhZ2Vf
c3ogPSAxVUwgPDwgKFBURV9QRVJfVEFCTEVfU0hJRlQgKiAocGRlX2xldmVsIC0gMSkpOw0KDQpU
aGVyZSdzIGFuIG9mZi1ieS0xMiBlcnJvciBzb21ld2hlcmUgaGVyZS4NCg0KSnVkZ2luZyBieSBp
dCdzIHVzZSwgaXQgc2hvdWxkIGJlIG5hbWVkIG1hcHBpbmdfZnJhbWVzIChvciBzaW1pbGFyKSBp
bnN0ZWFkLg0KDQpXaXRoIHRoYXQgZml4ZWQsIFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0K

