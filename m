Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C714A62B005
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 01:29:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444093.698919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ov6HK-0002EF-3K; Wed, 16 Nov 2022 00:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444093.698919; Wed, 16 Nov 2022 00:27:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ov6HK-0002C0-0B; Wed, 16 Nov 2022 00:27:46 +0000
Received: by outflank-mailman (input) for mailman id 444093;
 Wed, 16 Nov 2022 00:27:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JCFo=3Q=citrix.com=prvs=3126b6494=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ov6HI-0002Bu-5G
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 00:27:44 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7aa0401c-6545-11ed-91b6-6bf2151ebd3b;
 Wed, 16 Nov 2022 01:27:41 +0100 (CET)
Received: from mail-co1nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Nov 2022 19:27:34 -0500
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by DM4PR03MB6858.namprd03.prod.outlook.com (2603:10b6:8:41::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 00:27:29 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::c98c:5b85:6d10:4860]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::c98c:5b85:6d10:4860%5]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 00:27:29 +0000
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
X-Inumbo-ID: 7aa0401c-6545-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668558461;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=bDY1n0zx5XrQfBGzlxZ1xOw4SH5C4MpYOVQornj6lmM=;
  b=CjU2SCSKfP8hJyaYr8b6IjPvDW8ZmF2MvL0Z6ZmWLkES0J14kUxgWhQh
   AKoaCgVGToNJXG/t/UF1WSh/McI9T+XGDu6NyGEj+I2+6FLKc0wnsuFqW
   XKZ+LbS+crQ+AQsssT0rP/BgppxO8TifohfAcRXbeIJPKsmK34E2C8XAs
   E=;
X-IronPort-RemoteIP: 104.47.56.170
X-IronPort-MID: 87440676
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HZYwA66qJJqrU111g7uXSgxRtN7GchMFZxGqfqrLsTDasY5as4F+v
 jBMDWmGb6uMamf1e4x+Povg90ID7JfUmt9mQAE5/itnHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKkS4QeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m8
 qdAJD0fVB66l9m03+q9F7Ro2dhkFZy+VG8fkikIITDxK98DGMmGaIKToNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Okkooj+CF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNJNSOHgqKE06LGV7kdIAkUSZXCbnfuWlEi1cZVRe
 nEQ3wN7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OcWSDowx
 xm2ltXmLTV1tfueTnf13rWeoC62OCMVBXQffiJCRgwAi/HhvYUygxTnXttlVqmvgbXdAirsy
 jqHqCw/gbQ7jsMR0ai/u1fdjFqEuZzhXgMzoALNUQqYAhhRYYekY8mj7gHd5PMZdYKBFADe5
 D4DhtSU6/0IAdeVjiuRTe4RHbavofGYLDnbhl0pFJ4kn9iwx0OekUlryGkWDC9U3gwsI1cFv
 Ge7Vdtt2aJu
IronPort-HdrOrdr: A9a23:Q/A3XqvsRVrEU9YUD0hisTao7skCXoAji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKceeEqTPqftXrdyRGVxeZZnMffKlzbamfDH4tmuZ
 uIHJIOb+EYYWIasS++2njBLz9C+qjJzEnLv5a5854Fd2gDBM9dBkVCe3+m+yZNNWt77O8CZf
 6hD7181l+dkBosDviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeF+aP3CB+R2zYZSndqza05+W
 bIvgTl7uH72svLiyP05iv21dB7idHhwtxMCIiljdUUECzljkKFdZlsQLqLuREyuaWK5EwxmN
 fBjh88N4BY6m/XfEuyvRzxsjOQngoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx8+L
 gj5RPbi7NnSTf72Ajt7dnBUB9n0mCup2A5rOIVh3tDFaMDdb5qq5AF9k89KuZDIMu60vFjLA
 BdNrCa2B9kSyLdU5kfhBg3/DWYZAV2Iv5BeDlbhiXa6UkMoJkz9Tpk+CVWpAZ9yHt6cegF2w
 2MCNUXqFkFJPVmEp5VFaMPR9C6BXfKRg+JOGWOIU7/HKVCIH7VrYXriY9Frd1CVaZ4u6faoq
 6xJm9wpCo3YQbjGMeO1JpE/lTER3i8Ry3kzoVb64JisrPxSbL3OWnbIWpe2PeIsrEaGInWSv
 yzMJVZD7vqKnbvA59A20n7V4NJIXcTXcUJspIwWk6IoMjMNor239arOMr7Nf7oC3IpS2n/Cn
 wMUHz6I9hB9FmiXjvijB3YSxrWCzjCFFJLYd3nFsQoufsw39d3w3koYHyCl7G2ACwHtLAqd0
 1jJ76imr+npACNjBT101k=
