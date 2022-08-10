Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E5958F2C3
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 21:10:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383852.619058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLr5Z-00027p-Gs; Wed, 10 Aug 2022 19:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383852.619058; Wed, 10 Aug 2022 19:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLr5Z-00025I-E6; Wed, 10 Aug 2022 19:09:57 +0000
Received: by outflank-mailman (input) for mailman id 383852;
 Wed, 10 Aug 2022 19:09:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vUq/=YO=citrix.com=prvs=214886735=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oLr5X-00025C-Mj
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 19:09:55 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0346ed75-18e0-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 21:09:54 +0200 (CEST)
Received: from mail-dm3nam02lp2040.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Aug 2022 15:09:51 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO3PR03MB6695.namprd03.prod.outlook.com (2603:10b6:303:176::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 10 Aug
 2022 19:09:49 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 19:09:49 +0000
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
X-Inumbo-ID: 0346ed75-18e0-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660158594;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=luLz+fQFEs6jAL5QSCxGGNL2p/GBb1TxcnGWrjpqBHk=;
  b=RZCKUpQVp6mcZmxesiRYFLaK5fC7I06SHBdIKoqABHHnPMdVv+pHb1FA
   3d8K1VX1cnp9Yp+wgfltmuu4TOQyorTG2MugFEXf/yGivKjC2dBusfgRt
   YjpKv0e5MWLiJjDoqNpqL42TEP8eGAcaZ47YIQsbKi65HBk2u5Vh7kv9z
   8=;
X-IronPort-RemoteIP: 104.47.56.40
X-IronPort-MID: 77814661
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:m8CkqaBvDGrGSRVW/zfiw5YqxClBgxIJ4kV8jS/XYbTApG8jhWEHz
 2oWXm2FMqrfambwLo1yaYy3oRtTv8OBz9BhQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E3ratANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq3uU0meaEu/Dga++2k
 Y608pa31GONgWYuaDpEsvrb83uDgdyp0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36ZGBivkF+Sam66iWukwRpukoN2FjwXm8M49mBt4gZJ
 NygLvVcQy9xVkHHsLx1vxW1j0iSlECJkVPKCSHXjCCd86HJW3+20shCMBsqAYIJo/RLQmcW8
 PA7DS9YO3hvh8ruqF66Ys9Fo5x5aeXOZ8YYsHwmyizFB/E7R5yFW7/N+dJTwDY3gIZJAOraY
 M0aLzFoaXwsYTUWYgtRVM14wbnu2iGXnz5w8Tp5oYIe5WTJwRM3+7/qKNfPIfSBRNlPn1ber
 WXDl4j8Kk5FZIXDl2Tcmp6qrsPFmWTLAbMKLqSx2+Vxh0Wr7C8OGiRDADNXptH80CZSQel3K
 UYZ5y4vpqga71GwQ5/2WBjQiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6ceWjgCx
 lKP2dTzClRSXKa9THuc8vKYqGi0MC1Nd2saP3dYFU0C/sXpp5w1glTXVNF/HaWpj9rzXzbt3
 zSNqyt4jLIW5SIW65iGEZn8q2rEjvD0osQdvG07gkrNAttFWbOY
IronPort-HdrOrdr: A9a23:pnOFkqtHVrKL3A2OAPyJYAa97skCXoAji2hC6mlwRA09TyXGra
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
 wMUHz6I9hB9FmiXjvijB3YSxrWCzjCFFJLYd3nFsQoufgw39d3w3koYHyCl7K2ACwHtLAqd0
 1jJ76imr+npACNjBT101k=
X-IronPort-AV: E=Sophos;i="5.93,228,1654574400"; 
   d="scan'208";a="77814661"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DkRWMGtGKxF8N5+PEBwiLYBTrfFB7JHHTGDTrMF5m1WX6JEzZUMpysM23u/W4YFt6mmBIjWvfCOBOsNz+D883ZTCTUIJZaKPwQgkvqQqUqXANK+xGWbtvDjkfoCOHYIULi8h86CNKBfvTJO/QRwiIhAFfFrGVGQhjWCSKouS3tglvZkmo4OP/ocSzsKQiJd9kCNZQQ96908yKm41wpRlBWAtaArmiDDUl43QABxDetC0cwRYyii60wTkTdQ1suxMxAUCAkbp/RHOIEQcvxTLJqGgEV9xphuHT3CfvNnZNwe5BS3avySNY4njJgIR0p8ScN2aZGN21T+cTQ/SPJXCKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=luLz+fQFEs6jAL5QSCxGGNL2p/GBb1TxcnGWrjpqBHk=;
 b=Q9MWbKAAb7D6drFp832tmtHXtb1nzVPK4KC6ifTxAXRW0furlxg13mEZ2HeWC39RW+n7qPlyDV3HnEokz/H2SCPU+6eXZUS0nnZng4affxZv1zwy49ARg0oP273O0JwDmwziX16rR/YfADozAQiSWA1kNDGD3G8rio6DBEK94P560mijrr22jU2unO8zMEc2mdaycKgogyG/BWv97GacJRLn5393VWMumD4QhL8FW3J4nGikcSMgb8wmRIyhWhF0DlulKIqKqbf6Ex0kq33RbZMB+D6pU7Wtcyvi5+tCJwb5yHW2/Dqjum1mMozCrF6vH02Ff/cIv3YUVlr49mXLUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=luLz+fQFEs6jAL5QSCxGGNL2p/GBb1TxcnGWrjpqBHk=;
 b=nk+ydVhc0ieYZR1aaGTsnfcMPz/vTEv6G9m+jNdTzSllpA/OQjszEP+eD75YMm1P8GXfEOo4MzfkWpnNiyRCyL+mhXZrkrdEaXoA5yN/O+4fEHkZvHfN+vlL19ZW+nm5X9fh+Z3S71mZHAeNIHbqForGFdTR2WX1ipvUsi6dMUc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 10/11] x86emul: handle AVX512-FP16 conversion to/from
 (packed) int{32,64} insns
