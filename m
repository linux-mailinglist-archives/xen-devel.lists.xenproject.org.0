Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D3751455E
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 11:24:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317064.536216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkMra-00049u-Dm; Fri, 29 Apr 2022 09:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317064.536216; Fri, 29 Apr 2022 09:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkMra-000485-9Q; Fri, 29 Apr 2022 09:24:34 +0000
Received: by outflank-mailman (input) for mailman id 317064;
 Fri, 29 Apr 2022 09:24:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H4Mb=VH=citrix.com=prvs=111705440=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nkMrZ-00047z-0r
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 09:24:33 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2acdb368-c79e-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 11:24:30 +0200 (CEST)
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Apr 2022 05:24:22 -0400
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by SJ0PR03MB6600.namprd03.prod.outlook.com (2603:10b6:a03:389::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Fri, 29 Apr
 2022 09:24:20 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::159a:f6a4:c03:227a]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::159a:f6a4:c03:227a%5]) with mapi id 15.20.5206.013; Fri, 29 Apr 2022
 09:24:19 +0000
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
X-Inumbo-ID: 2acdb368-c79e-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651224270;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=HdFr8Kc9VqJtpgK/0qyp9Qiw85M3ULywxuFXxlSrkPo=;
  b=UgB83aCP2tagwc1cmsa2efA53FS79LwrxCFMqok5V5NQtt9oEz+5dyyc
   EYqQlc9dkmHm71jcCtkwd53j+XjrpeSI8eXHQEO6jUMMnsiYb4zAG8MLK
   R5rlwUGcs66KPNiy+zBp0BNZNDnLkYAAAV08h/cHf4psmQ2noiZOelsGo
   c=;
X-IronPort-RemoteIP: 104.47.55.173
X-IronPort-MID: 70216186
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YJGmP6DFJauuVhVW/1viw5YqxClBgxIJ4kV8jS/XYbTApD8n0GEBm
 GQYCG6DP63eYDTxf4x2OY22/E0BsJXcz99hQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Jj09Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhQ8
 dl/vq2/TT0bHfeXmOE2eUkbMiVHaPguFL/veRBTsOS15mifKT7G5aUrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t7B8mcGM0m5vcBtNs0rulIEezTe
 Iwybj13YQ6bSxZOJk0WGNQ1m+LAanzXLGUC8QzM9fRfD2774gpQzr/tDufpZuOVHZhZjAHGu
 WbMxjGsav0dHJnFodafyVq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRomyUVs9bK
 kcU0jEztqV0/0uuJvHiWzWorXjCuQQTM+e8CMU/4QCJj6DSswCQAzFeSiYbMYN98sgrWTYty
 1mF2cvzAiBiu6GUTnTb8aqIqTS1Om4eKmpqiTI4cDbpKuLL+Okb5i8jhP46TMZZUvWd9enM/
 g23
IronPort-HdrOrdr: A9a23:l0vuA6B7olVY6FrlHej8sseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEEZKUmsuqKdkrNhR4tKOzOW9ldATbsSobcKpgeNJ8SQzJ876U
 4NSclD4ZjLfCBHZKXBkUiF+rQbsb+6GcmT7I+woUuFDzsaEp2IhD0JaDpzZ3cGIDWucqBJca
 Z0iPAmmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlul9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4oow3TX+0OVjbZaKvq/VQMO0aeSAZER4Y
 DxSiIbToBOArXqDzmISFXWqlLdOX0VmgLfIBej8AfeSIrCNXIH4oN69PxkmlGy0TtegPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59Zs5Vza/pWVFZql/1WwKqVKuZ0IAvqrIQ8VO
 V+BsDV4/hbNVuccnDCp2FqhNihRG46EBuKSlUL/pX96UkaoFlpi08DgMAPlHYJ85wwD5FC+u
 TfK6xt0LVDVNUfY65xDPoIBcG3FmvOSxTRN3/6GyWsKIgXf3bW75Ln6rQ84++nPJQO0ZspgZ
 zEFEhVsGYjEnief/FnkPZwg2LwqaWGLEPQI+1lluhEU+fHNcvW2AW4OSMTutrlpekDCcvGXP
 v2MI5KApbYXB/TJbo=