X-IronPort-AV: E=Sophos;i="5.96,167,1665460800"; 
   d="scan'208";a="87440676"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3uluyybXsxoqMah8vfWsgxJNe6kmO78nbaNxpmnu2tHcmnLl5CBTxe5+TzZcntkyng5r1OHLvS6lgkW/Ot2mbqJ88NzrmEOBezWtTxCOmGp/mweyaMJ4mLkNLyk3P4uaFzKrbmDsZ/SWWELN5/w7mV7i3n+kXEMVVnevleVI1kDDMEvykGkci9uEGmytmJEYgnAHrmOhI4TyM4+warvHfFP0xum35vEJU3pWPIdWMsYhhJF2e8aklnT0kaSA9fFzsszhkdwDLXtqkNqEfcszNNkRosdhPLEu/kTHagBkvT/8QwLE3GsWhmTJNlysjIVCCGkzvEvgHd/tXLe+Qmx3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDY1n0zx5XrQfBGzlxZ1xOw4SH5C4MpYOVQornj6lmM=;
 b=UjduwSwfdfu4pAkvtAzH05EQTnJodKwnEtJp/9p3Q/33eJCoZz3NQoSIVpPuaoZG8NPCXzeOHK3DSMqIcZr1y0Kc6ryxYDh1OfetdsyjeayYaDRiUJYBwKAndsq7WTBK/m9FJ11Xry3uJIWKbSuA0TTpsncqO1/XHGjOntsMhx3e7ZyDxQ9XavJqfRcYxN2w+E+9R7dzCFAcAuBoXhG15hqEUiOm5lNLNK1TUE9P4wJ+hAypEo5FPAXIbkk4Og85JG8tZasRir6GQyvgIeoQEVFK9o2h2pgxNrrvXobftNn+/50IY768OErEwzwKZLHZ0he8KfbtzVkLincsbDg6iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDY1n0zx5XrQfBGzlxZ1xOw4SH5C4MpYOVQornj6lmM=;
 b=XzWxQlamHy2JG+l/wOe+mb+YMCInxmIBExueQOJTb5ISn29t2GsYDyUKPDRTAWInqfdC295qA4AQqbn21CdiSuXOqCaSLLgHauU9vv59MN9552bbRnjR59n+anWdksy6KgHdQJqorzS2Q2HgRIZRGDQs2xIvdF/lD1e+81+sAws=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Henry.Wang@arm.com" <Henry.Wang@arm.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH for-4.17 v4 0/2] amd/virt_ssbd: refactoring and fixes
