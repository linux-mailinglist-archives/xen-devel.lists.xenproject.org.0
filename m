Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E47C25464FF
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 13:02:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346380.572165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzcOc-0001oO-HC; Fri, 10 Jun 2022 11:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346380.572165; Fri, 10 Jun 2022 11:01:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzcOc-0001lO-E0; Fri, 10 Jun 2022 11:01:42 +0000
Received: by outflank-mailman (input) for mailman id 346380;
 Fri, 10 Jun 2022 11:01:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d6gm=WR=citrix.com=prvs=15368b7f5=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nzcOb-0001lI-AO
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 11:01:41 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2b89d59-e8ac-11ec-8179-c7c2a468b362;
 Fri, 10 Jun 2022 13:01:39 +0200 (CEST)
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Jun 2022 07:01:31 -0400
Received: from DM5PR03MB3386.namprd03.prod.outlook.com (2603:10b6:4:46::36) by
 PH7PR03MB6942.namprd03.prod.outlook.com (2603:10b6:510:157::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Fri, 10 Jun
 2022 11:01:29 +0000
Received: from DM5PR03MB3386.namprd03.prod.outlook.com
 ([fe80::a932:ea60:fb82:12b7]) by DM5PR03MB3386.namprd03.prod.outlook.com
 ([fe80::a932:ea60:fb82:12b7%7]) with mapi id 15.20.5332.015; Fri, 10 Jun 2022
 11:01:29 +0000
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
X-Inumbo-ID: b2b89d59-e8ac-11ec-8179-c7c2a468b362
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654858899;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0PpqRd62Ww4ABzLBXizCPsL0GJo+mfrFrxck1m5u3Ew=;
  b=Tnr1Ko8xk4q71Kk1n0mR8ZKMf0i5iETqL9ZenkUT6wrZp336XyaYvRpX
   gSeJuN7Wh9vUTAnuj+d+btEKicnDXokKeeRiFnLe330zgFEfai/ni+8ak
   z1nM5H7XmPG86ZX/QiBsjRz1DR0cJGhUzbRuYOvDb5/85JW4jeaDyugXL
   c=;
X-IronPort-RemoteIP: 104.47.58.101
X-IronPort-MID: 72655863
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:NLzRya8/En4aIjfmoLMeDrUD8H+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 GpKCz+EPf3bYGT2ftkgaIrj/B9QuZ7dmtVrSwZoq3s8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw34HhW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnazseB94D5Hho+kmeSJHE39OD/VD5oaSdBBTseTLp6HHW13F5qw2SW0TY8gf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHvWMvIcBtNszrpkm8fL2R
 cMfZHxKZRDJZxRJN38cCY4knffujX76G9FdgA3P+/dqszaIpOB3+OCwLsvbIO7JecJ6sHuan
 EnbwWrTJjhPYbRzzhLAqBpAnNTnnyn2RYYTH72Q7eNxjRuYwWl7IAISfUu2p7++kEHWc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUHBBqlz6PV50OVAzYCRzsYMNg+7pZuHHoty
 0ODmM7vCXp3qrqJRHmB97CS6zSvJSwSKmxEbigBJecY3+TeTEgIpkqnZr5e/GSd17UZxRmYL
 +i2kRUD
IronPort-HdrOrdr: A9a23:87qk362ONiBdq/iYZfRVhwqjBRByeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHQYc2/hdAV7QZnidhILOFvAv0WKC+UyrJ8SazIJgPM
 hbAs9D4bHLbGSSyPyKmDVQcOxQj+VvkprY49s2pk0FJW4FV0gj1XYBNu/xKDwVeOAyP+tcKH
 Pq3Lsjm9PPQxQqR/X+IkNAc/nIptXNmp6jSwUBHQQb5A6Hii7twKLmEjCDty1uEg9n8PMHyy
 zoggb57qKsv7WQ0RnHzVLe6JxQhZ/I1sZDPsqRkcIYQw+cyjpAJb4RGIFqjgpF5d1H22xa1O
 UkZC1QePib3kmhPF1dZyGdnTUIngxeskMKgmXo/EcL6faJOA7STfAxy76xOyGplHYIrZVy1r
 lG0HmesIcSBRTcnD7l79yNTB1ykFGoyEBS2NL7okYvJrf2UoUh27D3PXklY6soDWb/8sQqAe
 NuBMbT6LJfdk6bdWnQui1qzMa3Vno+Ex+aSgxa0/blmAR+jTR81Q8V1cYflnAP+NY0TIRF/f
 3NNuBtmKtVRsEbYKphDKMKQNexCGbKXRXQWVjiaWjPBeUCITbAupT36LI66KWjf4EJ1oI7nN
 DbXFZRpQcJCjbT4A21reh2Gzz2MRSAtG7Wu79jDrBCy83BbauuNzGfQ1YzlMblq+kDA6TgKo
 SOBK4=
X-IronPort-AV: E=Sophos;i="5.91,290,1647316800"; 
   d="scan'208";a="72655863"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mnJWOGppM/8HnHM2TIz0IVluyRafwnjXKSw0pE480zomsqcA8X+j6KseuLyf/U3xwBDFGZYUL0PEJ160bCVJQTmOlj5F8xiSCmqaauGCUPlQkmxeSB7/TpsXcWp9tu/BlINsokBFrh+2fDY0uOz78zwCFeQNhO2eva4I6ovTfPkaZQTs5r5xbAheVrBgjrktEvfiz5ipACJToJ48fcu3xJQ1eB7PPhRu4HBKL28KX4zeXFvajMpNcG4pB0ukxbEvrAVYX32HZiWleYclrvczbFKvuv/obICUtRyTt8IuYyC8mF5cpoQfUFW7eU2nZR2qxsft5Qwuy4WnXtMVVSvAKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0PpqRd62Ww4ABzLBXizCPsL0GJo+mfrFrxck1m5u3Ew=;
 b=Ry+DhEFypzGw/UWCKq2rx5nKjtMYdsOCURPhOI6qvPs6HvDOT3zY3usXGeuSHQRXAHBmDav0O2taUG2sXKgKVyPNnBePgQ3VXprvd7JcaP8qXGbXVcMiAeHwOMyYYsRwykEZbeT6L+Vc7Hul/vYVK1aaCXacPO5F1dDRv2ACLbArSVEIuCT+uMVx0l5BJib0fadbdcC4qQthGV095STlPfUw39U9dOakQKAI30SL6qnA/4C/Agn5rgB0Vra0hN6mJCr+sagS3KB1HpWxBVa0tXnTkWUBok+dxCOtLgw9BT0dfr/kQGf/IS1dbQO0M4VcXxsHXs1JJbyN/EP+s1sZ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0PpqRd62Ww4ABzLBXizCPsL0GJo+mfrFrxck1m5u3Ew=;
 b=fgc0JoyKXsEY2UF6L0zgyT+1PtyLacS+2P3mgGOtgzURz8UN7u7/NiqzJraFhaMeEzU3zbsAR7cBjarHtA8l2MQxg0qRA19a0lhhSm+Qsy99Dm7doUeIW6eyuqEwP9v+RUOXXIKPrPxhojointn3I/pSZQfVtB0RGgIWB5IUylw=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] x86/hvm: Widen condition for is_hvm_pv_evtchn_domain()
 and report fix in CPUID