X-IronPort-AV: E=Sophos;i="5.91,297,1647316800"; 
   d="scan'208";a="70216186"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhePOq1uKf5GQFTAkPcjlS21E8dKpLUBQpkJZqxScpsTm1KjJx5kFLYCcLoCSki/BUcmVHaO1b50of7L7KN9RWHJnhGeZ5aiq5QykcIKDl1JAp0AJx1DBmh7PwA+hBlknl+cUOr8nNSqUu1G6nA10fmyzVsOwKawjfuMazeVg3Wg4xkS+dg+H4GFkiohqghbEpWA+VTgTccY1HLSaH4kneA0SL82oALHS28HuectDa7ce0zigBzG4o3DY0XZ6jE4hutxdkX5J2qwHC75leGLg51BXLwykNyhsxtFBQGICSq/6Hu+bgHDp8Y4P/pbMmRL/h86WAVJktEaL4Ltwqpi3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HdFr8Kc9VqJtpgK/0qyp9Qiw85M3ULywxuFXxlSrkPo=;
 b=fOmap+Q+JxCyPPOgY7RguqyG5EV1UEMmDV1gYo1iahxJyePEf7jI9JzysIJvxKoCsyIRiydFEuUUlRGbQ28U82tXxpcHQPftDHg1Sj/uSwoeGHL4BiTYAB/TsNmSdpR/ebj2bbAbC4WE/glt0ZPDYDm4FwIYPCyg8RhabryIRfDbxRAljBO3MZnRXj2mpbSUXmmAmkLCUrtYWUTnp3nkx7WU5P+RPSPPSgQ1OkqaLcH/r+5s6TAuvgvVY0rD9mdHZl+GeIyiK7RGdeNk1PZM4WgndwGyccJw9Px3RBnt0ZQaIx/3mXN3RXjM19yBF25mYNisdjtL+k8JLOztp4cR3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdFr8Kc9VqJtpgK/0qyp9Qiw85M3ULywxuFXxlSrkPo=;
 b=JNnCCqVpCvoL4QhAnaA1e702CMRMv1hxzz5HNPo57OrX1wUVhoex+0WMhQj8oogY2jGmj3vGnjyyGQer9fB7UIc1hcbgL88rSKwk1DYxN8kJsSfIn7e1BuVcPGGnJhVazARlwMGOa1I27AgmgWCpMKNfJdvPiGqTt7h7TtREEkc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/cet: Support cet=<bool> on the command line
Thread-Topic: [PATCH] x86/cet: Support cet=<bool> on the command line
Thread-Index: AQHYWt1N9h0ywB7VLke90Ph7I2J/jK0FDHAAgAGTo4A=
Date: Fri, 29 Apr 2022 09:24:19 +0000
Message-ID: <1fbac5d6-ac4c-64e3-3201-b3e2165e0100@citrix.com>
References: <20220428085209.15327-1-andrew.cooper3@citrix.com>
 <YmpcKmecShU2Mokz@Air-de-Roger>
