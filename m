Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EC05E61EB
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 14:05:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410096.653096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obKwq-0007b6-3D; Thu, 22 Sep 2022 12:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410096.653096; Thu, 22 Sep 2022 12:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obKwp-0007YM-WC; Thu, 22 Sep 2022 12:04:56 +0000
Received: by outflank-mailman (input) for mailman id 410096;
 Thu, 22 Sep 2022 11:55:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yqP+=ZZ=citrix.com=prvs=257ea8821=pau.safont@srs-se1.protection.inumbo.net>)
 id 1obKnU-0006Qt-Ck
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 11:55:16 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a3ea137-3a6d-11ed-9374-c1cf23e5d27e;
 Thu, 22 Sep 2022 13:55:14 +0200 (CEST)
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 07:55:11 -0400
Received: from DM6PR03MB4138.namprd03.prod.outlook.com (2603:10b6:5:58::12) by
 SJ0PR03MB6439.namprd03.prod.outlook.com (2603:10b6:a03:38d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19; Thu, 22 Sep
 2022 11:55:07 +0000
Received: from DM6PR03MB4138.namprd03.prod.outlook.com
 ([fe80::653a:87b4:8096:8bf]) by DM6PR03MB4138.namprd03.prod.outlook.com
 ([fe80::653a:87b4:8096:8bf%7]) with mapi id 15.20.5654.014; Thu, 22 Sep 2022
 11:55:07 +0000
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
X-Inumbo-ID: 6a3ea137-3a6d-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663847714;
  h=from:to:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=0yB3CWTwn7miff6WKQfg4NNooeTmqdpZdK27Pwgqt2w=;
  b=SEIz+pdUq9HEgKwU+dfl1Rfb/Ihq/akcxOl047/tCDTdGUWu0okSwxYz
   656G0grg1C85b15aKgkWugURjRCxoszys5PmV5fan2503YiHCnAYOwMBq
   pGKzhK/9wISzF/Er88cBIYoccnDK5KSl5Wa0On0fRnUotbDOW1ZiZYbnc
   4=;
X-IronPort-RemoteIP: 104.47.57.168
X-IronPort-MID: 80247868
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:mB0bPqCZt/mahRVW/1Xiw5YqxClBgxIJ4kV8jS/XYbTApDlw3zBVy
 WoZCjiOb//bMWv0fohxOY22/E5VvZODmoQwQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E3ratANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq3uU0meaEu/Dga++2k
 Y608pa31GONgWYuaDpFsfjb8nuDgdyp0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36ZGBivkF+Sam66iWukwRpukoN2FjwXm8M49mBt4gZJ
 NygLvVcQy9xVkHHsLx1vxW1j0iSlECJkVPKCSHXjCCd86HJW3rxhNdNPkoXBqwzy9kuIVlv9
 MMaOAlYO3hvh8ruqF66Ys9Fo516aeXOYsYYsHwmyizFB/E7R5yFW7/N+dJTwDY3gIZJAOraY
 M0aLzFoaXwsYTUWYgtRVM14wbju3yevG9FbgAv9Sa4f+2HOihd43r/rLPLee8CQRNUTlUGdz
 o7D1zShWE1FZILPodaD2kqp1+/FnR3/ZIwTFe210aR13FKS3EVGXXX6UnP++5FVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe9DW8ymIw6vQpgqcWG4NS2cYbMR87ZFmAzs3y
 lWOgtXlQyR1t6GYQm6c8bHSqi6uPS8SLikJYipsoRY53uQPabob1nrnJuuP2obs5jEpMVkcG
 wy3kRU=
IronPort-HdrOrdr: A9a23:B1FPlKCNhN2Cd03lHegcsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+VAssOlJo6HJBEDyewKkyXcT2/hbAV7CZniuhILMFu1fBOTZslnd8kHFl9K1tp
 0QOZSWaueAamSS5PySiGbXLz9K+qjlzEncv5a6854bd3AJV0gP1WdEIzfeNnczaBhNBJI/Gp
 bZzNFAvSCcdXMeadn+LmUZXsDYzue72K7OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFqQrk/a+u2svLhSM0llWjoai+quGRiuerN/b8yfT97Q+cyDpAUb4RGoFqegpF5d1Hpmxa1O
 Uk6C1QR/ibo0mhBV1d5yGdljUImQxelkMLgzWj8AHeiN28SzQgB8Vbg4VFNhPf9ko7pdl5lL
 lGxmSDqvNsfGf9dQnGlqr1vitR5z+JiGtnlfRWg21UUIMYZrMUpYsD/FlNGJNFGC7h8ogoHO
 RnEcmZvZ9tACWnRmGcunMqzM2nX3w1EBvDSk8eutaN2zwTmHxi1UMXyMEWg39F/pMgTJtP4f
 jCL81T5cZzZ95Tabg4CPYKQMOxBGCISRXQMHiKKVCiD60DM2Klke+F3Fz03pDbRHUl9upNpH
 2aaiIliYcbQTOQNeSemJtW7xvKXGKxGTzw18A23ekJhoHB
X-IronPort-AV: E=Sophos;i="5.93,335,1654574400"; 
   d="scan'208";a="80247868"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TfV2+422gCjp1eiZnJMB35amlqGaMZ+KmtV2rPG03rhfLDaJ6CmN/ZvpxSUbj08tsXX4VrgGGck54HHdGMyAkKw80xFkoF1UPU6bgcPtwHlL/RWnHLpvf4GKyu9x6QWEpUZf1BYv6OwS4LwxU2f0M4eKdKpkD5w8hM13vW75ckVJfj9QNsUG2qFTWq2ynzY1BGE1Pe6/e30b3Mwjb2E1eDwu33j3Lkjq389slcdW192MS27loXFmpPU6r/QHLEIHccXwWgncwrb+L6/rSa3IIXP7BlLVrHJqU7CIw+3Kcm2V8XQ8Zv7Zsi0iwIcDKYdIUA5bLZg2Qis4HORpLJarIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yB3CWTwn7miff6WKQfg4NNooeTmqdpZdK27Pwgqt2w=;
 b=bsrLlsI5jZ8AUaG+UcXTqErfz+6DYgwAUHUbEZW+q53a/+qVuQOrcuDZI6l6+kaNTY02PrRz2+4EZdO5XOJvwhMw58VxSIOieT22CuKJhIFaO7X37vXiSqleyPKR6hmUd8T76y2H28AevQsnNO9bfhQ0dXr7F5RnA8S9zYbdHRaC8m78Qiggqc4emBlwhTddxtKHet7BpL7KNOMs3qXyxXurIbfNJ+qrxAzUgxecpuWepKNc5UC8JXY6+MtVDTJ5duB7SCysHzDFKEJsqf1J4rMXKLTR9xuzaLdKB4uJIvpbOfeZr0rBi1miyg41VU7maH5vbmgu18elq9V/hCFhTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yB3CWTwn7miff6WKQfg4NNooeTmqdpZdK27Pwgqt2w=;
 b=kztstzL6OrdCjY5+fcR0oCpS9ycHwEiOFYfjctvciQyR8fpJFZhwrQ5G0GA8wbi67Ic8X5yHTdFB3Jh381J6zAijOvVV7ykzJrZ2C6nTsNeuY+v/tvt8FRodqVwoA7qxtJLE+3/5QpXk1LsmYbpWwTGtAwnwS4LRhrCoAWqq0AI=
From: Pau Ruiz Safont <pau.safont@citrix.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	=?utf-8?B?WGlodWFuIFlhbmcg77yI5p2o5Zac5qyi77yJ?= <xihuan.yang@citrix.com>,
	=?utf-8?B?TGluIExpdSDvvIjliJjmnpfvvIk=?= <lin.liu@citrix.com>, Edwin Torok
	<edvin.torok@citrix.com>, "\"samuel.verschelde@vates.ft
 yann.dirson\"@vates.fr" <"samuel.verschelde@vates.ft yann.dirson"@vates.fr>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: Notes about "A common codebase for guest utilities, defined and
 shared with Xen downstreams"
Thread-Topic: Notes about "A common codebase for guest utilities, defined and
 shared with Xen downstreams"
Thread-Index: AQHYznooUVfpDzfZVEOAf1uhZf8yng==
Date: Thu, 22 Sep 2022 11:55:07 +0000
Message-ID: <067a94bc-b167-02c1-c654-27f2903f42c4@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4138:EE_|SJ0PR03MB6439:EE_
x-ms-office365-filtering-correlation-id: d9e96b66-8f11-4a06-bcf4-08da9c914b37
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 8kIRhzj0Tm/icoD5Dg/rew+sEdO6rTqbXBasZdTO/33k4c5SDT70IDkPUvDnq54FEdckTRrUPlslCCUrpbsMjWx4MnZbUrnav+y78Y3vPl4HJLNuQelgaWylFNXEi0FzWu6RsQJwkNnanOwxYnPB9y6S35lKycpE/DYgFJcLnaZXqEp/nL3SdtXnH4lQirPtmIqnQAZhA8X603uS5hyo5GwubIjaqBbumCZIeYB/W8hvI3pHWjcoDKfcOkpYhol286oYTfsHlYl0XeVWyUSUog347waTq1Q/Znr6Bipvu0ZIFS0ipYHu2/J784FqTtKABfb/qT8LGUqY0NNxECdJYUmjmFjBl5QuzrnuDFIcf86rcNKqx2k8kVtZiUpNhHsoHdlpJ4RndnS3f+VloaVkcqX9YlvelX6F+BwlJj92FGT98hgrZCWDZAoVm6LbIPJziDu8yHjXDQusErumedI9n3wKmh5180Q6b9KQryRl8Y6nx8eKX3EF9dso+CAHGH4lsnttplb66Z/kwQDFt+MgblGOnc/XlIzTVoQfikFYLbBnwp2KMrK1QEIdJxAO8KeQwMehKQ9QriCWGAVFEhtTmBtTpletfNzWlqmSKcXovAQ8sQobIVs+V8jmlKTOzPRbehz5JuRwH/okM+bogI3wPTK28mbfoMn/mPFfGBo6zS9RnmwOO5u08YAsgzmcg7q4+PD+YcwK8ySswCjyeBJzprea265E4ziKkIUCEYLKhvuTI1y3heOm6FYDIolCUKOKxtJEC0N9xtAv1UvjlaSaQWfuGmW/+PnUTPoQfSF0SQyes76ugghoUyS8Cnph/vayoYeRFcJYOmxhsJl/1QbHYKmRfl/o5Naqyc4n2m/Sp4M=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4138.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(451199015)(8936002)(71200400001)(91956017)(76116006)(66946007)(6636002)(64756008)(66556008)(66446008)(66476007)(5660300002)(186003)(2906002)(110136005)(6512007)(26005)(2616005)(83380400001)(316002)(31696002)(8676002)(36756003)(86362001)(6506007)(478600001)(122000001)(38100700002)(966005)(38070700005)(6486002)(41300700001)(31686004)(82960400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QnVxUEtFY2dIdElGNmhWV3JiYTQ2WlVGblRuek40TzRmVmxFajFOU0FZKzI2?=
 =?utf-8?B?ZTQrb1oyVnk4VzVyb3RkOGczUFJJUnZTTW5LZDRtSzBuNFgxZjhVY0VucHZn?=
 =?utf-8?B?UEcyTG41N0RZTUVPMkNLaUV0OG1yQ3FEV2E2ZTJmK3cxQmFGT1NwMFg2cWdV?=
 =?utf-8?B?UkpOY2lIWlVpRnkyZGdtc3lEOE12L1JzQ2I2TEtudVgzM0dHNjhIQXBOdWR0?=
 =?utf-8?B?TVV6dnhmQndidGp3bTVacUozMm9iOU5JN2txeERzV0c1NzJkS0dQZE0zNXVw?=
 =?utf-8?B?dzBkaTJpY1Z1L044OFNMeDZZR0MxWC85WEh2MUo4UWVja2ZtakQ5dTZ1cUhV?=
 =?utf-8?B?andycGxzVEZWL2lDUW5SMkl1T3BKcklRTjlaRE84Z1d6Y3BwS2Z2MStmNVhO?=
 =?utf-8?B?a3J3S1FqS3JJMkkrTFF2cjNsT24vRmlLKzJxV0xuRHB1V1JQTkpHYVF3cG5a?=
 =?utf-8?B?RzIyME1wc1dsK3BmeHBBTDJyRUZ3cWNMcnhzMHh1QTd4U0x3Q2FDaHk3Vk04?=
 =?utf-8?B?QWVZRXBXcFA2U2JYS1dQc1ZmVGMxK1BWNFU4RkVrdWFrMkYvR2JuZ2t6OWQy?=
 =?utf-8?B?MWZURWlmVnpNYVJKaktuaVVDbjR2MTRJYVh6M0lkbGlxVjZBNFB0SkQ2VjRQ?=
 =?utf-8?B?ZGloenFWcU9IOVdRM084RFB3U0M1ekViQ3ZWTFNxa3dtLzNjT0d1alUyTGM3?=
 =?utf-8?B?ZXZJOVhJYTlCQ0MxTWRNb3VHOVZ3dENXakNEYVBEbmRTSHEvS201emM1cUhC?=
 =?utf-8?B?RUFVcExBZEFGQnFMVjE0cCsxc3VuVE5ZOHJzcTJTazBqR2RlNEE0ZHQ4OHlq?=
 =?utf-8?B?S0h5ZjI0anNRc2JaOE5leEdwaXY1Sis5eFU1My95cGdPVjdGNC91NXVEVTcy?=
 =?utf-8?B?YVJWY3RLUkltcnEwT05BdUI3emVjaVBaQTFncjBXZWtTZTdvb1pQUXJTQTNv?=
 =?utf-8?B?TG5TaTYrTUxBbzdMWHhzUEhJaWRIOVZUTysrVTBFNzdpNzJIU3k5MkxOaVJl?=
 =?utf-8?B?RVprdFdneUlkZVlmc3J5UzVaSmxrUmpJOUVEWW9GZ1BzODZuWThZNE1XWStu?=
 =?utf-8?B?VXJRUnpmOXp3d2ZraDIvNTNZb0Z6QlA0VjB5bzlObkgrZEtwWDBLTTRWUTEw?=
 =?utf-8?B?dkZvWXNlTkRkMlRYNm02V0s3Ri9CV2tBUDJ2NktmN3VBL0hXTTkyNVUzM2po?=
 =?utf-8?B?eEFsTGRHbEFkSG5uTUVXZEp4T2JBTUtFN1d3Sjk0cU9FaFkwR3NQV2phbGx5?=
 =?utf-8?B?b0MxY0FnODdOTE9yY3prRzM5ZGp1Nk5UajBZT1VSRHIzeGN3L3VaVk5heGYz?=
 =?utf-8?B?SVp3US80UVErcGZ0YmJaNTFFMmk2MG1DQVIzSHd6SVh5YkxhQ1JNVlh0UmxV?=
 =?utf-8?B?WEU0MVg1dDMyMDE2c0Z5S1g3ei9kSFNVcHIxSUt6L1J0dDZmS0sxYTVDMkVD?=
 =?utf-8?B?NzVWdnEyR3dYWVVaOHMxTU00T09hZG84Y1dOUlhFWXEyUHhmSUVPamp2eDdn?=
 =?utf-8?B?b3JWQmtUK2JpeVVsTytYaitzVFMzMHVOSlV0NVNUODIyait5eEJnUDk3MVo2?=
 =?utf-8?B?Zk01RlJnUXVWQnFXMk16NFBFUHNWWGlYK1dIMGRVQkZNbUN5TWR3OXkxN3RJ?=
 =?utf-8?B?eUJtNzJDSkpTeGtyMWQxb3JuL1BnZkNMV3FKb05DTzB4eEVJRDdvcnZWMUha?=
 =?utf-8?B?NEZ1TlZ3YTRTeUJoYUxhUGpNdTRVTWJxTFZNNXhQQi9GV3BpanFCU2ZGclNv?=
 =?utf-8?B?RDZmZk9OeWtMY1ZVc21qTTJWOWhreEszd1htZTlPTmQrQXViL21HemhIeWZo?=
 =?utf-8?B?MGpRZDVNNFJyK1p6TmJ1dUZYV2xIVGtCeGx3Z0JWbFFxOVZaTmYwcTFldU5J?=
 =?utf-8?B?cmRzTndYQ1pDRmZsbWhQeTZvRDhWTENMNUsrMDZHa1lrYTVNM05rWUg0Mm1B?=
 =?utf-8?B?OStZRTFWWHlYbFM1d2NoME0rSTNIWGl2c2YrUHoyTUVacjhmSmQrOEpWSDBC?=
 =?utf-8?B?ZGd4Y3RzclByeUdwSElYcC8xN2krUjE5YUZPWk1udmdsM1FoME9tRVJ4NlVh?=
 =?utf-8?B?WTZzNUNJQ0ZwZGJQbTdzaU1RQk9FVng1alJBYmJ0TkpQS0ZWRExNdUl3SWRu?=
 =?utf-8?Q?42Y4DDHbQWgo3Qc1jWClotr7N?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD3825411BC11B48AAF081E10B162F6D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4138.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e96b66-8f11-4a06-bcf4-08da9c914b37
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2022 11:55:07.2012
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lz2K9QZVGduHIAuaTlhLCGAn5dqmQRnwxjAkYFmsw06F+wbYM9/Jb/3IyzlLzJNyvBb0yl7+kyhKd3oJeoKnhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6439

c2E6IFNhbXVlbA0KZWQ6IEVkd2luDQp4aTogWGlodWFuDQphbjogQW50aG9ueQ0KeWE6IFlhbm4N
CnBhOiBQYXUNCg0KDQpzYTogYWdlbnQgcnVubmluZyBpbiBhIHZtIGNvbW11bmljYXRpb24gd2l0
aCB0aGUgaG9zdCB2aWEgeGVuc3RvcmUsIA0KdGhlcmUncyBubyBjb21tb24gY29kZSBiZXR3ZWVu
IHZlbmRvcnMuDQpsaW51eCB2ZW5kb3JzIGRvIG5vdCBrbm93IHdoYXQgdmVyc2lvbiB0byBwYWNr
YWdlLg0KDQp3ZSB0ZWxsIGN1c3RvbWVycyB0byBkb3dubG9hZCB0aGUgY2l0cml4IHRvb2xzLg0K
DQpjdXJyZW50IGltcGxlbWVudGF0aW9uIGluIGdvDQoNCkZyZWVic2QgZGlkbid0IHBhY2thZ2Ug
dGhlbQ0KDQplZDogd2hhdCdzIHRoZSBtaW5pbWFsIGZlYXR1cmVzIHRoYXQgYXJlIG5lZWRlZD8g
QW5kIHdoYXQgYXJlIHRoZSBhZGRlZCANCmZlYXR1cmVzIHRoYXQgYXJlIG5lZWRlZD8NCg0KeWE6
IHN1c3BlbmQgcmVzdW1lIGhhbmRsZWQgYnkgdGhlIGd1ZXN0IGtlcm5lbA0KDQpxdWJlcyBoYXZl
IHRoZWlyIG93biBpbmZyYXN0cnVjdHVyZQ0KDQpzYTogdGhlcmUncyBhbiBlbXB0eSBnaXQgcmVw
byBsaXN0aW5nIGZlYXR1cmVzIGluIA0KaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3hl
bi1ndWVzdC1hZ2VudA0KVGhlcmUgYXJlIGRpZmZlcmVuY2VzIGJldHdlZW4gdGhlIG1ldHJpY3Mg
aW4gcXViZXMgYW5kIHhlbnNlcnZlcg0KDQp5YTogaW5zdGVhZCBvZiBwdXNoaW5nIGluZm9ybWF0
aW9uLCBvbmx5IHB1Ymxpc2ggdGhlIGluZm8gdG8geGVuc3RvcmUgb24gDQpkZW1hbmQuDQoNCkRp
ZmZlcmVudCBhZ2VudHMgcmVwb3J0IHRoZSBtZW1vcnkgc3RhdHMgaW4gZGlmZmVyZW50IHhlbnN0
b3JlIGxvY2F0aW9ucw0KDQplZDogYWZ0ZXIgcmVzdW1pbmcsIHRoZSBndWVzdCBhZ2VudCByZWZy
ZXNoZXMgeGVuc3RvcmUga2V5cywgY291bGQgYmUgDQpkb25lIGJ5IHVkZXYNCg0KeWE6IGdvIGFn
ZW50IGRvbid0IGRvIGl0LCBtYXliZSBrZXJuZWwgZHJpdmVycyBkbw0KDQplZDogdGhlcmUncyBh
IGNvbW1pdCBmcm9tIDIwMTYgZml4aW5nIGl0DQoNCmN1cnJlbnRseSB3ZSBoYXZlIHRvIHN1cHBv
cnQgY3VycmVudCBwcm90b2NvbCwgYW5kIHRoZSBjdXJyZW50IHByb3RvY29sLg0KDQpTaWduYWwg
dGhyb3VnaCB4ZW5zdG9yZSwgdXNlIGEgbmV3IGludGVyZmFjZSBpbnN0ZWFkLiBUaGUgbmV3IGlu
dGVyZmFjZSANCndhcyBwcm9wb3NlZCB5ZWFycyBhZ28sIHRvIGV4cG9zZSBtZXRyaWNzIGZyb20g
dGhlIGd1ZXN0cywgZGlkIGl0IGdldCANCmltcGxlbWVudGVkPw0KDQp5YTogYSBtb3JlIGVmZmlj
aWVudCB4ZW5zdG9yZT8NCg0KZWQ6IGlzIGl0IGV2ZW4gdGhlIGNvcnJlY3QgaW50ZXJmYWNlPyBi
dXQgdGhlcmUgYXJlIHRvbyBtYW55IGd1ZXN0cyANCnVzaW5nIGl0IHRvIHJlbW92ZSBpdC4NCg0K
c2E6IG1heWJlIGd1ZXN0cyBjb3VsZCByZWx5IG9uIHhlbnN0b3JlJ3MgcGFja2FnZSBmcm9tIHRo
ZSBkaXN0cmlidXRpb24/DQoNCmVkOiB0aGUgYWdlbnQgcHJvYmFibHkgbmVlZCByb290IGFjY2Vz
cywgY3VycmVudGx5IGdvIGFnZW50IHJlaW1wbGVtZW50cyANCnhlbnN0b3JlLCBidXQgaXQncyBp
bmNvbXBhdGlibGUgd2l0aCBkaXN0cm8ncyBwYWNrYWdlDQoNCmlmIHRoZXJlJ3MgYWxyZWFkeSBh
IHhlbnN0b3JlIGxpYnJhcnkgYXZhaWxhYmxlLCB0aGUgYWdlbnQgc2hvdWxkIGp1c3QgDQp1c2Ug
dGhhdA0KDQpzYTogdGhlIGluaXRpYWwgY29yZW9zIGlzc3VlcyBtYXkgbm90IHN0aWxsIGhvbGQs
IHRoZXJlJ3Mgbm93IGZlZG9yYSBjb3Jlb3MNCg0KUG9DIHdhcyB0YXNrZWQgdG8gWWFubiB0byBn
ZmV0Y2ggdGhlIElQIGFkZHJlc3MgYW5kIG90aGVyIGVhc3kgbWV0cmljcywgDQp3ZSB3aWxsIHNo
YXJlIG9uY2Ugd2UgaGF2ZSBhIG1pbmltYWwgc2V0IG9mIGZlYXR1cmUgdG8gZ2F0aGVyIGZlZWRi
YWNrLg0KDQplZDogYXJlIHlvdSB1c2luZyB0aGUgZGlzdHJvIHBhY2thZ2VzIGZvciB4ZW5zdG9y
ZT8NCg0Kc2E6IGlmIGl0J3MgYXZhaWxhYmxlIHllcywgYW5kIG90aGVyd2lzZSB3ZSBtYWtlIHRo
ZSBwYWNrYWdlIG91cnNlbGZ2ZXMuIA0KT24gZ2l0bGFiIHdlIHdvbid0IGluY2x1ZGUgdGhpcyBw
YWNrYWdlcywgb25seSB0aGUgYWdlbnQgY29kZS4NCg0KZWQ6IHRoZSBvbmUgaW5zdGFsbGVkIGlu
IGRvbTAgaGFzIGRpZmZlcmVudCBwYXJhbWV0ZXJzIGZyb20gdGhlIG9uZXMgaW4gDQp0aGUgZ3Vl
c3RzLCBpdCdzIHByb2JhYmx5IG5vdCBpbnRlbnRpb25hbA0KDQpzYTogd2UnbGwgbWFrZSB0aGVt
IGNvbXBhdGlibGUgd2l0aCB0aGUgdXBzdHJlYW0gcHJvdmlkZWQNCg0Kd2h5IGNyZWF0ZSBhIG5l
dyBwcm9qZWN0PyBkbyBub3QgZGVwZW5kIG9uIHhlbnNlcnZlciwgYnV0IGJlIGluIHhlbiBzbyAN
CmRpc3RybyBwYWNrYWdlcnMga25vdyB0byB0YWtlIHRoYXQgY29kZSB0byBidWlsZCBwYWNrYWdl
cy4gV2UgbXVzdCByZWFjaCANCnF1YmVzIHRvIGZvbGxvdyB0aGlzLCBhcyB3ZWxsIGFzIEFtYXpv
biwgbWF5YmUgb3RoZXIgZG93bnN0cmVhbXM/DQoNCnJlYWRpbmcgL2V0Yy9yZWxlYXNlIHdhcyBt
YWpvciBpbXByb3ZlbWVudCB0aGF0IHVzZXJzIGNvbnRyaWJ1dGVkLCBiYXNlZCANCm9uIGEgZGVz
aWduIHdlIHdyb3RlDQoNCmRpc3RybyBkZXRlY3Rpb24gdG9vbCBjYW4gbWFzc2l2ZWx5IHNpbXBs
aWZ5DQoNCmVkOiB3aGF0IGFib3V0IGJzZD8gaXMgdGhlcmUgYW55IGludGVyZXN0Pw0KDQpzYTog
d2UgZG9uJ3QgcHJvdmlkZSBwYWNrYWdlIHRoYXQgY2FuIGJlIGluc3RhbGxlZCwgaW5zdGVhZCBp
dCB3aWxsIA0KZmV0Y2ggdXNlci1jb250cmlidXRlZCByZXBvcyB0aGF0IGhhdmUgYW4gb2xkIHZl
cnNpb24gdGhhdCB3b3Jrcw0KDQplZDogYXZvaWRpbmcgbGludXgtc3BlY2lmaWMgZGVwZW5kZW5j
aWVzIHdvdWxkIGJlIGdvb2QuDQoNCnhpOiB0aGUgcmVwbyBpcyBlbXB0eQ0KDQpzYTogdGhlIHJl
cG8gd2lsbCBiZSBlbXB0eSB1bnRpbCB3ZSBoYXZlIGEgcHJvb2Ygb2YgY29uY2VwdCB2YXRlcyBj
YW4gc2hhcmUNCg0KZWQ6IGRvZXMgdGhpcyBuZWVkIHRvIGJlIGFuIHJwbT8gQSBsb3Qgb2YgY29t
cGxleGl0eSBpbiBDaXRyaXggaXMgaW4gdGhlIA0KcGlwZWxpbmUNCg0Kc2E6IGl0IG1heSBiZSBh
IG5vYXJjaCBycG0sIHdpdGhvdXQgYnVpbGRpbmcgYW55dGhpbmcNCg0KZWQ6IGlmIHRoZSBycG1z
IG5lZWQgdG8gYmUgYnVpbGQgZm9yIGd1ZXN0IGlzIHZlcnkgY29tcGxleA0KDQpzYTogaG93IHRv
IHByb3ZpZGUgcGFja2FnZXMgZm9yIGRpc3Ryb3MgdGhhdCBkb24ndCBwcm92aWRlIHRoZW0uIElu
IG91ciANCmJidWlsZCBzeXN0ZW0gdGhlcmUncyBibGFjayBtYWdpYy4gSW4ga29qaSB0aGUgZ28g
cHJvZ3JhbSBpcyBkb25lLCB0aGVuIA0KYnVpbGQgdGhlIHJwbSBhbmQgdGFyLmd6IGlzIGJ1aWx0
LCBiZWNhdXNlIGl0J3Mgc3RhdGljYWxseSBsaW5rZWQNCg0KZWQ6IHdpdGhvdXQgYmluYXJpZXMg
d291bGQgYmUgZXZlbiBzaW1wbGVyDQoNCnlhOiBkZXBlbmRpbmcgb24gZGlzdHJvIHRoZSBjb25m
aWcgZmlsZXMgYXJlIG9uIGRpZmZlcmVudCBwbGFjZXMNCg0Kc2E6IGxvY2F0aW9uIHNob3VsZCBi
ZSBkZWZpbmVkIGluIHRoZSBwYWNrYWdlIG1ldGFkYXRhLCBub3QgaW4gdGhlIHVzZXIgDQpyZXBv
IGJ1aWxkDQp1cHN0cmVhbSBkaXN0cm9zIHNob3VsZCBidWlsZCBtb3N0IG9mIHRoZSBwYWNrYWdl
cw0KDQp3ZSBidWlsZCBvbmx5IGZvciBzb21lIGRpc3RyaWJ1dGlvbnMgd2hpY2ggZG9uJ3QgcmVs
ZWFzZSB0aGUgdXAtdG8tZGF0ZSANCmd1ZXN0IHV0aWxzDQoNCndlIG9mZmVyIHVzZXJzIGluIG91
ciB3ZWJwYWdlIHRoZSBvcHRpb24gdG8gcGljaw0KDQpwYTogd2hhdCBsYW5ndWFnZSBpcyB0aGUg
UG9DPw0KDQp5YTogd2UgaGF2ZW4ndCBzdGFydGVkIQ0KDQpzYTogd2UncmUgdHJ5aW5nIHRvIHVz
ZSB3aXRob3V0IGFueSBsYW5ndWFnZXMsIHVzaW5nIHVkZXYuIFdlIGhhdmVuJ3QgDQpkaXNjdXNz
ZWQgd2hhdCBsYW5ndWFnZSB3b3VsZCBiZSBhcHByb3ByaWF0ZQ0KRm9yIGxpbnV4IGl0IHNob3Vs
ZCBiZSB2ZXJ5IHNpbXBsZSB0byBidWlsZA0KU3RhdGljIGxpbmtpbmcgaXMgdmVyeSBjb252ZW5p
ZW50IGZvciB2YXRlcw0KDQpwYTogdGhlcmUncyBhbiBvY2FtbCBwcm9qZWN0IHVzaW5nIGNvc21v
cG9saXRhbiBsaWJjIGFsbG93cyB0byBydW4gDQpzdGF0aWMgYmluYXJpZXMgb24gd2luZG93cywg
bGludXggYW5kIGZyZWVic2QNCg0KeWE6IHNlZW1zIHZlcnkgc3BlY2lmaWMsIHJ1bnMgcmlzayBv
ZiBub3QgYmVpbmcgYWNjZXB0ZWQsIGl0IHNob3VsZCBiZSANCnNpbXBsZSB0byBjb2RlDQoNCmFu
OiBjb21wYXRpYmlsaXR5IGluIHB5dGhvbiBpcyBub3QgZ29vZA0KDQpzYTogbm90IGFsbCBkaXN0
cm9zIHdpbGwgaGF2ZSBweXRob24NCg0KZWQ6IG1heWJlIGEga2VybmVsIGRyaXZlcj8NCg0KcGE6
IGl0J3MgbGludXgtc3BlY2lmaWMsIHRob3VnaA0KDQplZDogd2hhdCBkbyBvdGhlciBoeXBlcnZp
c29yIGRvPyBrdm0gYWdlbnRzPyBxZW11IGFnZW50Pw0KDQphbjogbmV2ZXIgc2VlbiBhIHFlbXUg
YWdlbnQNCg0KeWE6IHRoZXJlJ3MgYSBoZWxwZXIgZm9yIGJldHRlciBtb3VzZSBpbnRlcmFjdGlv
biB0aHJvdWdoIHFlbXUNCg0KZWQ6IHdoYXQgbGFuZ3VhZ2UsIGhvdyBhcmUgdGhleSBkaXN0cmli
dXRlZD8NCg0KYW46IG1heWJlIHRoZSBzb3VyY2UgaXMgaW4gcWVtdQ0KDQp5YTogdGhlcmUgbWF5
IGJlIGEgZHJpdmVyIGlzbywgY2FuJ3QgcmVtZW1iZXINCg0KYW46IGh0dHBzOi8vd3d3LnFlbXUu
b3JnL2RvY3MvbWFzdGVyL2ludGVyb3AvcWVtdS1nYS5odG1sDQoNCnNhOiBjb3B5IGFuZCBwYXN0
ZS4uLiBzdXJwcmlzaW5nIHRvIHNlZSB0aGVyZSB3YXMgbm8gZWFzeSB3YXkgdG8gc2hhcmUgDQpj
bGlwYm9hcmQNCg0KYW46IHhlbnNlcnZlciBoYXMNCg0Kc2E6IGJ1dCBvbmx5IGZvciB3aW5kb3dz
LCB3aXRoIGEgdm5jIGNvbnNvbGUgZm9yIGxpbnV4LCB0aGVyZSdzIG5vIHN1Y2ggDQp0aGluZy4g
TWF5YmUgaXQncyBlYXN5IHRvIGFjdGl2YXRlIGJ1dCB3ZSBkb24ndCBrbm93IHRoZSB3YXkNCg0K
ZWQ6IHZuYyBzaG91bGQgaGF2ZSB0aGF0DQoNCihub2JvZHkgaW4gdGhlIHJvb20ga25vd3MpDQoN
CnlhOiBpbiBxdWJlcyBoYXMgaXQncyBvd24gcnBjIGluZnJhc3RydWN0dXJlIHRvIGNvbnRyb2wg
YWNjZXNzIHRvIA0KY2xpcGJvYXJkIGFjY2VzcyB0aHJvdWdoIHZjaGFuIFRoZXJlIGFyZSBzaG9y
dGN1dHMgdG8gc2hhcmUgZ3Vlc3QgDQpjbGlwYm9hcmQgdG8gdGhlIGdsb2JhbCBvbmUgYW5kIGJh
Y2sgY3RybGMgY3RybHNoaWZ0YyBldGMsIGl0J3MgYSANCnNwZWNpZmljIG1lY2hhbmlzbQ0KDQpl
ZDogd2UgY291bGQgcmV1c2UgdGhhdCwgbWF5YmUNCg0KeWE6IGl0J3Mgbm90IHZlcnkgYWR2YW5j
ZWQsIG9ubHkgdGV4dC4gTWF5YmUgcGF0Y2hlcyBuZWVkZWQhDQoNCnNhOiBsZXQncyB3cmFwIHVw
DQoNCnRoYW5rcyBmb3Igam9pbmluZyBldmVyeWJvZHksIHdlJ2xsIHNoYXJlIHRoZSBub3Rlcw0K