Thread-Topic: [PATCH v3] x86/hvm: Widen condition for
 is_hvm_pv_evtchn_domain() and report fix in CPUID
Thread-Index: AQHYarsTV0eGhfiv2kicWrZcofLe1a0uLGIAgBpxAoA=
Date: Fri, 10 Jun 2022 11:01:29 +0000
Message-ID: <6f038c14-fdc4-4271-5a46-bd676d3dda02@citrix.com>
References: <20220518132714.5557-1-jane.malalane@citrix.com>
 <27a9ae9e-07fa-8300-d5b9-f9a88e4a1754@suse.com>
In-Reply-To: <27a9ae9e-07fa-8300-d5b9-f9a88e4a1754@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bf07972-93c2-471f-d6d0-08da4ad0924e
x-ms-traffictypediagnostic: PH7PR03MB6942:EE_
x-microsoft-antispam-prvs:
 <PH7PR03MB694241A79FDCCEEACF3FBA9E81A69@PH7PR03MB6942.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 gDM1vjKf65CLkU0eVh+5j0KR56ME+ILIhonyUxkSLNy6m/rKsKzMv/FkpiVw6L5phRTGtgQLL/qwji4qX3onD72p8x2aY1sgkpdxhl/p0gJMnlzegVBhJm8i/OQclIXK4lefvP7r5CtPnbRmPe0XA+OAdjMtdD1rfwmF/fq9G91vEq1AzzAtDwaSbJnbMxHy0iOaTDnB+s46MjcvU1WVv0r7HJU5jUKq6oJtEleUvHzyhuUKOMnP051T9S1CG+LcFyPm6ZgiH9cYEDOv7ivwUr9BMz2jykWQAvo/bsdPPfvDFUZy4bdUNRoyQ0/AAcITIXy3s5Lfyedc/lS7zWq6Z6c5P7Hi5YG4X6AcP4ZIueu1ZPYlc1S22bPL+0OTI54ho+UT1hmYsBgkoHmTkApK2KDYupnvT5HL5K4TjanbsAf29GMakIS78r0Pk8AtqREuLdv1+AgGRsS1DN6CVk9ZsPGHh0ON5LAIZpth3uFUIFzsshMWtJE5JMTnuOixHbHjiiP7tFcF97ZGcZ4MtwiH8cgFVMAO9JKMbwUXCTCoeTTgYkftori2F1T0bR+WxUlHHpmWGirfn63BqVreeE5moK+x4bm96GMraUsv4x5zQ+yUbHdKN/5FOi4G9jOh8fD99V+ZtF+cBKSFAUfdJ57dZoNo5Tm/Nq5e9eHiz7vvrREGm6kfDe+7gCe5b8Vt/sojHopUKtU7NjnBAeZGzf8icTOS83UGqBWv8ovT71WUNWA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(31696002)(2906002)(6506007)(316002)(38070700005)(86362001)(54906003)(8936002)(6916009)(508600001)(186003)(38100700002)(2616005)(5660300002)(122000001)(8676002)(26005)(6512007)(31686004)(82960400001)(4326008)(91956017)(64756008)(53546011)(76116006)(83380400001)(66446008)(66476007)(66556008)(66946007)(71200400001)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SmxYTjBCQXgvOEoxZ0pQRWZWSFVDanI0QmdPNUxlWXJkUVJFNjNJWTFGbEE5?=
 =?utf-8?B?dHVHZXMwRkZSbGFzVVRUQkxWTDJ3VExzZFo2SGdZL0dtTkdNcTRaUndnckVu?=
 =?utf-8?B?eHhJSFJOUUFwR3llWENlTVhXRFc5bitUU1pTZkhaeUZZRmNQZk5rdFp5Qlgv?=
 =?utf-8?B?Y0dBOUxUM1QxMmNpTk9YUG9UdlpzV2lsNFJsUTRRUEVWcy9vb0dwaEUzY3Z5?=
 =?utf-8?B?MjZjY2hka2R0TVhYSHpEZHA3TzJNWTlMeVJlcWE3N2liclQ3dzBRcTRTSHBq?=
 =?utf-8?B?UkE5alYvb3d0aGJqQ1QxTXBmdWZYcFUxOWVRVmlCbVNRQS9OcGdzcXZHc0NS?=
 =?utf-8?B?TTJGTDdzZlBQczZzQkRXY1FtSXpZRXBCNWtIaUZMaTVxRkwvNUhDSGJubFM5?=
 =?utf-8?B?bkpxQVhWVHkyR3A0Sm9jMXFMcWtEK05RSkhwdjV4TkFCUkVpM0JWVEthMW9k?=
 =?utf-8?B?MkF0NFEyVFNUS3JuL2hQN2JPeURBdFNhaklaVVR2OWsxazM2YlZLT1phaGtp?=
 =?utf-8?B?T0ZOVllEclBLRHIxRncwNi9pTnE0eWNqcTFiWUUySmwxWEVNNnNISHR0VHZZ?=
 =?utf-8?B?Q3B6S3RPRzFtWVhsZmV2dmovU3RKcHVNcnlHakRicjllVTdSN1FFV2tTQUx1?=
 =?utf-8?B?ZXpQeHJyd0FQOVd5VEk1a3hNeHVTdjQ5WkFicks0ZVJKYjc3cW1pMk9kOGsz?=
 =?utf-8?B?TFBpRmpmcWNBU2s1M3lPZDg0Um9iRVgrc2RFdW14cUhaakNIS2NtaWlaZzly?=
 =?utf-8?B?SVUyS1F2QXlCaE9NSmFQd2JrVi9TZ2ZJRHlRbXZNQXdpdlRkeGZidnNIRjN0?=
 =?utf-8?B?TVd3YlNiTzgrNytNTWxKOHIrK0hGaVZNb3IwU3R1TUZrZHlxZXNoeS9MY2dh?=
 =?utf-8?B?aktaN1NhMFBVOFF5dmJ5Wm9hTWhGb1hkcVc4TmRCOTJEb2ozMUMyMDdRbFBO?=
 =?utf-8?B?MjRDV0FGNW1oSEY5eWk0QWlNVk5KQ1RHM1NHcnZyUzdFY0RwR29Va3J2ZHN3?=
 =?utf-8?B?QWxGSTgwYTZhZlV3ZmNucUwvRnl1anZmTmgzN0F4d0Vud0libW5GYnBtWWMr?=
 =?utf-8?B?V1JVU25kWmlZZzFyQklLSHlHRU9LTVIvTGhaMjRLMzFxOGhnaldYdVV5YTBh?=
 =?utf-8?B?Z0hnT1N2NFAxSnh2dElESzhkSXFoUVNORkFMUU0yeFNpRDNWOE8vWFQyZkR2?=
 =?utf-8?B?NEhuNkJtWGYySUlrODdWeGp1Unh3UVN1a0t4a21rajMyVFU5RzNPc2V2cmtv?=
 =?utf-8?B?V0R4YSs0eTlrZDhod0VzdFZKL0tHYXprc3haKzNIdTNDbDlBbDlwWEtwQmRY?=
 =?utf-8?B?NGNzUlU2QVhMcm1kMkxNc3hFUEg1OWpFb2JnTWN5bWNycUVHU05qQUd1Z0N0?=
 =?utf-8?B?Um5NTjBWNnNuZGVUK29qdTFGblA0Y3p5Qk5EbXFwWEdRV2dEQjBiMElNbjhI?=
 =?utf-8?B?Zm5lS2xKVENZQkpLOThXbHRKYW1saFFGU0wzV2wzWTNOWVFWam5GY3crdk1s?=
 =?utf-8?B?NjBPUTV3NGI4RDVFMSttU3UzaFdOMiswamR5R2JKV0thRGtzRGNSOXo2WnpT?=
 =?utf-8?B?WHZPdnNIQWFUbDBCREdlUTJ6N3N4TGZFdWU3aTd6WnJkTFAxeEtxY0FJK2tK?=
 =?utf-8?B?aTFMTElFL3lhOXptRGFlcEZXZHVSVCtad0QyV2g2SjNHV3YzdW5nb1BDTUlQ?=
 =?utf-8?B?bXlZMndMYlFKRlZxeE1aZEViNFhsZnZVSUVmMTNxMnpnNk5HcEszeDQ3V1JZ?=
 =?utf-8?B?K1FIVmFGR0hUNHd0eHgwRkgzVGdDbS91dmNZOG1SM200d2dCbEF6NnhaMFBQ?=
 =?utf-8?B?S0ZhaXE5UmUzMWw3WTRYUS84elllYmFCYkh6Mkd1V1N6SmFRRjNrYXhLaUFx?=
 =?utf-8?B?R2RqK2F1T25OOGFXMWthRjVoWXVXQkJJNk1BeUhoVjlmTVRxaUdZdTBuWUNQ?=
 =?utf-8?B?OXYrWkw3MXE5VWIvQlJJenlNeHYwTUJzSGZwVko0S1UrVkFqZDJEMklMcjJz?=
 =?utf-8?B?dFgrS2VZbjNMZm1IQ08rTGdLR0ZKUStUQWQvN1dQcWFrdERMam9Iei9DSTV5?=
 =?utf-8?B?dDZkcHdwS3VRc05kd3liUWlHOVlkOUVRRFFEVExBekRFeERvYnV4cW4weGZ3?=
 =?utf-8?B?STZwcmE3MDBkSUloNmt2TEJOa1FBRFFJcVZtajlHSDlKV3h6ek83RHRuU01Y?=
 =?utf-8?B?N1lRczlreTROZnRRTmFJSkh1Vk41SVB0VlpLS1dUZzZ1c2tsYjJCMHVmakJp?=
 =?utf-8?B?anVxeFNUNit4MHlZcDdjcGhzY0gwY2JEWVJmU0wvSU4wczdDS3l2Mk1zcXdJ?=
 =?utf-8?B?eFB1TTMxUTdKRVF0dVBsQi9WclRIMnpFU2ZLY3cxQWFzOGxWbnpGUUNCbWZv?=
 =?utf-8?Q?L8W0SRCAA9WvN36Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <25658EDF9923ED41A019F7DA828C501A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf07972-93c2-471f-d6d0-08da4ad0924e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2022 11:01:29.4327
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wdn6wHWRyioI4vUu3akkqAougZaWroCHTqk1YMet0ibGHoopHr4AvWAYKKEZepMLrWT6GMgG/fbxjfCBUUUwl9FrH4hCZfoHJp37ufK+3f0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6942