In-Reply-To: <YmpcKmecShU2Mokz@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 92a794d7-97e7-49ac-6573-08da29c20a3d
x-ms-traffictypediagnostic: SJ0PR03MB6600:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs:
 <SJ0PR03MB6600195F1CD4C82268CB2514BAFC9@SJ0PR03MB6600.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 AvyVV51BrUw6iNI4y022ER2yKGnwSAtg/1ge7yONWklooqo7cTBVsBSCpV2tcf64xiffLiflUun6+wgBY/4xUowdP1MglAPBuglmqfvB5SEKkzMfDjz443ke7C3lOBBQ/v3o0fzaA1p2QcNjILDOt+u32yopXyjr/GD1oXKX+lFLNIhGAPyk5qFpQA2pEzqCXzD8yBzPVSIDTeoLTwltyNgaEfXO92c+Ra7baCzOvEhumYG86Ud0gAb9ebdITtSLzsBW2VFOclRvRgTfgDtxFFsQ6F8KROWmkpIIvE8tl8hBZmk7Il+wpO6pcxvN9S7X/Qv6OcePksVLHltp1XwH0kzcHafQLqY601ylErdNHT8BVCuNVKs3qdoBC6RU9BzJFt3GQZ+qfr3VwT96YHS6CTMctj5lgZoP2D2gqs7DbsK+3AVsYjv5BmzEtQ7ZTbcf4b0dZc/+aEoG7Kfda+Ds5PMVxTzjlxyEHNDVEeO5JqeulQxF28EZklCrf+SmCOYcgnJ95FDwsAVCuMj/fm9sHiHTHIVB/qd5GndXB7afQ/4xveRFfsxb+M3HxAuO41LB7p5yW66p5py0v2T1V2T/jKcgrmCc0b+1OGSn/F11E+H1VSr5LFou8jEcfe1lhqQqT4W1cr8khQY9MFD4RyKbqt6mpxSJ2oZGLUXHDGAjncEyo6pCYNqNOEagmsanpSaPqO90TKtrXCnESlQiIdBKGTrvAIokK4zQkG0sHixWkX9AcGY5D1PY8Xf6kvRmbxDBglR9EVPH5kIyFBTvWh/PZw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(2616005)(186003)(6636002)(2906002)(31686004)(4744005)(71200400001)(26005)(6486002)(122000001)(6512007)(5660300002)(54906003)(8936002)(316002)(37006003)(64756008)(66476007)(53546011)(66556008)(66446008)(91956017)(66946007)(76116006)(6862004)(4326008)(508600001)(8676002)(82960400001)(6506007)(38100700002)(86362001)(31696002)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M0xzSjdOdlVWc2Q1cjhpUEVjMDJSeFB6OFcyL2tEYUVydytXK1pCbUcwdjls?=
 =?utf-8?B?bnhtY0lIVjFMWURoYVkwT0lQUkZDR2hTN0Z2VzF2WHJIUWUzUkozZHJhV2Vq?=
 =?utf-8?B?eGJINW1kT1g1dXgxeXQ4YWhlZXFBSTEyc0pPcXRKaVdsMXFwOWN5UTdCYnZh?=
 =?utf-8?B?L0F5eEtJNW5wYkU0MGNqOUppajI1Mjkyckhlcko2eTBPeFZST3RFVzAweGlD?=
 =?utf-8?B?TmF0TXErWVNOcFJkK2l2bGNrTjFMK09RUVhJZVMxN1krRmNpRWJSRDFWUkhY?=
 =?utf-8?B?bEZsdkJINVJkeGtXa0xnOUt5a3lhb3FadU5xb3hnNGRlbmVZOFpubDNOUXB2?=
 =?utf-8?B?eW5vcFZEUEFRV1p5ZWFZejRWdmE2Yi9XQitxa05LZWFmQkg2ZS9jSklBVEVR?=
 =?utf-8?B?T3dCTmtFTmIrL1Z0WmNoQTlsenhBb0ZaUW1UNWlXZVVCOGYxemc3ZytPRENa?=
 =?utf-8?B?aWVYOE1CN1Z3enRlSGt5dFpDSHhKWGhXVFJhOUhXQnQySzVXZ3ZmQmdQTCs2?=
 =?utf-8?B?b00yUHEveVNwZk5TdSszY2tCTzROYWx3aWdST281eTBzcWtLSjl0MHNwbk9X?=
 =?utf-8?B?WGRqazQ5R2xXWWZ5Y0xFeWhpcE8yNUwzUkxLL29oYXYyUXk0UkFxWTFCcHlN?=
 =?utf-8?B?N1BXY0RIS01pcUQxdVN6T0RBelVsSWJUbk9ITEpaVE1zTTFMbVBoTmFrSGho?=
 =?utf-8?B?SnJuOEJoNWxMMkhkOEViOXR3QU4xSTBReVdIanduOFFSV1B1VUdvSEZPVW0v?=
 =?utf-8?B?Rm51N0hjNUhjb2hjaVhpSjRpT3p5cDEwNkhlc1Zxbmdtb3Z5WE5QMWV2c0ZG?=
 =?utf-8?B?M2lqVmNvbEJxdGdFMHRvUGMvL25JUzI1bWlOZmhyRXUzWVl2REZiUWs1TW9Q?=
 =?utf-8?B?b3dSYmxITVBqN2YzRHlqeG51bGFaRHkzbGdkbVV4Nmg3RFlSaUZ4YXlqei9k?=
 =?utf-8?B?cGZBdnJpeXhoZlhjYTNDcDNxV2w3cEZVd01nQ3l0aWQwK3c0ZDY4RVNlZUww?=
 =?utf-8?B?UWU2TXhtVGdBRmRqZGdHZDdMMlg4ck92enNOYzByRHFnTDE5NWluV1VGWS9h?=
 =?utf-8?B?YW9lOHkyZlhEVXJOZlRsNXlxR3JZWUpFRDFvQWE0dTVod2RWWDdGeXpqZitv?=
 =?utf-8?B?Y2R4aTZlSWhtVWd5d0tTQ0ljZDZidHlQaVVlNnFMcUlpVGQ5VkhES3dDcGFO?=
 =?utf-8?B?MlFweVk2eDU5TlcxaFNRQldUWkRIOVZkUDAyTHVYcG5NeTF4RUZCajNuM3ZF?=
 =?utf-8?B?UjlPd3NsV3NlSmYyT3hjYSthMkFnNEZMakNUenR1Y29jQ2JPdndDUEhIS2lZ?=
 =?utf-8?B?bVdsVjN1UkNOK3JoV1hBdzFtUi92WVc5UEpWWUU1MjJ6T2psUVFOTnZmaERS?=
 =?utf-8?B?a29oVCt3dVMwK1lLeEZSQWd0bTR6YnMwa1hJWUdsT05KcTBqL2F0Q01XSEhk?=
 =?utf-8?B?WHhpMHRMRDU4ZHRSMFFCbFdudkltdnhoV1NLNUVzSnRuTUZZTVhBU1RsWi9w?=
 =?utf-8?B?M2oxREkvZCtQbGJBYUdOZTFzNHRJSUowVm5DVXlXdlBSL1o4Mno4R0F0aFB6?=
 =?utf-8?B?dGlIbWJGVktEV2hoT1dqOVhCKzhJZkRYVVU0enZkTHU0Yk83VG96ckpIMlIz?=
 =?utf-8?B?UVAraWRkV09zQUg2VFJNeGJPMkt4dEJuS2hjc2Y3c0xvdGZpcEFZcW51bDhH?=
 =?utf-8?B?bHFtVjd0aWZxL1FIUGprM200eElyM0dSOWJHNnFsUDRXVHdhSEVRV1pYZHU4?=
 =?utf-8?B?QitMaUZmL0VYWEh0Y3BvSlMvZG1ucXlaeUZSM2tnU25HZlplWmNrWVpuajBz?=
 =?utf-8?B?cnZUZlRtQkVjN09BQ1lrYmN0ckM1RkZYbW8zMzhKclRnNS9aem1WbVBUSVVi?=
 =?utf-8?B?MWVtWXVITzVCYmpSMlc1NW9TU1dWOSsvcEFUUkFrbTd2djVkYUhDT0V6ajZK?=
 =?utf-8?B?S2g1TEkvVTZJSjk1QnY2YjhKS3llN0Z0U3Irc1ljUkltWVhzN21nT0ZhQytL?=
 =?utf-8?B?clRYNWR3QTdiQitSUXpVZlVXcmdDVUZST3IwY01wMFAzN0UzWnd2d2g1Rks0?=
 =?utf-8?B?WUZOdFprNWVWYzg0eG5seTJFVWFaY1NPZWswVmZWbU0vSWYvOWQyWlR6RWd3?=
 =?utf-8?B?V3lXMG9Pd2NZTm5PeWdjS1pXZldEWVdDRDE1d1k1MlJjSkpUdUxDWkJ3NlNZ?=
 =?utf-8?B?UzBEeDZCaWtBSXNyY1NFcGw3WWdYOFJ1bE1GRmkwUWJzdnhLVVZpWll0NGRG?=
 =?utf-8?B?WVhNWXpPL1BGWDdTRzR0SEJZV1VuTndSUTlldTVueUdBZnNPci96NnF2YmFW?=
 =?utf-8?B?KzY3ZlFkVklxSVl2cFc3eU5UYXpiZDA2cjN6dnJjM3dSb01nMXB6QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E7BAA84EE2A78488F8A360C9208286E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a794d7-97e7-49ac-6573-08da29c20a3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2022 09:24:19.8224
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n/kDwrcE58uzm1OumyF56dbZ+pv7/JpxFO7NWMDHqXdROoo2mvwB7XLaqXD/MqaRQenT+7Jgx+mebKtVhcveZ1IseieWQK/jk1nlQU8kW5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6600