Thread-Topic: [PATCH 10/11] x86emul: handle AVX512-FP16 conversion to/from
 (packed) int{32,64} insns
Thread-Index: AQHYgKMWKPihk5cLF0yn90+JaN8SLK2o2D+A
Date: Wed, 10 Aug 2022 19:09:49 +0000
Message-ID: <11a429f8-0ba7-f380-e7d0-28817cb9593f@citrix.com>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
 <2f99e91d-6a91-f860-45d0-9c8b67c9b2b8@suse.com>
In-Reply-To: <2f99e91d-6a91-f860-45d0-9c8b67c9b2b8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6812cb55-ac83-4abc-fbf4-08da7b03e5c7
x-ms-traffictypediagnostic: CO3PR03MB6695:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 j6qu6tNXI47o11uRlCeYr9zIgvREsTu0BWuRPqDXfr2t7HfMf0a2dNteidp7k7uZhXUMmin3J4zzGY1USJUNtVb1QqYOn6jUxTssdD8IMM4k8drdcLZCne7h54OCW/0J7G10bFuix+55kdd/NABk4jz5bmHnJopSDLAFMHRE/A6tcMRD54j/MwBlymyYc2ZcqBIet2NDwqkVi7yMmFjOM++uy4Jub/jAMXIUYxlBUQJ97RfbcYsBlUM7yA2ut8luKi99oNXWxTqmf14LLLx7mftWpnw6y9M8AuyzSX5V4o6j4G4yxA40MHmDFTnnk+qiDVagKwYAoQZjXNUXwy53yYGisKKAzW4VPCBFtUt5dwgvv1QB42TW4Xr9gxnIu5BUN0q/SCVSW93MoPxtLOLwcTw8yS8GUTTCBPFOQwyNFSy5Z2jQ7TFIr42VtCu46Vc07fggQPubBoeTaMZpHojXvPeo7CgnplB2ud83SuP0QfucpERZ9+2MiXD9s8c6R3XUSpEv/BzzogxHBZaeADHu/GxewUhNgj62FBJbxiUHnsnkiniqyFA7OuSDudWLvANMFdV7GfZBzAid3RR/b1ZpyIkLbKzhM8G2gme5a04Ait4j7w7r2UxVXT9vzcb1dv2KxECaphVrzAVAtdhSIr4DPEmVKeM0P00TW08JysV80BbW8a2eeKR4YIdUTt7pX1CvOK26LI3O/HywLbf4u5MUHfX4TMhkrgxlHsMzEtM8emI7F9fy2F5UYRm72z3Nwz974s22Mt7ZNT0UUGmEIMgcmhKyoXMGcxXR+XhlOKI1qD5WqKkQiKODH7FWprvxltjyNcIcyOLAJuOkbVqAvb62Bj6prvXy900E+ohkKQvpo+k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(4326008)(66446008)(8676002)(64756008)(5660300002)(66476007)(66556008)(91956017)(76116006)(316002)(66946007)(2906002)(122000001)(38070700005)(8936002)(36756003)(82960400001)(31696002)(86362001)(38100700002)(478600001)(6486002)(41300700001)(71200400001)(110136005)(54906003)(107886003)(53546011)(2616005)(26005)(6506007)(6512007)(186003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UE4zRmUvNnd5bmRGYnBHZlVoU2pNMlhSd1VuaVRVTGVGSjA2OGo5elgvb3BU?=
 =?utf-8?B?SU5IaHczTzZpUG5BN1JnczlGTnptSlBmYlUzdzNwanZlcmdCaHFrL0R5bkpj?=
 =?utf-8?B?UVFNZGtRL29IZWQ5OERCWlAxbS9DdU5rOTZvODh1ZmF2QkpoMDVtbWlER0hz?=
 =?utf-8?B?RXZWSTRpT21RenEyMFlFRDZIZE81UkdmbnNleDZ1Y2lhNVR3MFp1Rm5uU0Rl?=
 =?utf-8?B?VjFzVGRaRXdWQnVLQzJBdVNrU2gxN1RvaHlmRkg5MDZkdVpySEgzUk5SMksv?=
 =?utf-8?B?aW5iSFRnczg1bkNXVTBnQlFmTVVCWEtMa1NoVTQra2F4WWU2eHZMY3B3N3RQ?=
 =?utf-8?B?ZUpGaDhGVXZtN2NMSEw2ZCtjUUZnV1VpaXpRR1B4QThuRzljSVF1RWFtblp5?=
 =?utf-8?B?QTJKWmNWT2RDQ3U0ejF3NUwvY1lQUkZhaXJXdkgvdWg0dXhhMUxYKzNBNm9p?=
 =?utf-8?B?YnRyclA4TTF2Ym9PZ0Z6TUpPV0owaEtsaTl4aFhpQmNRWlR3K2IvUDIzaDht?=
 =?utf-8?B?VmNuTnlvalhwWGZXUFhWNms5aEZxbDdpM3RkbUtDdDBZYkh4RHFPUmYzVmVO?=
 =?utf-8?B?aWRFL0xOdUZwSnFZdzQ2RGt5RTU3ajFyV0RtZ1QvUDFZdUNWMC9haG1HWExl?=
 =?utf-8?B?U1VMTnRQclhJckE5WEFvUXNIalJwczlmVWtpcGhIZHdJRUpHS2phdjE5dFUw?=
 =?utf-8?B?SXlFOG9hTWZLVk9raERTRnMzRTBxc05ENUhTN3FZVE83cGhSK2N3Rk9VNXYv?=
 =?utf-8?B?dXlKNUlXU0ZLSHQxSldud0ZaeGRXRXBlUkJXbUJQa2ZnNE9ya2hhNndpTkJy?=
 =?utf-8?B?QUE5U2JhTit5L0hoZlJpbS94NEV3OU9BQ3ZCSXdnU0VvSGQrRzF5NWhQQXJu?=
 =?utf-8?B?NU8ybjBuT05OeTlBZVZFdk5oZTZjTjhEZ1lGL29FTDAxOFNIclJ5M2dGQ3Rn?=
 =?utf-8?B?U00vcEpVa0ZWNE96a1hSSUtULyswL2d1d0tkMlVpd0NuWkUzZml0c3B2Z3I3?=
 =?utf-8?B?OGo0K3FYbXdMV1NWcXhYRWR2MkZ4dGFkQ3JCUVpNY0RUbW9hamlXNVhjZTJx?=
 =?utf-8?B?M2p1V2NqVGNrTzByaVlPaEJQRGN2NHV2YWRkaW11ZU91YWZwVEZHZjV5aVNu?=
 =?utf-8?B?SEI2ZnlBRGRJb2pmVmNaTUo2ZFV5d2hMQllhNmZwTFVKUmY3SFh2UHlRUHNh?=
 =?utf-8?B?M0V0cE96K1A3V2lHT1lSVkNKUWFTQ002NzRlN24xUU1VRnhFdXB5RmJMUUl5?=
 =?utf-8?B?NkVZUER3eUUrbk5KUXhTbERRdUZqTHFXUGx2Q3RadUNTNXd4Sm1hZHVKc1Zh?=
 =?utf-8?B?K2dnMG1KVlVNQmk4YlNNYUV6TjN5TEV4aHgyUlg0TTBtY0RkajN5YWRYL1pj?=
 =?utf-8?B?aEMvSmk0eUtJS256UXE0YjRSSVl2b0dDRkZSOU5ob045cHJOOW1Nelp0cHNN?=
 =?utf-8?B?dk1kczBqK2tZTU1pRDFrNVNZVUZEV3p3WHlMcHJ5ODRVamdvNXhKMU4xMEpx?=
 =?utf-8?B?SUZNZHl5OHNGa3NocFR4QVNFaDJjTnRtRGNSbml2R3VGN3hEbldKN3EvWkd6?=
 =?utf-8?B?WmZGQ1lHcm5nMXFmZGNRamlORGwwbWwvSGlQanFwbXBlZTZHWDMra1VsMFZJ?=
 =?utf-8?B?b0F0ZmpIVEdsby9zVWNsSjg0cUxsZ25mbzZRb29XOEsyaU8rQjA2RUxybXRW?=
 =?utf-8?B?aEFuWVFINzRRbzlrUitwN080NDZXZWVoTHpNdHR4c253aW0zTnc0bDNkakxE?=
 =?utf-8?B?K08rOXBIQUowWHo4OGhnM1lEeUY1Rkl0S1FOZE5ERUNRQW5jME9XOTNhQXJl?=
 =?utf-8?B?QVdwekdzVE5Vb1VPYkUzOUljTm8wTzN5QWtRdlNVSE5qUzJBSXJQSHdHTThO?=
 =?utf-8?B?WExtOTBoTUQ5VWs0SkZhc202SkY4dnRCaGtLWDVRQUppNCtKeXNZcVU2eUk0?=
 =?utf-8?B?YVZ5YnlTa05qcDF0SUd4SkUzZ2hNdnEydUpDclRzaW9iejc3cmIzbEpOVU0y?=
 =?utf-8?B?TzM0U25CaWNvLytZSFZrMEFiVGwxLzhERzFzRTlPakJ0djJoZXpIWjQwaVBa?=
 =?utf-8?B?eHFwRGx4UXRoWTdCTHVoVEtoMU92akZ0RlRNUGRlampDUkd4bm9VbjhOcGpj?=
 =?utf-8?B?M3NlZUpBa0x4N0I5Y2VyanpyOHVWdFNuaU56N3o4blIzVGNJMXRtWks1bndm?=
 =?utf-8?B?MEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7CF7410D41DF34AAE16E579DC0B2EC7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FnHE9S8e2PKBZSE6JagyuhQw0O6rmq/RmcCrS9AXagFRL990o05TTVUt0aFcsxjdARSdTKyyJ/KMpp9ksefFGsHw5LfOGxZ/as2pGFUL1WTVT4mE2V+PABSFAQVgYnCU6yS6SCMGdx6C0wm92b32fY0ZlmlwbajqY/Kuh2sX3jTrAIX8oIXmBfCqr3g9SG/ORHVtUDUsuP/zVaOHNY9RewbC3wiCKX+jn2fPl/NhcHLGg3lqWgH1zsvdA6UWexse9bLMgMZD/v567ikCbRCsCnEplQXDExn+YvjxYuqy6qrKdXQMsGbpo7DaEI63+wjywJ91h366FWukpUNg3tOLHQBai78P8HgJaEiQ3uAzdu9DTpcv8OMFSykY0oMBxCAof7vapvCWuIRZvyz3c5ZYuH8EiuYvaHeol4JAdMhoQdtMaCtHah0q6a1ZhOrcjphtLUH6NsBDNgty0SPnBQ1bsw0KWj37nw44re8YTbjDg9nIc+l3Drj8Fp5oaLrHiUgfF/PoAqcpl7RcFjOk6VB1Yp7Rtvfy14dHZM96LXcsoMJkY4nrnxW9+HQQs0vI1xQupHgwHdwY0PkBOW0dUWlo+66rkSydyQgb5kVp9+gw0HMwQrV6wPekfp7ffw/GdFnqZygZ/qzjFBmBHyLTLdzp6tS9hkj7muT40WeymYcmIaYejSBz4JJH6gI8LSXqCGdbWSNqCrlaTDYDwpnhiNtmxniTWd1Kd/qSyqUO7WhqGeH7PpiTvFLa2aWxEYQI6q+2fu6ERF41aLx/c9sp0KwCJU9MOV+gials7dqv4FUVfv6ZOczARTMbgWnXO1TmzT4M
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6812cb55-ac83-4abc-fbf4-08da7b03e5c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 19:09:49.6397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9lrbu4fpYjFGHQDDIQdBP/u7YdCzJ7jUdxcrooMwSgiPEK06nJKVYTz3+o4C0Gqy9OVm46k+/DXUK6tWMhh1ULj3/KsaqAwEm9xUw1A5YQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6695

T24gMTUvMDYvMjAyMiAxMTozMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4NCj4gLS0tIGEveGVuL2FyY2gveDg2
L3g4Nl9lbXVsYXRlL2RlY29kZS5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS9k
ZWNvZGUuYw0KPiBAQCAtMTQ4OSwxMiArMTQ4OSwyNSBAQCBpbnQgeDg2ZW11bF9kZWNvZGUoc3Ry
dWN0IHg4Nl9lbXVsYXRlX3N0DQo+ICAgICAgICAgICAgICAgICAgICAgIHMtPnNpbWRfc2l6ZSA9
IHNpbWRfc2NhbGFyX3ZleHc7DQo+ICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ICANCj4gKyAg
ICAgICAgICAgIGNhc2UgMHgyYTogLyogdmN2dHNpMnNoICovDQo+ICsgICAgICAgICAgICAgICAg
YnJlYWs7DQo+ICsNCj4gKyAgICAgICAgICAgIGNhc2UgMHgyYzogY2FzZSAweDJkOiAvKiB2Y3Z0
eyx0fXNoMnNpICovDQo+ICsgICAgICAgICAgICAgICAgaWYgKCBzLT5ldmV4LnBmeCA9PSB2ZXhf
ZjMgKQ0KPiArICAgICAgICAgICAgICAgICAgICBzLT5mcDE2ID0gdHJ1ZTsNCj4gKyAgICAgICAg
ICAgICAgICBicmVhazsNCj4gKw0KPiAgICAgICAgICAgICAgY2FzZSAweDJlOiBjYXNlIDB4MmY6
IC8qIHZ7LHV9Y29taXNoICovDQo+ICAgICAgICAgICAgICAgICAgaWYgKCAhcy0+ZXZleC5wZngg
KQ0KPiAgICAgICAgICAgICAgICAgICAgICBzLT5mcDE2ID0gdHJ1ZTsNCj4gICAgICAgICAgICAg
ICAgICBzLT5zaW1kX3NpemUgPSBzaW1kX25vbmU7DQo+ICAgICAgICAgICAgICAgICAgYnJlYWs7
DQo+ICANCj4gKyAgICAgICAgICAgIGNhc2UgMHg1YjogLyogdmN2dHtkLHF9cTJwaCwgdmN2dHss
dH1waDJkcSAqLw0KPiArICAgICAgICAgICAgICAgIGlmICggcy0+ZXZleC5wZnggJiYgcy0+ZXZl
eC5wZnggIT0gdmV4X2YyICkNCj4gKyAgICAgICAgICAgICAgICAgICAgcy0+ZnAxNiA9IHRydWU7
DQo+ICsgICAgICAgICAgICAgICAgYnJlYWs7DQo+ICsNCj4gICAgICAgICAgICAgIGNhc2UgMHg2
ZTogLyogdm1vdncgci9tMTYsIHhtbSAqLw0KPiAgICAgICAgICAgICAgICAgIGQgPSAoZCAmIH5T
cmNNYXNrKSB8IFNyY01lbTE2Ow0KPiAgICAgICAgICAgICAgICAgIC8qIGZhbGwgdGhyb3VnaCAq
Lw0KPiBAQCAtMTUwNCw2ICsxNTE3LDE3IEBAIGludCB4ODZlbXVsX2RlY29kZShzdHJ1Y3QgeDg2
X2VtdWxhdGVfc3QNCj4gICAgICAgICAgICAgICAgICBzLT5zaW1kX3NpemUgPSBzaW1kX25vbmU7
DQo+ICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ICANCj4gKyAgICAgICAgICAgIGNhc2UgMHg3
ODogY2FzZSAweDc5OiAvKiB2Y3Z0eyx0fXBoMnV7ZCxxfXEsIHZjdnR7LHR9c2gydXNpICovDQo+
ICsgICAgICAgICAgICAgICAgaWYgKCBzLT5ldmV4LnBmeCAhPSB2ZXhfZjIgKQ0KPiArICAgICAg
ICAgICAgICAgICAgICBzLT5mcDE2ID0gdHJ1ZTsNCj4gKyAgICAgICAgICAgICAgICBicmVhazsN
Cj4gKw0KPiArICAgICAgICAgICAgY2FzZSAweDdhOiAvKiB2Y3Z0dHBoMnFxLCB2Y3Z0dXtkLHF9
cTJwaCAqLw0KPiArICAgICAgICAgICAgY2FzZSAweDdiOiAvKiB2Y3Z0cGgycXEsIHZjdnR1c2ky
c2ggKi8NCj4gKyAgICAgICAgICAgICAgICBpZiAoIHMtPmV2ZXgucGZ4ID09IHZleF82NiApDQo+
ICsgICAgICAgICAgICAgICAgICAgIHMtPmZwMTYgPSB0cnVlOw0KPiArICAgICAgICAgICAgICAg
IGJyZWFrOw0KPiArDQo+ICAgICAgICAgICAgICBjYXNlIDB4N2M6IC8qIHZjdnR0cGgyeyx1fXcg
Ki8NCj4gICAgICAgICAgICAgIGNhc2UgMHg3ZDogLyogdmN2dHBoMnssdX13IC8gdmN2dHssdX13
MnBoICovDQo+ICAgICAgICAgICAgICAgICAgZCA9IERzdFJlZyB8IFNyY01lbSB8IFR3b09wOw0K
PiBAQCAtMTUxNSwxMCArMTUzOSwzNCBAQCBpbnQgeDg2ZW11bF9kZWNvZGUoc3RydWN0IHg4Nl9l
bXVsYXRlX3N0DQo+ICANCj4gICAgICAgICAgICAgIHN3aXRjaCAoIGIgKQ0KPiAgICAgICAgICAg
ICAgew0KPiArICAgICAgICAgICAgY2FzZSAweDc4Og0KPiArICAgICAgICAgICAgY2FzZSAweDc5
Og0KPiArICAgICAgICAgICAgICAgIC8qIHZjdnR7LHR9cGgydXtkLHF9cSBuZWVkIHNwZWNpYWwg
Y2FzaW5nICovDQo+ICsgICAgICAgICAgICAgICAgaWYgKCBzLT5ldmV4LnBmeCA8PSB2ZXhfNjYg
KQ0KPiArICAgICAgICAgICAgICAgIHsNCj4gKyAgICAgICAgICAgICAgICAgICAgaWYgKCAhcy0+
ZXZleC5icnMgKQ0KPiArICAgICAgICAgICAgICAgICAgICAgICAgZGlzcDhzY2FsZSAtPSAxICsg
KHMtPmV2ZXgucGZ4ID09IHZleF82Nik7DQo+ICsgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0K
PiArICAgICAgICAgICAgICAgIH0NCj4gKyAgICAgICAgICAgICAgICAvKiB2Y3Z0eyx0fXNoMnVz
aSBuZWVkcyBzcGVjaWFsIGNhc2luZzogZmFsbCB0aHJvdWdoICovDQo+ICsgICAgICAgICAgICBj
YXNlIDB4MmM6IGNhc2UgMHgyZDogLyogdmN2dHssdH1zaDJzaSBuZWVkIHNwZWNpYWwgY2FzaW5n
ICovDQo+ICsgICAgICAgICAgICAgICAgZGlzcDhzY2FsZSA9IDE7DQo+ICsgICAgICAgICAgICAg
ICAgYnJlYWs7DQo+ICsNCj4gICAgICAgICAgICAgIGNhc2UgMHg1YTogLyogdmN2dHBoMnBkIG5l
ZWRzIHNwZWNpYWwgY2FzaW5nICovDQo+ICAgICAgICAgICAgICAgICAgaWYgKCAhcy0+ZXZleC5w
ZnggJiYgIXMtPmV2ZXguYnJzICkNCj4gICAgICAgICAgICAgICAgICAgICAgZGlzcDhzY2FsZSAt
PSAyOw0KPiAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiArDQo+ICsgICAgICAgICAgICBjYXNl
IDB4NWI6IC8qIHZjdnR7LHR9cGgyZHEgbmVlZCBzcGVjaWFsIGNhc2luZyAqLw0KPiArICAgICAg
ICAgICAgICAgIGlmICggcy0+ZXZleC5wZnggJiYgIXMtPmV2ZXguYnJzICkNCj4gKyAgICAgICAg
ICAgICAgICAgICAgLS1kaXNwOHNjYWxlOw0KPiArICAgICAgICAgICAgICAgIGJyZWFrOw0KPiAr
DQo+ICsgICAgICAgICAgICBjYXNlIDB4N2E6IGNhc2UgMHg3YjogLyogdmN2dHssdH1waDJxcSBu
ZWVkIHNwZWNpYWwgY2FzaW5nICovDQo+ICsgICAgICAgICAgICAgICAgaWYgKCBzLT5ldmV4LnBm
eCA9PSB2ZXhfNjYgJiYgIXMtPmV2ZXguYnJzICkNCj4gKyAgICAgICAgICAgICAgICAgICAgZGlz
cDhzY2FsZSA9IHMtPmV2ZXguYnJzID8gMSA6IDIgKyBzLT5ldmV4LmxyOw0KPiArICAgICAgICAg
ICAgICAgIGJyZWFrOw0KPiAgICAgICAgICAgICAgfQ0KPiAgDQo+ICAgICAgICAgICAgICBicmVh
azsNCg0KUGVyaGFwcyBoZXJlLCBpbiB0ZXJtcyBvZiBvdmVycmlkaW5nLi4uDQoNCn5BbmRyZXcN
Cg0KDQo=