T24gMjQvMDUvMjAyMiAxNjoxNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFtDQVVUSU9OIC0gRVhU
RVJOQUwgRU1BSUxdIERPIE5PVCByZXBseSwgY2xpY2sgbGlua3MsIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZS4NCj4gDQo+IE9uIDE4LjA1LjIwMjIgMTU6MjcsIEphbmUgTWFsYWxhbmUgd3Jv
dGU6DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vZG9tYWluLmgNCj4+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9kb21haW4uaA0KPj4gQEAgLTE0LDggKzE0LDE0IEBA
DQo+PiAgIA0KPj4gICAjZGVmaW5lIGhhc18zMmJpdF9zaGluZm8oZCkgICAgKChkKS0+YXJjaC5o
YXNfMzJiaXRfc2hpbmZvKQ0KPj4gICANCj4+ICsvKg0KPj4gKyAqIFNldCB0byB0cnVlIGlmIGVp
dGhlciB0aGUgZ2xvYmFsIHZlY3Rvci10eXBlIGNhbGxiYWNrIG9yIHBlci12Q1BVDQo+PiArICog
TEFQSUMgdmVjdG9ycyBhcmUgdXNlZC4gQXNzdW1lIGFsbCB2Q1BVcyB3aWxsIHVzZQ0KPj4gKyAq
IEhWTU9QX3NldF9ldnRjaG5fdXBjYWxsX3ZlY3RvciBhcyBsb25nIGFzIHRoZSBpbml0aWFsIHZD
UFUgZG9lcy4NCj4+ICsgKi8NCj4+ICAgI2RlZmluZSBpc19odm1fcHZfZXZ0Y2huX2RvbWFpbihk
KSAoaXNfaHZtX2RvbWFpbihkKSAmJiBcDQo+PiAtICAgICAgICAoZCktPmFyY2guaHZtLmlycS0+
Y2FsbGJhY2tfdmlhX3R5cGUgPT0gSFZNSVJRX2NhbGxiYWNrX3ZlY3RvcikNCj4+ICsgICAgICAg
ICgoZCktPmFyY2guaHZtLmlycS0+Y2FsbGJhY2tfdmlhX3R5cGUgPT0gSFZNSVJRX2NhbGxiYWNr
X3ZlY3RvciB8fCBcDQo+PiArICAgICAgICAgKGQpLT52Y3B1WzBdLT5hcmNoLmh2bS5ldnRjaG5f
dXBjYWxsX3ZlY3RvcikpDQo+PiAgICNkZWZpbmUgaXNfaHZtX3B2X2V2dGNobl92Y3B1KHYpIChp
c19odm1fcHZfZXZ0Y2huX2RvbWFpbih2LT5kb21haW4pKQ0KPiANCj4gSSBjb250aW51ZSB0byB0
aGluayB0aGF0IHdpdGggdGhlIHZDUFUwIGRlcGVuZGVuY3kgYWRkZWQgdG8NCj4gaXNfaHZtX3B2
X2V2dGNobl9kb21haW4oKSwgaXNfaHZtX3B2X2V2dGNobl92Y3B1KCkgc2hvdWxkIGVpdGhlcg0K
PiBiZSBhZGp1c3RlZCBhcyB3ZWxsICh0byBjaGVjayB0aGUgY29ycmVjdCB2Q1BVJ3MgZmllbGQp
IG9yIGJlDQo+IGRlbGV0ZWQgKGFuZCB0aGUgc29sZSBjYWxsZXIgYmUgcmVwbGFjZWQpLg0KPiAN
Cj4gSmFuDQpJIHdpbGwgcmVwbGFjZSBpdCBpbiBhIG5ld2VyIHZlcnNpb24gb2YgdGhlIHBhdGNo
Lg0KDQpUaGFuayB5b3UuDQoNCkphbmUu