T24gMjgvMDQvMjAyMiAxMDoxOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gVGh1LCBB
cHIgMjgsIDIwMjIgYXQgMDk6NTI6MDlBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+
IC4uLiBhcyBhIHNob3J0aGFuZCBmb3Igc2V0dGluZyBib3RoIHN1Ym9wdGlvbnMgYXQgb25jZS4N
Cj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPg0KPiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+DQoNClRoYW5rcy4NCg0KPg0KPiBGcm9tIHRoZSBpbXBsZW1lbnRhdGlvbiBiZWxvdyB3
ZSB3b3VsZCBzdXBwb3J0IHNldHRpbmdzIGxpa2U6DQo+DQo+IGNldD10cnVlLHNoc3RrPWZhbHNl
DQo+DQo+IFdoaWNoIEkgdGhpbmsgaXQncyBpbmRlbnRlZD8gIEhhdmUgYSBnbG9iYWwgZGVmYXVs
dCBmb3IgYWxsIG9wdGlvbnMsDQo+IHNldCBzb21lIHRvIGEgZGlmZmVyZW50IHZhbHVlLg0KDQpU
aGF0J3MgaG93IGFsbCBsaXN0IG9wdGlvbnMgd29yaywgYW5kIGl0J3MgYWxzbyBlcXVpdmFsZW50
IHRvDQoNCmNldD10cnVlIGNldD1zaHN0az1mYWxzZQ0KDQpPcHRpb25zIGNhbiBiZSBnaXZlbiBt
dWx0aXBsZSB0aW1lLCBhbmQgYXJlIHBhcnNlZCBsZWZ0IHRvIHJpZ2h0IHdpdGgNCnRoZSBsYXRl
c3Qgc2V0dGluZyB0YWtpbmcgcHJlY2VkZW5jZS4NCg0KfkFuZHJldw0K