Thread-Topic: [PATCH for-4.17 v4 0/2] amd/virt_ssbd: refactoring and fixes
Thread-Index: AQHY+PYA4G97GRMYN0qVEBZj+Syg765Asn+A
Date: Wed, 16 Nov 2022 00:27:29 +0000
Message-ID: <463e03d5-7a07-f26a-de24-13c4a12e8c20@citrix.com>
References: <20221115132657.97864-1-roger.pau@citrix.com>
In-Reply-To: <20221115132657.97864-1-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR03MB3618:EE_|DM4PR03MB6858:EE_
x-ms-office365-filtering-correlation-id: 46f5e98f-4022-485e-b91b-08dac769586f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 jnirkrFlEFXg9k7CAXaNMhIjjqnP66TKhfogoQCoZvwyOlc6kq4ENdiGG1v9M0gvKufF2+1rKWeBbN27OOldVVqkX7fIqwo4TB1Qld5qCb2HvFonTBQ5Dega3YOzadTVHuppZZnf0wptiaqug+rXjS/IJL4UiHR0ib4POU1jUJq9nnMPO+2VrhI/d6G243rbuFozGtoCnvW39ulMqvAbVXEkIYpbfkEmKV+3y+vjQ2SccknOOSvIWHacKiimRrU1DhOpPIj/aa7WGXsRHFmO6j6Zj3Wue7Bja/JTrgoCtNxc08xHQ3kSos8voKnAclZKgMWXd9nywpvLZPrF1OCqshKNrYTHzI909llv6jpORiMFJuBgZieGZolgcmlKZmUG5NYLsp5e7xsa8raq1j13EvR5UZZCx+53jVeWOIPAMloM2j82/UgaSYNPQJRHJCTjrFQ8aTp6S3VlONneNvw0t/ZF1qI9nwXaLZ17Qp8/FWUIhwLSTWXcP+wVM1CFOj93kVHBBSuHBnExz8vKAtVnklOef1EajFgF5pMdO6YfCBe1fbcwdQYfcOOmjIH0Sz2oFcGyMVBVfLojZJnDrbf3Oj+Nz7e88zyNU0Sk1tfw2h0HbyBDi8HRo0lEL7PoI9v1RkXN9P/rL8VlZG8PLuKpppzrdjBk1nOvZxF6eP9LTFMlmG/M03GqHhXcYiKZxB9wbwz+e0ULfz87nOT6OtoJuVoxUHNxDBkIwLoFmvWju0UYrtcXkme6VW8PERpogdTzGBkBpQOFGrz1JW4Men+F8/P1GMvqUyF73eylmeZrs+HCgI9eTMxqLnsXcPCZQFY4soGW0XyN0N2I1TvA2fCDHg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199015)(6506007)(316002)(186003)(5660300002)(26005)(66946007)(66556008)(66476007)(66446008)(6512007)(4326008)(64756008)(8676002)(53546011)(38070700005)(31686004)(110136005)(36756003)(6486002)(478600001)(54906003)(76116006)(91956017)(8936002)(41300700001)(2616005)(2906002)(71200400001)(83380400001)(66899015)(86362001)(122000001)(82960400001)(38100700002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MXhoaVNoTTBRdUVLcHFxZElHTWczZ3JITVVCaWRVeFpzbUt0VkVtdS8yNlQw?=
 =?utf-8?B?ekhBY3hFM3dHT3BwZHp3cFNaUGNwNUV4MmR0d095dlNLZGFFaHMzRE4xejVo?=
 =?utf-8?B?cWRkZHNwSTJoeDIreHprSmVTazFxNUNiY2tMNUpldVpHSmZaNXdwcTBQVEdY?=
 =?utf-8?B?MkJMSTJVVHpOWmorWVhmK3RFR3RJTjIxNXF5YnRNMUhDNHA4YXRqSXFhMGZm?=
 =?utf-8?B?RzV3WU5ZS0U1b2dUa0ZmdDBadFRieDJKOXVjdWlYVmo4Z0VqR0ZUaEN4SjhS?=
 =?utf-8?B?WFNXN1h1S05ZNjAvanBwVVdYNmVkNTJuc2thb1dFWUQwVW1RYlFzNGllMDhI?=
 =?utf-8?B?ZnNiYVZKT0ljeThnWTBZQUdkWjNEcVZmVUZ6c1Y3RXM4WGNyaXRZdzM0L2Vs?=
 =?utf-8?B?cTA2WEd4UURXSm1ISnBJcXlKREZGQk5wRldkTlZvY0RBYW55M0YwMlhEUlVa?=
 =?utf-8?B?YnYvdlgzKzNkK3I4WmNkdFgwUW5xbE10ellKZU1Gc2dTOVQwNGdyWWRrRGd1?=
 =?utf-8?B?bE95ZDg5TEVuMW0vR0hURHpCYklOU1JwOHNxMG5nZ2FDdENscUs2c2FndEt4?=
 =?utf-8?B?WEhRL0VFR0Q4NmI5ZVlJemR2cHEvNXdWbTlTZWlBNVgzY1k3alhHVmFQYy8r?=
 =?utf-8?B?R0JWSm1XeWpHb2U3bFhUeHM5amVickNsRSsxdHp5WUIrUHZ5bGJaeFdlZVdj?=
 =?utf-8?B?ZmQ5Ti9Ka2dCTUpZdGtpTlNZZG5nUGNUbmE2b3B6TlVldlZvVmdhSHFmT2g0?=
 =?utf-8?B?TTZSemhxYjhCdGZzY2pYU2lQUnhaR0FDQllzbk81eTlWV3k3Z3h5RlkrZWhn?=
 =?utf-8?B?Rnd4SnMxNDkzUUlwSlhRUTA0YkZVMTd4bUJEU3B0RmJIdHFBb3pqZ1JXYzd0?=
 =?utf-8?B?cnIzS205NFVlQlVZN01JYVZUV0E4NktoekpDV09Wa0VKWW9pY2plWlhvdTNo?=
 =?utf-8?B?SnhKeEVOMmJrWVBRS3VObWs5aG54enA2a3crUmoydVRhRVk4cUdsYStvbDJ1?=
 =?utf-8?B?RzN1STVJalFZMmU4MGVidzNOdk9HWlRMWno1YWN4aEhmMUlQSHo4bkNXYUZz?=
 =?utf-8?B?Y2RkUDhLK3NQN21zbHlaUG01MkZuT0laNEQ3ZytJWE9KTm1RK0gwaVpYZi9L?=
 =?utf-8?B?d1p2S1dsNERIU2R6bkdDK2JQUXhMekJMbTVwNFZpaVV2ZWFUZVZFYzQvL2to?=
 =?utf-8?B?REh2QXdLZTNJc1I0enRid1J2R1dRRjFTUFdkeEFSV01DZEl3U0swUC9QY0th?=
 =?utf-8?B?MmhibGJwVGpyWkk5bHZvY0p1RDVYK05Tb0VLeWY3SHJoR29tMEEyVGtxblBQ?=
 =?utf-8?B?OWx3RUNhM2Z5Kys2Q21HK2FBcmVUZ2JhVU5HMW0yd3dyVFRRb3hNY0xMOVBO?=
 =?utf-8?B?SVdIRXRYNjd4bFlHMGxUbHhLcGVvZGt6aDJoalo1VmlwQWI2R3Zvb0ppRlVz?=
 =?utf-8?B?bVFqdkxxaXBlRUJoaGhadFQ3OUdzUE5VWHJPbExlRkhScUJadnZnWGRrTzhT?=
 =?utf-8?B?RkRzSGwvWERpODFCdURtMUdQdTR1S2xORHFKR0IrWWNyVGM4VmRTZjRRbXha?=
 =?utf-8?B?S25aYktSSVhsMzkxZFd1R2dmU0I2UFJvL0dHV3lnWVpDRUV6eUJ5TUowbGFH?=
 =?utf-8?B?NTdBektkQlJVRHZSRHhpeUZ1ZFJzOWtmZDNwQXZyVTlpSjNBeDU4enNnS0cr?=
 =?utf-8?B?WGxVendoNS95MHMzZit2SzUyZmw4UmltcHJGVjJPOGx5NEptN3B4SVF4eEJW?=
 =?utf-8?B?emRab1Rsb29HYklvdDNyZTFiRDN0WVJwc0c1SkVqZUlXK0tnbWhNNENCWFVz?=
 =?utf-8?B?eTBHbkNRWjkrTkI0QVNid3Z2dGVmU1JyWW16d1Q1TDc4M2FBZkJnbzFCKy9H?=
 =?utf-8?B?Wkt1bmY4NE5YeEV3eXBJelBMRTVEUFoyR3U5MU5SYnIxNXllSFQwcGFEV2xS?=
 =?utf-8?B?aXZwTjNiclk1MUNLNDhCb0ZXT043SDNSSW9iQUVEdDZuZUpobHFyNEJNYzFD?=
 =?utf-8?B?V0Z1ajhCQnZ0SFZHMDF1QS8vcFBCcEoyZjlvR3Z6T3pwMHRsRjlCdnBwZDY4?=
 =?utf-8?B?bzZ5ZjNnUEFUY2lDb21STjU4QUlQaFZ4RnA4VUkvYVIrQ0xSL3lWL3NmVGpO?=
 =?utf-8?Q?N0F/5Xwxy1+tgc6GCiJsEQgEI?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4921DC8CE1E8C41AD2C83BC02421039@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3mDotj3bvELA49FXkrwoEWMOVBUnh/7mDM+jrZNmjwfv8hp57AyhVqxnnnlsPCM1wUj72zR2hmlYXnXx17NVg5yjqH4Kx8skczo37ePnhrjzc0iDenXKNIu7M7ut3xr/iHYQ0vhxHrk0tqaGTvrIYqygLTdXnBwIIKfK4wbRWSm0H5NEAqSB21W7whzagRBKeHo8AgKlLRVZSEDHqlx/QlxYWNOkNuJT8VRsrBBrT4V/gvj1arKJTmG4zVWW4HOP3guCuS5GbeAleWdV3b8CzFsvdzq62w4vIqOnTyevx99S4uYAGigJK+YFGMSVvbDQu4DyAt0uO97mAQx5/cCijlmSxdrUc7W/hjxb0/c+Eb5xEzs1mhvstQoqkhENPI+nuJCRAei/R846C4K+FvDq4GhbSSMPwIkP/hK47CjUkXD7DDvmlcC3hwoHVVE9yKHgwP7WBJVKFnu9DpShRAeDQNVcbKqkKmGS7gr5n50wW+Q6xytTDFskuq4wCeO2JOU77w/Oi2FdjXY/qOR5pZCE/CG9PAoLncTOakTJlaSUF3zR+dA3cLaUhCcUynUEaM9gGVsgCNmX2DljmcqNbl/o0syZ/FZd/j9di2EQHOCOd/2TxrEXSxRMV7+XkGhbv0pHEYjhCbvnZ6hTGaSlTzM5d/WXN+dKP8iFWmh7R/zWhpffDR/yIWU7Ou2UivDMinpH7VuEdbLAVD/bU3s4OG/eQJxByN2xXbEKoUkkUkTLCheXsn8ULjaJAmryr350fDAY24FQqj3WDMead3hDj5XIdneXx8n8uX+bPnrfvJGWMR98qzCYS+sTHI0oNP9J8J1ikmj6/jbtR+zWAPZFhJTuydc3Q4e6bk6aHqwIslwn7Lf9G15vnnBs+1DV919GHh15DoziPQhTAmQzpbzay9F+7A==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f5e98f-4022-485e-b91b-08dac769586f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2022 00:27:29.4931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LMzpNsi4nHarbNwsrSwwYDxY2L+Y0thVETCUzTIWn1HWGoXr3fy7dVzvAx72Vs0T6FdN0WAmCbA67l8xjKSyEvlQINrbOZFhv7CMLzbu0iE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6858

T24gMTUvMTEvMjAyMiAxMzoyNiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBIZWxsbywNCj4N
Cj4gSnVzdCB0d28gcGF0Y2hlcyByZW1haW5pbmcsIGFuZCB0aGUgbGFzdCBvbmUgaXMgYWxyZWFk
eSBBY2tlZC4NCj4NCj4gRmlyc3QgcGF0Y2ggZGVhbHMgd2l0aCBtb3ZpbmcgdGhlIHN3aXRjaGlu
ZyBvZiBTU0JEIGZyb20gZ3Vlc3QNCj4gdm17ZW50cnksZXhpdH0gdG8gdkNQVSBjb250ZXh0IHN3
aXRjaCwgYW5kIGxldHMgWGVuIHJ1biB3aXRoIHRoZSBndWVzdA0KPiBTU0JEIHNlbGVjdGlvbiB1
bmRlciBzb21lIGNpcmN1bXN0YW5jZXMgYnkgZGVmYXVsdC4NCj4NCj4gQW5kcmV3IGhhcyBleHBy
ZXNzZWQgcmVzZXJ2YXRpb25zIHRvIG1lIHByaXZhdGVseSB3aXRoIHBhdGNoIDIvMiwgYnV0DQo+
IEknbSBzdGlsbCBzZW5kaW5nIGl0IHNvIHRoYXQgY29tbWVudHMgY2FuIGJlIG1hZGUgcHVibGlj
bHkgKG9yIHRoZSBwYXRjaA0KPiBhcHBsaWVkKS4NCj4NCj4gVGhhbmtzLCBSb2dlci4NCg0KVG8g
YXZvaWQgYSBmdXJ0aGVyIHJvdW5kIHRyaXAsIEkndmUgY29tbWl0dGVkIHRoZXNlIHBhdGNoZXMg
d2l0aCBzb21lDQptaW5vciBub24tZnVuY3Rpb25hbCBhZGp1c3RtZW50cy7CoCBJbiBwYXRjaCAx
LCBhbiBleHBhbmRlZCBjb250ZXh0DQpzd2l0Y2hpbmcgY29tbWVudCwgYW5kIGluIHBhdGNoIDIs
IGFuIGFkanVzdGVkIGNvbW1pdCBtZXNzYWdlIGFuZA0KbW92ZW1lbnQgaW50byBfX2luaXRkYXRh
Lg0KDQpJJ3ZlIGFsc28gY2xvc2VkIG91dCAjOTAsIHdoaWNoIGNsb3NlcyBvbmUgb2YgdGhlIHJl
bGVhc2UgYmxvY2tlcnMuDQoNCkFsbCBvdGhlciBidWdzIGNhbiB3YWl0IHVudGlsIDQuMTgsIGlu
Y2x1ZGluZyB0aGUgdG90YWxseSBiaXphcnJlIG9uZQ0Kd2hlcmUgdXNpbmcgY3B1aWQ9Imhvc3Q6
dmlydC1zc2JkPTEiIGluIHRoZSB4bC5jZmcgZmlsZSBjYXVzZXMgSUJSUyB0bw0KYmVjb21lIGhp
ZGRlbi7CoCBJIGNvbmZpcm1lZCB0aGlzIHdhcyBwcmUtZXhpc3RpbmcgYmVoYXZpb3VyLCBidXQg
aGF2ZW4ndA0KaW52ZXN0aWdhdGVkIGZ1cnRoZXIuDQoNCn5BbmRyZXcNCg==

