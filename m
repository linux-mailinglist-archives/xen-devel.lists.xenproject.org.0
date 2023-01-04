Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC7C65D141
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 12:17:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471130.730855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD1m4-0007d2-T2; Wed, 04 Jan 2023 11:17:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471130.730855; Wed, 04 Jan 2023 11:17:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD1m4-0007aH-PS; Wed, 04 Jan 2023 11:17:36 +0000
Received: by outflank-mailman (input) for mailman id 471130;
 Wed, 04 Jan 2023 11:17:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tpAs=5B=citrix.com=prvs=3612a7559=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pD1m3-0007a9-Ou
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 11:17:35 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60feff1a-8c21-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 12:17:32 +0100 (CET)
Received: from mail-bn7nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jan 2023 06:17:27 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB5106.namprd03.prod.outlook.com (2603:10b6:408:df::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 11:17:25 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 11:17:24 +0000
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
X-Inumbo-ID: 60feff1a-8c21-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672831052;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PF5+qnr50HlgCu8Yl2X1uruIFc58QQfovGua4qn8lv4=;
  b=gDDCJvyD5LVz+aaebL1+tjcxiSrwFQdXwXQLWlzMwBZ0/trALrBvbgys
   0NDMPj1AFmFSSe24PP8c4yINyg7gQTSYrpg38SDLwa8eMfZlTzY4N+fBv
   zfMMZ4oP5wLJu1zNIw9engF+zxU1DSCB9FSXPo9QbyjKCbkClAmZvR1GE
   w=;
X-IronPort-RemoteIP: 104.47.70.102
X-IronPort-MID: 90603934
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1gmxqqw9Xv9GXNDNl296t+cVxyrEfRIJ4+MujC+fZmUNrF6WrkVRm
 GAaUGGFafaIYWDxLYslO4rlo04EvJ7Rn982Tgpq+yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5QRnPawT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KURH5
 9kXGQldVymK3s2E77eyePNNoO12eaEHPKtH0p1h5RfwKK9+BLrlHODN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDCVlVQruFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuqANxKT+zjqpaGhnWI+0gyGRkGfmKyqN+Yo3GwfohUF
 n4br39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOluU7WDgr3
 V+hhM7yCHpkt7j9YW2Z3qeZq3W1Iyd9EIMZTSoNTA9A6d+8pog210rLVow6SPTzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQKzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:WE6k0qkJEO6WsZVIOKYnb6ey1jjpDfIi3DAbv31ZSRFFG/Fw9v
 rDoB1/73TJYVkqN03I9ervBEDjexPhHO9OgLX5VI3KNGOKhILCFvAA0WKN+UyEJwTOssJbyK
 d8Y+xfJbTLfDxHZB/BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.96,299,1665460800"; 
   d="scan'208";a="90603934"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDRzcU2PmNald1yoXvo+VnSSH4clZOOM5mLjk4wQKeem1UBZ/mHtg72oSBa8mQH/5/iNthXUap3t2zcqTkKgz0Ff2+Iqv3GEq7g+h0JOcowMAmyIjwezQXZ4fO8zAvi5fW+xT2GbO+1Xt9Gm5pRl+fiddYqGfZ+Oi/K8OySEE7kfw/bqrClqE79lVTVisuKL/fx8fJhTvM2TQ/t26LqVAEgmC6bmK7MWSVB9mo74YR9CvFFWjjO88A/hW9zQQeh+8j+ywbsfrz3NlUO+PPfauRFITYK7nxJWoxTRVdRuen8gYqLU5vqTKFTTA6S35T0bZTM1GfdNVol++JM4/9vJYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PF5+qnr50HlgCu8Yl2X1uruIFc58QQfovGua4qn8lv4=;
 b=KH57fZl8i7h6s7RvA1GVUjKMPYt8m002JxrvC62fjdch27gkUm+K2ob6CRX4D/Mk0o0+yZh4yKQzby0ieQy+2cw98d4aCRCzOEzyKxRL+a4a8t/ekbjhZlgtIaoAy2qeThABJr/wDBtHHadIIKuBEjLkELmaelaX/hMO0NF7WgIo5bIUAMMeYHyXFd3IwiuhPLmb2YKCQUFb23z2gOKQnVIFLR7Ujw4SPd68fAoM9Ehh1SfPiUGMUb14qUdF+AbteO3QLRCPEXabXCXedoKujePBPxGra9evpCri/p4fRAAq1UfyLvvznI7KLrjS2KAcRtTPU1Rv0E1bPBVASEsT1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PF5+qnr50HlgCu8Yl2X1uruIFc58QQfovGua4qn8lv4=;
 b=MIpgHvxe99QbgZrZYZ+5Pd3ReJCZi6OHCDjSKB8HBCdiQWwZVnrFAhvi4VZyrLjDD2lDk9Cpt08NJzsFzUzaMWhmWsvviPg+KLnM/yqwMQLBGsq2Io+GEBdayAOVxQSx/7U0TDCUD9/hsBhmeFWDvBOcrQ7CQQej0y8o+r8TllU=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 0/2] x86: Work around Shstk fracturing
