Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A41255FA3CF
	for <lists+xen-devel@lfdr.de>; Mon, 10 Oct 2022 20:56:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419322.664103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohxx8-0004D6-JU; Mon, 10 Oct 2022 18:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419322.664103; Mon, 10 Oct 2022 18:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohxx8-00049g-GV; Mon, 10 Oct 2022 18:56:38 +0000
Received: by outflank-mailman (input) for mailman id 419322;
 Mon, 10 Oct 2022 18:56:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ILM/=2L=citrix.com=prvs=2752edee2=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ohxx6-00049Y-Sg
 for xen-devel@lists.xenproject.org; Mon, 10 Oct 2022 18:56:36 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4217313a-48cd-11ed-91b4-6bf2151ebd3b;
 Mon, 10 Oct 2022 20:56:35 +0200 (CEST)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Oct 2022 14:56:27 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB4984.namprd03.prod.outlook.com (2603:10b6:a03:1ea::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Mon, 10 Oct
 2022 18:56:24 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5709.015; Mon, 10 Oct 2022
 18:56:24 +0000
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
X-Inumbo-ID: 4217313a-48cd-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665428195;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0jJ8k2lLFkwvMAqf2glIod6D/ZyiJxjnfdS2+UJFb8Y=;
  b=iRfP+rcXq8o1jeSM0Q1cm1juQKnvIkhLzbZvA6P0Ld7boes8eYD7gDM5
   ZBjnkWjp43QwCi5Ud/EEe2YwW07i1kCCFwO0xs2lApUwMIVGZR0myBkxY
   KRKdgcYSlEIg9sAB4iwKmqBUFbBxA6RJTNxZ5nNbreLDIjlFnsGtwhJ7y
   g=;
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 82042255
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:tUv4W6rp38RRpAF8iFXOrzXuyJZeBmIqZBIvgKrLsJaIsI4StFCzt
 garIBmBPP6IZTOmfIsnaNi+8EgGuZLUyYdrTgZlqn80RXtH95uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYGYpLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4ZwehBtC5gZkPKgS5AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m6
 McEBxMEcDK6m++464K6F9Viqp0NFZy+VG8fkikIITDxK98DGMqGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnUoojumF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNJITOHirKM36LGV7m5IChEofmHlm6fnzRCeYcJVc
 X49/AN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq16bO8vT60fy8PIgcqRSICVxpD3NDlr6k6lBeJRdFmeJNZlfXwEDD0h
 jyP8i43guxJidZRjvvqu1fanziru57FCBYv4RnaVX6k6QU/Y5O5Y4uv6h7Q6vMowJulc2Rtd
 UMsw6C2hN3ix7nU/MBRaI3hxI2U2ss=
IronPort-HdrOrdr: A9a23:ehJTM67ry/cS0jTTKwPXwWuBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qeu1z+853WBjB8bZYOCAghrlEGgC1/qp/9SEIUHDH4FmpM
 BdmsRFaeEYSGIK9foSgzPIXOrIouP3lpxA7N22pxgCcegpUdAY0+4TMHf4LqQCfngjOXNPLu
 v42iMonVqdUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLonys2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlagkEyzzYJ7iJaYfy+Qzdk9vfrGrCV+
 O85CvICv4DqU85uFvF5ycFlTOQiQrGoEWStGNwyUGT3fARAghKRfapzLgpDCcwoSAbza5B+b
 MO0GSDu5VNCxTc2Cz7+tjTThlv0lG5uHw4jIco/jViuKYlGchsRLYkjTVoOYZFGDi/5JEsEe
 FoAs2Z7PFKcUmCZ3ScumV02tSjUnk6Ax/DGyE5y4eo+ikTmGo8w1oTxcQZkHtF/JUhS4Nc7+
 CBNqhzjrlBQsIfcKo4DuYcRsm8DHDLXHv3QSqvCEWiELtCN2PGqpbx7rlw7Oa2eIYQxJ93g5
 jFWEMwjx9HR6svM7z64HRmyGG/fIzmZ0Wd9ih33ekIhpTsALz2LCaEVFci18O9vvR3OLyoZ8
 qO
X-IronPort-AV: E=Sophos;i="5.95,173,1661832000"; 
   d="scan'208";a="82042255"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hcBsX4OlYmRmNJfC3MDsJwuquJ0hGQ5HKFPUL17lWD9RBumhmu/1QSXDXorSH5IJSzcPFdqTdgGJT45+tt3ml6NRIH2KWHXaZ648YTZs+aYftsj2shMMXdlZ9KHS3t0sks+VfHqyEbEaBRoreeim6DmebMHuL5BB1UOIZ5SRiCKLy8ew0/vRv67pUK66onle7Y90lOqgS3VCC+mgnbX1R6uyGBZk6EKSN4ZiBAueQ+V7WcVX7Hg7Dhht0gFwGTQRxy8VCWKTlw0jSdO4Tbd0ePNij7Ytn8g6Zq0ZT4FGHzGuWSTOBXGXckZpR+dOSMGzpIZoIugwUb9PJ28Z7+Gmsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jJ8k2lLFkwvMAqf2glIod6D/ZyiJxjnfdS2+UJFb8Y=;
 b=KL4jB7sVpOLjnvfKTIRSScOfzUQgr1Jeg5dhvHvASYaJWJpMokyAQMR/WsUSzEl1eaNDzbnkMloEerF2VtJV0rX0suL6+04EOmXzYyanQdaYRjNhY9rwhGIzfr7+lH7t7GHC1pdzrATZ6jikoIglPY6+6hqmjgV9sLftsLtE0xKTnnvhxnEuGbK9pJCAt7AKIFn/dIeje4ZSrOiGSxwdeO3CPjdVSBpdN7L0vixnbYczdOyoXkTDN7Cgd5fx++vk2Mukxw2iJ7bJdOvALDvF4YWTMZLXGv2lkpBFp/TcYj52Iap5FtVzo52zhdUHplbvINIZ3Dg5oSx2AFIOL3QwCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jJ8k2lLFkwvMAqf2glIod6D/ZyiJxjnfdS2+UJFb8Y=;
 b=F1qABKEqKclX41koGXpP2VPnNKCVJPi6HCg0vJgK1qlCdJT0j7hSCp4CrkIT7nDm1+qId7FXM06fhK/58L+2e6YXjy6XxhyRYIRVOUox1aO9S9pXQN6tLtUFVOqrr3yiX3iRCZk4Mzj5QYCtIzJz7mqPJogYCrLwOqFZw2Ur1I8=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Henry Wang
	<Henry.Wang@arm.com>
Subject: Re: [PATCH 1/2][4.17] x86emul: further correct 64-bit mode zero count
 repeated string insn handling
Thread-Topic: [PATCH 1/2][4.17] x86emul: further correct 64-bit mode zero
 count repeated string insn handling
Thread-Index: AQHY2YUgg4gsheo4JECtz9+zXlXTaK4IAO8A
Date: Mon, 10 Oct 2022 18:56:23 +0000
Message-ID: <9c407e09-4af8-b021-293d-b1db8a0ca4f9@citrix.com>
References: <4ca86bb6-ca6e-0c6f-448a-55fb73a3c02a@suse.com>
 <1dac86de-cb8c-d2b2-d0ab-bf76707d22d0@suse.com>
In-Reply-To: <1dac86de-cb8c-d2b2-d0ab-bf76707d22d0@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BY5PR03MB4984:EE_
x-ms-office365-filtering-correlation-id: d4f04f96-996c-48af-92f6-08daaaf120ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 970wF+eQAmsC1hXQJjQIviyxq24DcVD1licAG/YEBRE92k9zAkpSFWIfe3sFqmQhREn8KgC88/X0PkFugvDvd0+m2iQ+VkgDRMr33wmJZDwsG9lxuXUDAqAWmmFGEUTavB1QtLCudBBPjB6gRtaGwGRIFsZrlFPAe91GGicFx74Qp5Bz3bZJV3EKWnY38vwYOpWNQzl1ol0rUJOt/BIs4Gz+MLVXGn4qM9dXUkkm1AHeG5Our4hK/psYvxeIra5jxnIiAitLWIg4oWTRAxS2X5WwV5c0JhemuVPOZSYC/Bt/jTzprYt5MK3S+qvyHqRs2U40qCcz3jKFhF9Ll+9eQckrKyqwZW+Po0hJWtGufoqkwGB2epvh8MdEKHR72RGFAtAP4/2RXxYB41l5/C09tn8EZn1EFrks6pfobcKrm1WqezonKHkAqHooCQnooILry3WHOi1sAfSn+VcZ2fl/ijL3jBjDzjYIRWNkxVhUfILMx8LvWN+/VGGdLA80AAVguLCUX0tIH8VpCCSPkHDZQydJ7cwXP7xOjcHJSg7mNyFKTb1pREjUQr94s+HvwATScnZxcuFcu1Z5+PzeFynA9liy8IKQEwuq3U+woE4Xdu3fDUrZe5CjnAIRleRNOB7kExTJO7DPr3n3/xCvVV5FkgGB9e2tWjNCN9H3aLFJL2esalIidGyr5H+FG9wCpm3wjbJzd96jPYjymd1MAerdqbdo7fnMh2yT6P9oaZabtS0ZbH2vMh7U3FH//1azcj/oSeEfWsYUz+wdEzuM+2V3/BxUHSBRdDyOun5ZMRYBS1IhSgIEyOW88PMi4D5BxD6a20bdHMdn/Nhl/eWORmAU9A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199015)(110136005)(31696002)(86362001)(83380400001)(82960400001)(186003)(122000001)(2616005)(38070700005)(41300700001)(66446008)(54906003)(4326008)(53546011)(5660300002)(66556008)(66946007)(91956017)(8676002)(64756008)(76116006)(8936002)(6506007)(6512007)(2906002)(26005)(478600001)(71200400001)(316002)(66476007)(38100700002)(6486002)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Nk9LTGlGN0tGUHJlV1IwZURaZVJ2UkdRdzNac0NIa2F1d3Q0MU9tUUxVdVE1?=
 =?utf-8?B?TzM2ODhvOHdEQ1h1UHNWVGFBQWdQOG9kUUd0SnBHdk5xQ1duQWJ2OC9XcHVQ?=
 =?utf-8?B?K0NXNUZhaVZwbC9KV3VQK01VT1dTTlhva3RpaStQUUpsT2FQOFByTHFBREZZ?=
 =?utf-8?B?NEg3STV0R1BzdEwzYjdxd0V5RXVBNCtzeFg4U2J0bGV1RS9xZU95TnFoM0hT?=
 =?utf-8?B?SzdWWW41Q3VDMG1hanNObCtUbFo0djd0WVFURW9ob2NzckZMSjhhMUdMRE5w?=
 =?utf-8?B?U29ITVZlajQ0dUwzV3hwaHhNRnRRdUJlTWJzYllYWVUyTHRFamVGbkxNOVFR?=
 =?utf-8?B?azkzVjR3WGhkYkZQZHRYMHh6dGNXVWgyb2FHenBiMXFRNXJvWWRVM0duWmpi?=
 =?utf-8?B?ZndxYXh0V2U2VUl0ZGppRVpUMWx5RHJkNHlnZDUvRnc1aEhQSzRwT1NNZlMr?=
 =?utf-8?B?Tk4vYlU5QWsxRFdjRk4wNDlITGZDNHZWeGloSytER0V2SUdhWFg5b1hveGFB?=
 =?utf-8?B?a0lQazZITy9UUWEwVUJJS2JmQWxvZ1kyTFpYakVhSHNYNGxGRndHb3dhRzRF?=
 =?utf-8?B?bVNKWlhBOGwxOURoSmFKV25JMllCYlROUlA1alAvYU1xQWlGUXNFLzNKbDl0?=
 =?utf-8?B?bFdUOUpxdzVqZHFFemc0M2hYLzdkNUdPSmZRV1RqTC9xUjBTTDRJMkFOYTlP?=
 =?utf-8?B?L2N5a2VxdlJMTTJXdzF0blZrbjJtajdXeFUvbkY0aEcrRnZ3SjUvMWtsaXJZ?=
 =?utf-8?B?WTR0b3hpVG1Kc1MxZjlMQmk0MWJ6TFY3cTFhekx1QXp6UjRWc05ZZHkvYXlF?=
 =?utf-8?B?REs0cHp5ZFJEcjFRTGFSbUlGM0FXdXZKK3gvVFAyMGZ2cll2V0MxM2RIT0dk?=
 =?utf-8?B?MG5yLzRkVXNIZWJaMGt1QjJhZlAwWWU2b2JzZm9kSGN0TzVqR21LL08zQnI0?=
 =?utf-8?B?TTF0cW1DNnBURE55R3FEaEh6RENCS1lOSGZsbkV4VG82cU5VczFkV2JtajAy?=
 =?utf-8?B?d0trN0d3VEZyOUJkUW1BMHBsZVJVdHRsV0loOTE1RGtwWHlqbC85aUQ2a1Vy?=
 =?utf-8?B?aW50UEhWT1N1U2VET0JuQUtQRjE4cUxDRzdxM3F6TGpBWlR6eWU3bDFOWG9M?=
 =?utf-8?B?L1YxNDRPMUo3YmdNeVRQaVhHV1dweHNxZVgxTUVoZWZPcHhXRTNFRENvK3Zy?=
 =?utf-8?B?MU81NjhoTTczQmhKS203dDUrL1dzcWM3MUw1K2M3TGdWTTFvUVFzTktHZlpO?=
 =?utf-8?B?WDlSeVRQbWpibXRHRGdGRWdYRDA0bzJTRUpZZEVsVkxjNmRoRC8xcmtMUElt?=
 =?utf-8?B?dVV2VGh4S1pLWWpTU1ZuYUJhWDBCNEVPcjI4SDlFZFJvanlhRVhMRjZHdmVx?=
 =?utf-8?B?UFBCZStkVExRUURlak41UGt6U0I5SUVPV1dFOXhJb3VSK0M2VUQyK2VORzNz?=
 =?utf-8?B?VHZ3ODB4UjJnUVZCZnpmNWNvblJEYlVCUHVhdnZiWWd2RjRPQ2RpeGRtVGQ0?=
 =?utf-8?B?ZHl0SGhpZVZuTm9lUXA3NWtvY2hpbk91bThmNGRRODdwM3daVGNSOFd0L05Q?=
 =?utf-8?B?ZTBiMGNNdVE2SFlSODhuSmJwUDJCN0h4SlNZN2ZteUdRNTczeWZzaUUzRU5z?=
 =?utf-8?B?R2tEYmxkNjZvNWppajg3NGo2cGRyQWp0QnAxSWdKTjZrSHh5QmlPM2xCTkhN?=
 =?utf-8?B?OUdrL3h1RWw5aGJiTzdva0JJRFZIUWpkWHdienlYM3p0QzY3NG03L3I1VWpl?=
 =?utf-8?B?OFU4WHd5Z0VRNHhlbkxHbzdTQk5oei9BN0hzaExlMklvaEdwRm5EYnBRRlh6?=
 =?utf-8?B?R1VZekNxV1A1RnZoUmlXODZsS0g5cnpIY0dpUVFjbThtZFpSaUlCWjFScnRC?=
 =?utf-8?B?RlZlbloyK3RYUlBGVnlwL1NUYTE2dmdYYkZHa1RscHRVKzR6b2JUcUZBbzl6?=
 =?utf-8?B?UWFuN29mSkRldXZMZ0MrRDJZRGNoOERHWjhXaDFBUkR1eEdlaDlKRTgrK285?=
 =?utf-8?B?UzhSOWl4anpvQk56QStiaFRmK2x2dmJNSkIzM3FybE16djBaOExmcFRrN0Nu?=
 =?utf-8?B?VGhaWFlaWkxzZEZrODZNdkJIZ1dJdEd2UFJSZ3p0cE41Mnh4OXU0RWRFOEdH?=
 =?utf-8?Q?CGjZmcFSxbARED3nSPCN1pzSo?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E3E6CC47C93B642BDEF5CF90A40784A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f04f96-996c-48af-92f6-08daaaf120ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2022 18:56:23.9864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3xzxPQ6l7O7j+nUa4ciiCjj3DTmrP+6I5xR2TZsauqFOtzLKAGWy6lmxulKIfBGyv6PChQSwTwuNOBMAsqlpFkZYDIvE7myO1/qkPG6xQmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4984

T24gMDYvMTAvMjAyMiAxNDoxMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEluIGFuIGVudGlyZWx5
IGRpZmZlcmVudCBjb250ZXh0IEkgY2FtZSBhY3Jvc3MgTGludXggY29tbWl0IDQyOGUzZDA4NTc0
Yg0KPiAoIktWTTogeDg2OiBGaXggemVybyBpdGVyYXRpb25zIFJFUC1zdHJpbmciKSwgd2hpY2gg
cG9pbnRzIG91dCB0aGF0DQo+IHdlJ3JlIHN0aWxsIGRvaW5nIHRoaW5ncyB3cm9uZzogRm9yIG9u
ZSwgdGhlcmUncyBubyB6ZXJvLWV4dGVuc2lvbiBhdA0KPiBhbGwgb24gQU1ELiBBbmQgdGhlbiB3
aGlsZSBSQ1ggaXMgemVyby1leHRlbmRlZCBmcm9tIDMyIGJpdHMgdW5pZm9ybWx5DQo+IGZvciBh
bGwgc3RyaW5nIGluc3RydWN0aW9ucyBvbiBuZXdlciBoYXJkd2FyZSwgUlNJL1JESSBhcmUgb25s
eSBmb3IgTU9WUw0KPiBhbmQgU1RPUyBvbiB0aGUgc3lzdGVtcyBJIGhhdmUgYWNjZXNzIHRvLiAo
T24gYW4gb2xkIGZhbWlseSAweGYgc3lzdGVtDQo+IEkndmUgZnVydGhlciBmb3VuZCB0aGF0IGZv
ciBSRVAgTE9EUyBldmVuIFJDWCBpcyBub3QgemVyby1leHRlbmRlZC4pDQo+DQo+IEZpeGVzOiA3
OWU5OTZhODlmNjkgKCJ4ODZlbXVsOiBjb3JyZWN0IDY0LWJpdCBtb2RlIHJlcGVhdGVkIHN0cmlu
ZyBpbnNuIGhhbmRsaW5nIHdpdGggemVybyBjb3VudCIpDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gLS0tDQo+IFBhcnRseSBSRkMgZm9yIG5vbmUg
b2YgdGhpcyBiZWluZyBkb2N1bWVudGVkIGFueXdoZXJlIChhbmQgaXQgcGFydGx5DQo+IGJlaW5n
IG1vZGVsIHNwZWNpZmljKTsgaW5xdWlyeSBwZW5kaW5nLg0KDQpOb25lIG9mIHRoaXMgc3VycHJp
c2VzIG1lLsKgIFRoZSByZXAgaW5zdHJ1Y3Rpb25zIGhhdmUgYWx3YXlzIGJlZW4NCm1pY3JvY29k
ZWQsIGFuZCAwIHJlcHMgaXMgYSBzcGVjaWFsIGNhc2Ugd2hpY2ggaGFzIGJlZW4gbGFyZ2VseSBp
Z25vcmVkDQp1bnRpbCByZWNlbnRseS4NCg0KSSB3b3VsZG4ndCBiZSBzdXJwcmlzZWQgaWYgdGhl
IGJlaGF2aW91ciBjaGFuZ2VzIHdpdGgNCk1JU0NfRU5BQkxFLkZBU1RfU1RSSU5HUyAoZ2l2ZW4g
dGhlIEtWTSBjb21taXQgbWVzc2FnZSkgYW5kIEkgYWxzbw0Kd291bGRuJ3QgYmUgc3VycHJpc2Vk
IGlmIGl0J3MgZGlmZmVyZW50IGJldHdlZW4gQ29yZSBhbmQgQXRvbSB0b28gKGdpdmVuDQp0aGUg
RmFtIDB4ZiBvYnNlcnZhdGlvbikuDQoNCkl0J3MgYWxtb3N0IHdvcnRoIGV4ZWN1dGluZyBhIHpl
cm8tbGVuZ3RoIHJlcCBzdHViLCBleGNlcHQgdGhhdCBtYXkNCnBvdGVudGlhbGx5IGdvIHZlcnkg
d3JvbmcgaW4gY2VydGFpbiBlY3gvcmN4IGNhc2VzLg0KDQpJJ20gbm90IHN1cmUgaG93IGltcG9y
dGFudCB0aGVzZSBjYXNlcyBhcmUgdG8gY292ZXIuwqAgR2l2ZW4gdGhhdCB0aGV5IGRvDQpkaWZm
ZXIgYmV0d2VlbiB2ZW5kb3JzIGFuZCBnZW5lcmF0aW9uLCBhbmQgdGhhdCB0aGVpciB1c2UgaW4g
Y29tcGlsZWQNCmNvZGUgaXMgbm90IGdvaW5nIHRvIGNvbnNpZGVyIHRoZSByZWdpc3RlcnMgbGl2
ZSBhZnRlciB1c2UsIGlzIHRoZQ0KY29tcGxleGl0eSByZWFsbHkgd29ydGggaXQ/DQoNCn5BbmRy
ZXcNCg==