Thread-Topic: [PATCH v2 0/2] x86: Work around Shstk fracturing
Thread-Index: AQHZIC4eprKe1GLtgUSigry+xdpDWw==
Date: Wed, 4 Jan 2023 11:17:24 +0000
Message-ID: <028d658d-db7d-9cd0-08aa-9033bc65e547@citrix.com>
References: <20230104111146.2094-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230104111146.2094-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BN8PR03MB5106:EE_
x-ms-office365-filtering-correlation-id: f721dea9-21b6-45ad-c6f1-08daee45417a
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Vgk15gTQXxlmOO+SE/oe5OzHtwzrgZmqYuoPKBOItQhttvBt4m1qx+iWnS7QWrFEgrBQbIK7o0oNO26vXZCzpTxJe8LlxmQuku2HEoSsJMHceAVX3XnN9MOtH/AYP7VaWuAhIWpvP4fqEneLeT8D6vvOKxs2+IDcQX9eN+2v71e4ZW3+evCwrwZmdQ/aEom0+0N0x/nM4TQso++L5TecWBzyoinlKQy8S2vyHExC4/SSYXt6J4M4/3FQ0agd1+AXfH5E+JQuvPMtbMfeA5kkiZQP08pnswtJcYejMJYJbDKUDXOLRM3rskAhB/ndEGzC5T0alHfE9qBNuCJJgJ4qpdCHSiGCdMHdcIbXE6a9DFqSjtWTIPN3p0HDOJUGi7RM5ipmBm9zJQ2Mg+ACz0di3BQ9IWCjMHfdImNES9XggylusEiyj5Z1CeIMTR+767CWvu1ZMcxkbqL0QJOVYF5X1XgJXPTvNDalWIJF+f8RLPAwJTo86yIwQ9kN40g8d5JaZwSm4wuKBMDT1BObhBXYT2jXBQmMfe3wcKR8kSULLXpmBu5Ccjbb1VVWKSMR/XrEI/oTF6uZvGrNXwn2TLAkeYUlYpXQwvvk+Ano5Ph/1OdT5aEgHMqh9GkbDURPqjtXyIOzpby6nz581dNATZqMb7re/ipaBKukCN/oBENCXpQq10/2FPb3mTAgphbFTLQux0U4QiYSoCws6fRKIv+4WBKkK4WoMBWBI2oyKVypms6hjfoQvRdPmRkOg7LLO9aVO68O3RSbNdrMBddyOU6Dcw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(451199015)(6506007)(26005)(6512007)(2616005)(53546011)(186003)(86362001)(31696002)(558084003)(38070700005)(36756003)(82960400001)(38100700002)(122000001)(478600001)(8676002)(4326008)(41300700001)(2906002)(5660300002)(8936002)(66476007)(6486002)(71200400001)(31686004)(316002)(76116006)(66556008)(66946007)(54906003)(91956017)(66446008)(64756008)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TlNOSStCcTJaaHR6WUEwU0pYelZOQkVNdFlZZjJjN2szYUhvVnFuMnJiU2JI?=
 =?utf-8?B?cmVKTzdPb0tMZkNIR1llaWgzbFlibG10T3FoUFBVRGVXazZoMHFWRGhNRnZI?=
 =?utf-8?B?Y1NYLzNRTU9VSUxUcjEya1ByYlR1OUlUN1pXWDN2a2svT04vQlhhNVZBZmI0?=
 =?utf-8?B?UVZickRTN0Z6ckFGTmdGRS9jU0NvQ1dWSTMvT0FGNFFaUkRWN2tCOWZUVi9a?=
 =?utf-8?B?WE5OS1o3dlJVRlJvcWVKQVpxbCtOcERicXNzUTBqVUNaVVUwbi9JenF3dmxU?=
 =?utf-8?B?MWI1RG5salJ0SjFtak95TXQ4WW8rYStrY250VWx2ekowdjhLMldXTUlMNWFt?=
 =?utf-8?B?em5IWFI0OHFXYmhMTTV1UDRwa0FNUG1FV1Vpbi8rWi9HQ0JuU1VOQWFYSUN6?=
 =?utf-8?B?d3RpSks0akVXZFI4QlphOFNMUmxsaFBnckdTdXpZUjg2Z1MzSjJQZ01pQTBa?=
 =?utf-8?B?ckh5Y253bzUzQ040c2FicGtjR0Z5UFFDbms0d29zMjM2UEdRdDB1S01KcldE?=
 =?utf-8?B?bEdmRmQrZGVjcW5Ea0pRc1Rld0tKMFp5WEg0QldGbkZ3Y2l2c2FSelRNRVdn?=
 =?utf-8?B?Sk9ZV0tNS2ZNaUhhajZHanZwUk5mUHZxZ1BxVE9KeWJSVE9TcWhWZmR6MGJ2?=
 =?utf-8?B?amp5VDhIQnNTdTE2MWNGMnFObEhQTkg0a3VkdnJ4SmxwVzZ6eWw0dGpIL1hq?=
 =?utf-8?B?ejJKMDNPUXY4cUxsQ0ZJV2o0SXRROXIyYzN5TWlMYzhyRXpORi9sZ1Urc3Nw?=
 =?utf-8?B?a29tU1JvZk5zWTBqckEwN1JmQjF0V3BaeGJRMHpFRXBlZWRuNlZwM0VQcjQ2?=
 =?utf-8?B?RlBjNlNUM3I5T3dJVlpGUUFZSzdQYitLRER3ZFRwODg5Mlg1MG5tTWNrTG1M?=
 =?utf-8?B?REptZ3pYUE5SWUIxK1JwUWo4NUlScnZlK1VHbDZ1VzI4M091RVBhTU1wV3Zm?=
 =?utf-8?B?Zm01NVg2SGlGM1grMlZraTJ4bGpvVnBBajhleDRQMFR5RjYwSzBuVlpuZEpj?=
 =?utf-8?B?UFM1ZlFkckZCd2FIOGtlbWN3T3lOS3NuTU1kRmpKaU9wTndtVnFIYm5VdHk5?=
 =?utf-8?B?bEVFY1ovVk5kaGJUZmROTEx1SjBHL2NBVGdxb21PVTVYV1BtWnplWFRubVZI?=
 =?utf-8?B?ZStRNzRoSTFBNU16SzYzaDU4MUlaZ3NPY0VlcEJIQlN4NXJOTGdtQ2NsZHlX?=
 =?utf-8?B?MDBQVDBkZHVZTVIwNnVya1JybkhkZXNqZHBHQm5EckdLTHVZSHhlcis1L3Ay?=
 =?utf-8?B?a3hFWWowR0JGRkJlQWJNSlhGZ3pVV2dqVVFBTmEvVGF4b3V0RTVscmkzcWRN?=
 =?utf-8?B?OXFyWDZSRmE1WEFMMGlpV2JCOGtyMXJVaGk5ZGdhbnU1blViSzU5UkU1MjBD?=
 =?utf-8?B?SS8waytEYXRzMjNicUZvWUl4d3dKcnVMSlFHK0hSZGsvTEIxVkswVkQwTFIv?=
 =?utf-8?B?dUJseGJaS1ZKMnJKWTk4YUY1bmo5bGhVU1VHVitiZVhLYVZIdFQ5VFBha3lY?=
 =?utf-8?B?VElKcTJBdnUwQk1TU1FBWWpXRFdHVlVHT0ltZmUvZDRwaE9VVEp6OGlMbnM4?=
 =?utf-8?B?b2VvdDZLck1UbkU4N1VCTTF0WnpPSEFmc0dqdVdqSktwSHBNZStEcHF3Y1A5?=
 =?utf-8?B?VXd4RmFoc3FyU2IyOXBrRHZsanhFRWNrRUJIQnRvNnVJdU1SWTNyZzNHQmM4?=
 =?utf-8?B?SlN3WnVxSFR4T0MvcUNhaldxeWFlN2psWWVKVWVkaS9yTGZxdUI3NUdoWDVt?=
 =?utf-8?B?T28rS3pRamNudXNUWUJzajNMZklJZUZyOFhvVG5PRkdxZUhtZERsbXRtWDlE?=
 =?utf-8?B?bzVkUmZXZXJYU0E2ZWVwS01zbUM0R3ZyYlJXSXFwY002QStQdDlMU3BoM1kv?=
 =?utf-8?B?bGVzbnJlZTk1b2xGeXhqVGZFUzcxRzU0UTRJNjMzc0JyN2x0M3hKbDU3b2lW?=
 =?utf-8?B?ZUJSTWdYRlRzQ0VLT2FySE5TZnlpWTZyNGd1bU9OVytEL1lnRXlOVHJzdmlH?=
 =?utf-8?B?dThLalF0ZW9KVndzYU12dm9zRVpQWXpzNU9kRXpMOXJtY2NUYTdQVTAwRm1O?=
 =?utf-8?B?VFVkajdZbkhZN3BlLzI2TWd3ZGlpMkZ4dlU3dC95cGtCb1laUE5VZTFBU0x1?=
 =?utf-8?Q?WkqwmoZ9t/R5+IMLVQQvWKQMe?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <06EE0AC8DDD7AD4BAC2D1EC9E864D7B4@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2Z0dp6dMxhCwvWDgKFl32onbUU8uqPL38PK9udjyGvvR4qQG5q7pjj5fYcwvB8Kt4Aqe1sFTGZQTOx7wAtd4qHOEoGOcm2VgpJUUyP/KTgATlgLkXhYMRgDEQghJMDXYXy3A+D+S+2gnWXJAMtznTL+wFnv8NflkNrbNPM8LT4qbocHDMJJrWw+kL6sS3zyHKuVTt6xRLLiLDFiny81LWoh/AoF4cuKOfjzIGKLAtx98L8bG+7ZAX+i/CdpSubxRae/tV9CqnZiuv2uWtczwFIOnJXVbL4G0CDZx5y4yE5dHRNTxkH5y19jnl7fSSxroq/TBli3gRAd36e9czyvJCqS1K1oc0cc4wpIevXaVGqRxwZmQISO8yWdidtitde2DcvIOmwbM6DlFHUXWrD3Rvf5+UoESmXGBBTd+BowL7mgsCQEQGtYUzTpD8IVTpZduSewnXJkRJnx/rlGAem7f7aKltyfV1odljhVODLZz1ycjQr8G5ydpkmupt8AVDdcthamsivdPCcoz/IcEd0yg42bre1rlcpF8M/tJYLsLXBQ0Dqg9qDtnwGfhIiBoq0BEske06NV1eBVJe4PMnNb5+vck8lrGViqISxGrzUQs80dvDzjI69OigqQLH4gaPxc74fe4DNQ0v8sFGWIOyGt25816mFdi0A3Z87RGV940he3KJD++6n6qDA/paJ4+qcT8v57SETKaUPTVnaaL3OCw6qqKkMvQPrX0+JRNVv2YGvI5uAWSJ822qu+khJXEXj4faqS/4GlHp0A1XLnMr8nEVbZL/rcKf9KVMPN0w8xN9gLp+cOJc8C9zMNT4T5zks/K
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f721dea9-21b6-45ad-c6f1-08daee45417a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2023 11:17:24.4753
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nllPKvA/Pe1plXY7YzG00Exan2B+vRCPIX+RJSvGZ15Bmbuyt8XmZVPzjlutHxSrfmXwEWzHcf50SKdpgbuYabTJtE7OEjr70nA8ytb4JCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5106

T24gMDQvMDEvMjAyMyAxMToxMSBhbSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gU2VlIHBhdGNo
IDIgZm9yIGRldGFpbHMuDQoNCkFwb2xvZ2llcyAtIHRoaXMgc2VyaWVzIHNob3VsZCBiZSAidjIi
Lg0KDQp+QW5kcmV3DQo=

