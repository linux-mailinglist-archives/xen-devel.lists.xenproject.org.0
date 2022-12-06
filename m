Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FF96442E9
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 13:07:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454785.712330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2WiX-00025H-T5; Tue, 06 Dec 2022 12:06:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454785.712330; Tue, 06 Dec 2022 12:06:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2WiX-00022v-P4; Tue, 06 Dec 2022 12:06:33 +0000
Received: by outflank-mailman (input) for mailman id 454785;
 Tue, 06 Dec 2022 12:06:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XkKw=4E=citrix.com=prvs=332b12f58=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p2WiW-00022p-NU
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 12:06:33 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68ec32f8-755e-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 13:06:28 +0100 (CET)
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Dec 2022 07:06:26 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5039.namprd03.prod.outlook.com (2603:10b6:208:1a8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 12:06:24 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 12:06:24 +0000
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
X-Inumbo-ID: 68ec32f8-755e-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670328390;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=juAU0LQputKk7+KCB/CQaLGDslap6uGcpR1wVrHO+lA=;
  b=haeezQ7SUVV0EKAItUbhQLF0wbZ4olBi8rn9Om4Lp4Aa+uv2g22vE1BK
   0lMQJdx5rBQ39wHwcaEipIDIEI2bWf3l8jHFTYJRaT03CvB7yrWeeZPK5
   75MIegs9O0x34NRcaeUGDEh/TtPdhEVaVGQIZOu+vT00qX0zJpbeXDpQR
   E=;
X-IronPort-RemoteIP: 104.47.56.172
X-IronPort-MID: 86819434
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:t2ONXKkb0jDYRNplMUdeYuHo5gx2J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcDWqOO6zfZGqnetsnOdjlpkkHvZ6Hy4M3GlY9/yk0RCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kR5AGGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eMhFyFOaAzdvefsyoi/dNZPq+0FPsa+aevzulk4pd3YJdAPZMmaBo7tvJpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVI3iee3WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapCSu3hp6Ix3DV/wEQ8CR8Ofn6cpcCJqUH5BvheB
 kYewxMH+P1aGEuDC4OVsweDiHKJux80WtxOEvY74gWA1qrV5QmCAmEOCDVGbbQOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRUcHbDUBRBEI4PHipp8ylRPFStt/EK+zgcbxEDu2y
 DePxAA8jbgOic8A142g4EvKxTmro/DhUQod9gjRGGW/4WtReI+gT5yl7x7c9/koEWqCZlyIv
 XxBkM/H6ukLVMiJjHbUH79LG6y17fGYNjGamURoA5Qq6zWq/TikYJxU5zZ9YkxuN67oZAPUX
 aMagisJjLc7AZdgRfUfj16ZYyjy8ZXdKA==
IronPort-HdrOrdr: A9a23:+B7yiqqMojdmgTwT0TfZ/fwaV5oUeYIsimQD101hICG9vPbo7v
 xG/c5rrSMc7Qx6ZJhOo6HkBEDtewK/yXcx2/hzAV7AZmjbUQmTXeVfBOLZqlWKJ8S9zI5gPM
 xbAs9D4bPLfD5HZAXBjDVQ0exM/DBKys+VbC7loUtQcQ==
X-IronPort-AV: E=Sophos;i="5.96,222,1665460800"; 
   d="scan'208";a="86819434"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwa2rCwUnaUW1LqHbmzCsjh7mFILd0M2vjKEsPuDygYK5u4WsfbkcMFb11iVoZIFhiSopH35iVXVm2yoHZ0o8+ZZBX23M6Z+f9bvieDnNAUP2UZgvcvXL/SsgV8nft80DlbWT1BpCVEPsKHsPZKg7y+zHyp5Kh4PB5S6dIQ4FRm3GYa85sXD/gvLF15XOtEOHzsFYqUPLoZNkUy/rHr5hG4Y1xGWk8AUCvkVNTfhQ69hlRptzsrC8GWPRxIURO5OUz5UkJt5UzUcd8nWqJuhhq0wj69uZLwzzEpGSbOstWhlan+VRiOy0Co7RUnRaX8JdaAGFg+0Y1qDVInKvE33EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=juAU0LQputKk7+KCB/CQaLGDslap6uGcpR1wVrHO+lA=;
 b=S4Sboh7EET6GLN1hBN4zZI88mJ6wWL8K9GzxqTKc8apWq1icqruDAxukFPcsvoq8pRPcoKUbty5bIBtZc1xi9Ma3j92pni2wDpb877KrX3tTmpCPrCO6W2iHkmjgMB6Wr+Tv5L4nTHotIsDBsfQPuhuub/d6JrZors+RVjiKGyY1WyBWp+GOeYILInwKtRmuaBu09CYOni0vVDIY4PCYvX8TDMLJ1yAzeoFkdgP59wkxfP7LIqGedNC8IBCGAUfGunYYjSoVyGDpZDZTOhw0kGoX8u+6rnuJPfSV+D3AzBTTPoUKcurlMKW6bYR64JD8oY0zSVJdpcec619yHeOGGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=juAU0LQputKk7+KCB/CQaLGDslap6uGcpR1wVrHO+lA=;
 b=JiN4X+oZ20KOKJySmqKm5vee7RGwoHVphkKebKA5MByaBczFWmSDBFNtePOt39R+uab6poz15PEov9PwWkpUEt0lXyl7MpWD1uz1t+s3P71y+m/v1GwD/lqJhhJMY5cvH85NYuwuEN8jm8rwAfmipweccgmPfTE2gHQw8vevPLw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau
 Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 7/8] x86/mm: make code robust to future PAT changes
Thread-Topic: [PATCH 7/8] x86/mm: make code robust to future PAT changes
Thread-Index: AQHZCSwNNVwbw+XjekWbbMfdFBpGtK5gw/oA
Date: Tue, 6 Dec 2022 12:06:24 +0000
Message-ID: <9bb20bca-34af-bff6-b9f0-0c2ce38d2a46@citrix.com>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
 <33f3896ba4cdf50ceb0377f071682ac5d3f576c4.1670300446.git.demi@invisiblethingslab.com>
In-Reply-To:
 <33f3896ba4cdf50ceb0377f071682ac5d3f576c4.1670300446.git.demi@invisiblethingslab.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MN2PR03MB5039:EE_
x-ms-office365-filtering-correlation-id: c71afab4-1cb6-453d-0181-08dad7824bed
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 wCsNTBH6SdaCgKENGJzESXoWl2w2wvdzGqo7LyhixwkOFfg0Qak9v6gKRN4QMkQavD18+Ka4fSR0HzrbwK0CIPfjqAU5a4II9nEtog4/owKrDmgdZLQRpnBf+0OYSBVMFy/GPXcV+oQEdrdux19zVnAhhP4jY4m0dirMcHZ4MiKDwIsdkPSaFAC/0Wb+yQwdYdVPJnaRGU1z/TCjX/IDp4w00VmUuwg3nzUw5Ugvj85QXbS8yaDoWfS0uYEDNMZBNRw2CCKOxdwMKpVnROBCdePAunFfnNGMhxYe+YWDQruciTjxty9tp5ZKgcLvR8VzFAN/V4yteE5fmLi18Ypt1k6jfDwSjtLZrkGJkW5TJHowrib7YywpkGumIqpUKqTtBDcn9exZxS2DN0UL7KGkrAq+LHy6ywz9FXT8JNFsa628ZJklRwASwhwupZSAR9mruu+EhHRWQ7iZXgFcW4oGP+YV8+rOmgyA8IjtMgXYHr/XvwftDD7Z7IAflaoW93C+V99mbdAkJPKgwmft5wgVuGoB7hJlPmwrvEytRLvriUhCXyBqPKPzqHsvbpz4VxPch4xw2bu5ancDtoYdRIHJ9fdiGR+wPZrdyDvJoxJPrdPsgHrgaJBMm5rW6dfOCSVujQVWQR4mvz9Wo3MGQqxNcGvuU2FeSQn05ZVNG4baJwKO6D35dH7cA30P3crOAFiiIsFHmwN7E5zuesJOL1QEHGfX7B8BQjxrDrtuQ8E8XSLFubRVSulpSfk5cCguRmQtwapfFb+NY+N4UNUF3ush2g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(451199015)(41300700001)(6486002)(478600001)(86362001)(31696002)(122000001)(31686004)(2616005)(38100700002)(83380400001)(54906003)(316002)(110136005)(53546011)(6506007)(38070700005)(4326008)(71200400001)(82960400001)(6512007)(8676002)(36756003)(8936002)(2906002)(26005)(5660300002)(66446008)(186003)(64756008)(76116006)(66946007)(66476007)(66556008)(91956017)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WEFVUjJSUTZ4dVBNU0FXaC9oWkxSWFRRQ0tUN0JoS1Q2SHowOFYzc2ZrZ2xE?=
 =?utf-8?B?NjFLcW02WkJ4ZVVLbXRoRFNsQUhEZzZETXBoTE84UUUvSFFKVEdPeW4zZE4r?=
 =?utf-8?B?d0FFTmMzeTZQeVIydmRSMWREUkEyU2pNSXZUTXI1aTVjdVU3OXhvQm81djBU?=
 =?utf-8?B?L0tsdkZ0bzVVR0ZOZ1V3eFFKaDMxckJjRklOeVl1MFJDRERFSlRGZFdvRFNM?=
 =?utf-8?B?c1YyYjVNRWdFazZiUHZ3VlJoNHl6ckFpWkN3MXFvQkFoU3lnb3p3OWdqNHls?=
 =?utf-8?B?N2djV2c1RWM0VHFwQzBGa2Z0eXQrQ3VyWkNHUlFlVHJoSFpPVVR0YnF5aVFk?=
 =?utf-8?B?SnozTTJMZkJGM1ZHdCtNOFpQQldnRlhCYXJNR0ZsZnNwWVc3WDNzdlRjb3BE?=
 =?utf-8?B?SkNhWnh5ZmRHK1ZURzE2WVdQSUNLMXdhYzlDS2wzR0tsYW56b1JCMzE5OUx3?=
 =?utf-8?B?a1Npa0JpTlFwSFR3VzRzeEF0cXR6ampYdEpCR2EyZDNmeVoxTnp1K213SVJj?=
 =?utf-8?B?UzViUXdLY2pKOHpPMjFQQUVhOGtCcUt5bkREZmlxVWdYalZnT2ttSlEzNExF?=
 =?utf-8?B?dnhlNDN4NjNEeWFCMDBvWGZzMlZoaUludVpzNCtEbFNXcnRmdVk0RDlHaGUw?=
 =?utf-8?B?eDZoWXNOd0ExeDg1YTc4VVNzRngxcFJiNFBHNmFrMVlJUll2WTYxbzRJNCth?=
 =?utf-8?B?VERJTmdEZS84UFJ5ZWlGNW8wa2plWTkwR3R2a1J6OThPRENtS0owajh1K1I2?=
 =?utf-8?B?Mk9nVktYMUdaSC9HdGt0VlIvblR3Q01WQVlNeTJDNC9BUTQzcEN0YnBuK25Y?=
 =?utf-8?B?QXAzSkFZQlhaWjhUMW9SZXhWenVCN0owcVJCbnpnWXVkMnhHeGpZOGV4cG5r?=
 =?utf-8?B?bEtQcXVrb25JSllBSEpjQ0s2dFZCS2p5VW14aldxYUtBZ1hqaXA4cVFhT1cw?=
 =?utf-8?B?MElFTUl6eldNdTV0bHpTV1Z1aC9vS2ZnWGFaV2JReHFVTnhGU3UyUVFDOGZU?=
 =?utf-8?B?QlpmSkQ4NnY0dm4vSW00WUl1RjQrd1JDaVQrcVQyUXBhOXcwSEV4MVZnb0Vz?=
 =?utf-8?B?L1YvMU1XTjkxdTZCYWFLd0txejBsREdEdjJTSWtjdFJEd0JoV0NHdytJZlhs?=
 =?utf-8?B?d25aU0UrVXFMcDQ4OVBrdWlDYlU5eUo4WWRnQTRQWWF3aDFtcEQyK3pheU5w?=
 =?utf-8?B?dUtYVzlOa0xiRERSZGFxZk5QZWZ4Z21KVWEwdTNZS0tjU0kveno2a3QzcEdV?=
 =?utf-8?B?L2V0MlJmbWJxaE95K3U5dGJVdzBSNzJvZFZDOUhsNkw5aG5yOEJLa0VWaTI1?=
 =?utf-8?B?RitNNmxzMEczNjRyNU05UUJTanZWNUhidXQvN05pWkJVN0JYSC9vUU9vM2o0?=
 =?utf-8?B?S3NwQWFlQnNMSlVITkNwakg1OUpYcnB6K05QNVBWRmhKT0FER2N5NHdZSjB0?=
 =?utf-8?B?bGQ4QU8zR0k2bTM3QVFuYllJNDUrM2h4RWhwbndUb2dTODArV2k0K0RkaW5x?=
 =?utf-8?B?S3dWWVhIK0JNazZud0U0MUFQVDVVQ1BZWjBtUzJMeHdyTUJCZUhLU0oyV0dO?=
 =?utf-8?B?dm5pSFNLVGRyMDBTL3VZb2w5NVdlemdQTnJBWmpYR1A3UjZUVDYya1VpQUdn?=
 =?utf-8?B?TnRQYjZ3L0VRR0szU3NDSnlrYWpNakhnM3BHQVQrV2Q1R1RqV1RWbTd2aVBF?=
 =?utf-8?B?a2FhcWxNNVgzaFFwSFFyaGVtZXJ2eEZ3R2Z6alJNWFU1MDVtM25hODNheUpL?=
 =?utf-8?B?MXFlVEtCaFhQSlA3WlJ3L05qU0U1eHVNK3pYVnRRdUdyNUxBbXI5R1Q5RUFC?=
 =?utf-8?B?cStsNk1KU0N3eEpMU0VudExnVS9SR2NyVlVicWFWT2ozc0haTzYyNTBWWXo2?=
 =?utf-8?B?anRCUnJocHBrdVUwL1VmOExPQW9WVzVDaTBweWJ5VDQrS2l5MU1tWktzM1J4?=
 =?utf-8?B?REo1Y2U4b1BrRnVuek55ZlFWM0FkSXhLYUtpOERidFB0ZkpIVTVTNklaNWh6?=
 =?utf-8?B?MGV1ZUFLa2FPd2ZwYzRMVW0wWG9INDdQVk51UDhTcCtqSnMwOHJBQ1Nyem5j?=
 =?utf-8?B?REs2bFJYUlpTcC9sY3FvY1hmNzVNb0x4aEYvKytMMXIrUEEzU0VSM1M5WnA3?=
 =?utf-8?Q?VBf14dOaSrImnh7sfuHfJ1yTA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <27858D9F412A7248B0B1CCE9D2855226@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?Z3FXekJ2ZUNIbUljWUlmQXN6WmhsVDNwandGbVJTMDRNZk45TTVhamJtQ0Uy?=
 =?utf-8?B?NlY1WC8zWk9pc0JTZ1VXcm9Od2ZmRjlJd0dtNGxvZVlKR1pEMDFDNlU4eFlM?=
 =?utf-8?B?RzJ1aVoxREFVQ3ZYR0cvL0JvbGRRZHV6dkRFekVXc0NxU0ViaTVlOU9BdkJI?=
 =?utf-8?B?QlZkQXg0NkUvWURkNXk1Q1BNbW1hU084RFJrNkN6bzJVYm45QUdrN2xPTThq?=
 =?utf-8?B?UmFEb3YvZTlESWpLaEd6SUczMXZSbEF0S29zMENXdmtyYUMzRHhVMUJFZnRH?=
 =?utf-8?B?aWsrVzliZGQzdm02Y0hoSXlRanBQRzRZK1gxZDl6R2gvdDA4VzZYUGY0aHd2?=
 =?utf-8?B?ek5aQ0grMGZVUUdEbjhRdzAwNUxFVjQwVExYQ21ETWtrdFFOdnV2Rm1LSjR6?=
 =?utf-8?B?L2hsdEhlZzZMSkN6bXRsZXJsK2VLcTR3bHZlL0ZiY1MwcGNueFpDU1BXSDhx?=
 =?utf-8?B?cmp0dWxsclhrZEhHd0pHZVo5cHhFTFBia1NucklqZnEwTkN1UEE5NGFObHlB?=
 =?utf-8?B?Rk1IRUgzT0pueWN5bWc3V0pNZ2tFSHRzazJRcUhxbEZDZ29QbE9VMDJ6andY?=
 =?utf-8?B?ckZleTVxYkswNS9iTUE3NStGemdoWDA2ZkZ2ZWQwMGM2ZEhzcG02b3VCeXM1?=
 =?utf-8?B?UGs3S1BoSW1JV2hmLzk2bkVXa203V0RGdDNNSW9Vb245bkNkNnB0MUVrY0lh?=
 =?utf-8?B?c1kvNUt3WTIxNjhyeDVBWTRVSjlhU0RPUld0VVRPZ2NPYVY3TkhrRXhkWXd5?=
 =?utf-8?B?bjQ0V2FDUXVYeFA1dVFJTU03NnEyUldFTU1lMDFHN3AxYXlGcmRaTFJMdkRz?=
 =?utf-8?B?OWRBb2NTV1NQNXh2YW43OUt4UlRFV3ZpQ2IrUjh5djIwckoweFZiM3YrcWhQ?=
 =?utf-8?B?WVRXSjM3KzdaY1ByNnpHZFhiNll2NDRUekl0SkdNbEY2QWlVWGJtVVo5QitJ?=
 =?utf-8?B?WnhwTG9uOVZaY3cwc1h2bnhXTnlmOGlMRzd1eXpWdEszUTJIQWJaSjVRU05B?=
 =?utf-8?B?T3NPbGhvcW5jQzE0d0tRWk1BcUwyem01bjRLT0pDNmZwblVETE01QlhXSG5D?=
 =?utf-8?B?SU5qYmQ1QlhDWkJTZ1NqOXdLYnNkdU5VdExsV2JNSytBeDBJRVJwTGcyU0Rn?=
 =?utf-8?B?b1htTmpCRlh1UjRFTkN0bjI3V2phSjRCZlJCQTY2SEs4MnF1S3dxa0JQc2pC?=
 =?utf-8?B?b1BhcmdOQXRLeFNXMm1VZU55L0lGQi9kRTc2dlpTOG0yUHhLWWd3cFBqcDEz?=
 =?utf-8?B?MWQ1R3VLdHRoTVZHQ0RSUThqcHhYVnFVWi9jdmZONFZiWDRZdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c71afab4-1cb6-453d-0181-08dad7824bed
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2022 12:06:24.5265
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: urE6FJiTUKk6m+UdzhGAZ5wvFIll2x03efJUsStLeZPIaw3kL0JTygkPXUZNIgmP2S6Y8PrtyvBxQyZXPMnRpqClkysjVoLaqxzSx/fYqQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5039

T24gMDYvMTIvMjAyMiAwNDozMywgRGVtaSBNYXJpZSBPYmVub3VyIHdyb3RlOg0KPiBJdCBtYXkg
YmUgZGVzaXJhYmxlIHRvIGNoYW5nZSBYZW4ncyBQQVQgZm9yIHZhcmlvdXMgcmVhc29ucy4gIFRo
aXMNCj4gcmVxdWlyZXMgY2hhbmdlcyB0byBzZXZlcmFsIF9QQUdFXyogbWFjcm9zIGFzIHdlbGwu
ICBBZGQgc3RhdGljDQo+IGFzc2VydGlvbnMgdG8gY2hlY2sgdGhhdCBYRU5fTVNSX1BBVCBpcyBj
b25zaXN0ZW50IHdpdGggdGhlIF9QQUdFXyoNCj4gbWFjcm9zLg0KPg0KPiBBZGRpdGlvbmFsbHks
IFhlbiBoYXMgdHdvIHVudXNlZCBlbnRyaWVzIGluIHRoZSBQQVQuICBDdXJyZW50bHkgdGhlc2UN
Cj4gYXJlIFVDLCBidXQgdGhpcyB3aWxsIGNoYW5nZSBpZiB0aGUgaGFyZHdhcmUgZXZlciBzdXBw
b3J0cyBhZGRpdGlvbmFsDQo+IG1lbW9yeSB0eXBlcy4gIFRvIGF2b2lkIGZ1dHVyZSBwcm9ibGVt
cywgdGhpcyBhZGRzIGEgY2hlY2sgaW4gZGVidWcNCj4gYnVpbGRzIHRoYXQgaW5qZWN0cyAjR1Ag
aW50byBhIGd1ZXN0IHRoYXQgdHJpZXMgdG8gdXNlIG9uZSBvZiB0aGVzZQ0KPiBlbnRyaWVzLCBh
bG9uZyB3aXRoIHJldHVybmluZyAtRUlOVkFMIGZyb20gdGhlIGh5cGVyY2FsbC4gIEZ1dHVyZQ0K
PiB2ZXJzaW9ucyBvZiBYZW4gd2lsbCByZWZ1c2UgdG8gdXNlIHRoZXNlIGVudHJpZXMgZXZlbiBp
biByZWxlYXNlIGJ1aWxkcy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogRGVtaSBNYXJpZSBPYmVub3Vy
IDxkZW1pQGludmlzaWJsZXRoaW5nc2xhYi5jb20+DQo+IC0tLQ0KPiAgeGVuL2FyY2gveDg2L21t
LmMgfCA1OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDU0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+DQo+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jDQo+IGlu
ZGV4IDVkMDUzOTljM2E4NDFiZjAzOTkxYTNiZWQ2M2RmOWE4MTVjMWU4OTEuLjUxN2ZjY2VlNjk5
YjJhNjczYmE1MzdlNDc5MzNhZWZjODAwMTdhYTUgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9tbS5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jDQo+IEBAIC04NDksNiArODQ5LDQ1IEBA
IHN0YXRpYyBpbnQgY2ZfY2hlY2sgcHJpbnRfbW1pb19lbXVsX3JhbmdlKA0KPiAgfQ0KPiAgI2Vu
ZGlmDQo+ICANCj4gK3N0YXRpYyB2b2lkIF9faW5pdCBfX21heWJlX3VudXNlZCBidWlsZF9hc3Nl
cnRpb25zKHZvaWQpDQoNClRoaXMgd2FudHMgdG8gYmUgYXQgdGhlIHZlcnkgYm90dG9tIG9mIHRo
ZSBmaWxlLsKgIChBbmQgYWxzbyBpbiB0aGUNCnByZXZpb3VzIHBhdGNoIHRvIHJlbW92ZSB0aGUg
X1N0YXRpY19hc3NlcnQoKSkNCg0KPiArew0KPiArICAgIC8qIEEgYnVuY2ggb2Ygc3RhdGljIGFz
c2VydGlvbnMgdG8gY2hlY2sgdGhhdCB0aGUgWEVOX01TUl9QQVQgaXMgdmFsaWQNCj4gKyAgICAg
KiBhbmQgY29uc2lzdGVudCB3aXRoIHRoZSBfUEFHRV8qIG1hY3JvcyAqLw0KPiArI2RlZmluZSBQ
QVRfVkFMVUUodikgKDB4RkYgJiAoWEVOX01TUl9QQVQgPj4gKDggKiAodikpKSkNCj4gKyNkZWZp
bmUgQkFEX1ZBTFVFKHYpICgodikgPCAwIHx8ICh2KSA+IDcgfHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcDQo+ICsgICAgICAgICAgICAgICAgICAgICAgKHYpID09IE1TUl9Q
QVRfUkVTRVJWRURfMSB8fCAodikgPT0gTVNSX1BBVF9SRVNFUlZFRF8yKQ0KPiArI2RlZmluZSBC
QURfUEFUX1ZBTFVFKHYpIEJVSUxEX0JVR19PTihCQURfVkFMVUUoUEFUX1ZBTFVFKHYpKSkNCj4g
KyAgICBCQURfUEFUX1ZBTFVFKDApOw0KPiArICAgIEJBRF9QQVRfVkFMVUUoMSk7DQo+ICsgICAg
QkFEX1BBVF9WQUxVRSgyKTsNCj4gKyAgICBCQURfUEFUX1ZBTFVFKDMpOw0KPiArICAgIEJBRF9Q
QVRfVkFMVUUoNCk7DQo+ICsgICAgQkFEX1BBVF9WQUxVRSg1KTsNCj4gKyAgICBCQURfUEFUX1ZB
TFVFKDYpOw0KPiArICAgIEJBRF9QQVRfVkFMVUUoNyk7DQo+ICsjdW5kZWYgQkFEX1BBVF9WQUxV
RQ0KPiArI3VuZGVmIEJBRF9WQUxVRQ0KDQpHaXZlbiB0aGF0IHlvdSd2ZSByZXdvcmtlZCB0aGUg
UEFUIGRlY2xhcmF0aW9uIHRvIGJlIG9mIHRoZSBmb3JtIChNVCA8PA0Kc2hpZnQpLCBJJ20gbm90
IHN1cmUgaG93IG11Y2ggdmFsdWUgdGhpcyBjaGVjayBpcy4NCg0KPiArI2RlZmluZSBQQVRfU0hJ
RlQocGFnZV92YWx1ZSkgKCgocGFnZV92YWx1ZSkgJiBfUEFHRV9QQVQpID4+IDUgfCAgICAgICAg
ICAgICAgIFwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoKHBhZ2VfdmFsdWUp
ICYgKF9QQUdFX1BDRCB8IF9QQUdFX1BXVCkpID4+IDMpDQoNCnB0ZV9mbGFnc190b19jYWNoZWF0
dHIoKQ0KDQo+ICsjZGVmaW5lIENIRUNLX1BBR0VfVkFMVUUocGFnZV92YWx1ZSkgZG8geyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiArICAgIC8qIENoZWNrIHRoYXQg
dGhlIF9QQUdFXyogbWFjcm9zIG9ubHkgdXNlIGJpdHMgZnJvbSBQQUdFX0NBQ0hFX0FUVFJTICov
ICAgIFwNCj4gKyAgICBCVUlMRF9CVUdfT04oKChfUEFHRV8jI3BhZ2VfdmFsdWUpICYgUEFHRV9D
QUNIRV9BVFRSUykgIT0gICAgICAgICAgICAgICAgICBcDQo+ICsgICAgICAgICAgICAgICAgICAo
X1BBR0VfIyNwYWdlX3ZhbHVlKSk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXA0KPiArICAgIC8qIENoZWNrIHRoYXQgdGhlIF9QQUdFXyogYXJlIGNvbnNpc3RlbnQgd2l0
aCBYRU5fTVNSX1BBVCAqLyAgICAgICAgICAgICAgIFwNCj4gKyAgICBCVUlMRF9CVUdfT04oUEFU
X1ZBTFVFKFBBVF9TSElGVChfUEFHRV8jI3BhZ2VfdmFsdWUpKSAhPSAgICAgICAgICAgICAgICAg
ICBcDQo+ICsgICAgICAgICAgICAgICAgIChNU1JfUEFUXyMjcGFnZV92YWx1ZSkpOyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiArfSB3aGlsZSAoMCkNCj4gKyAgICBD
SEVDS19QQUdFX1ZBTFVFKFdUKTsNCj4gKyAgICBDSEVDS19QQUdFX1ZBTFVFKFdCKTsNCj4gKyAg
ICBDSEVDS19QQUdFX1ZBTFVFKFdDKTsNCj4gKyAgICBDSEVDS19QQUdFX1ZBTFVFKFVDKTsNCj4g
KyAgICBDSEVDS19QQUdFX1ZBTFVFKFVDTSk7DQo+ICsgICAgQ0hFQ0tfUEFHRV9WQUxVRShXUCk7
DQo+ICsjdW5kZWYgQ0hFQ0tfUEFHRV9WQUxVRQ0KPiArI3VuZGVmIFBBVF9TSElGVA0KPiArI3Vu
ZGVmIFBBVF9WQUxVRQ0KPiArfQ0KPiArDQo+ICAvKg0KPiAgICogZ2V0X3BhZ2VfZnJvbV9sMWUg
cmV0dXJuczoNCj4gICAqICAgMCAgPT4gc3VjY2VzcyAocGFnZSBub3QgcHJlc2VudCBhbHNvIGNv
dW50cyBhcyBzdWNoKQ0KPiBAQCAtOTYxLDEzICsxMDAwLDI0IEBAIGdldF9wYWdlX2Zyb21fbDFl
KA0KPiAgDQo+ICAgICAgICAgIHN3aXRjaCAoIGwxZiAmIFBBR0VfQ0FDSEVfQVRUUlMgKQ0KPiAg
ICAgICAgICB7DQo+IC0gICAgICAgIGNhc2UgX1BBR0VfV0I6DQo+ICsgICAgICAgIGRlZmF1bHQ6
DQo+ICsjaWZuZGVmIE5ERUJVRw0KPiArICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19HX1dBUk5J
TkcNCj4gKyAgICAgICAgICAgICAgICAgICAiZCVkOiBHdWVzdCB0cmllZCB0byB1c2UgYmFkIGNh
Y2hhYmlsaXR5IGF0dHJpYnV0ZSAldSBmb3IgTUZOICVseFxuIiwNCj4gKyAgICAgICAgICAgICAg
ICAgICBsMWVfb3duZXItPmRvbWFpbl9pZCwgbDFmICYgUEFHRV9DQUNIRV9BVFRSUywgbWZuKTsN
Cg0KJXBkLsKgIFlvdSBhYnNvbHV0ZWx5IHdhbnQgdG8gY29udmVydCB0aGUgUFRFIGJpdHMgdG8g
YSBQQVQgdmFsdWUgYmVmb3JlDQpwcmluaXRpbmcgKGRlY2ltYWwgb24gYSBQVEUgdmFsdWUgaXMg
dXNlbGVzcyksIGFuZCAlUFJJX21mbi4NCg0KPiArICAgICAgICAgICAgcHZfaW5qZWN0X2h3X2V4
Y2VwdGlvbihUUkFQX2dwX2ZhdWx0LCAwKTsNCg0KQXMgSSBzYWlkIG9uIElSQywgd2UgZG8gd2Fu
dCB0aGlzLCBidXQgSSdtIG5vdCBjZXJ0YWluIGlmIHdlIGNhbiBnZXQNCmF3YXkgd2l0aCBqdXN0
IGVuYWJsaW5nIGl0IGluIGRlYnVnIGJ1aWxkcy7CoCBfUEFHRV9HTlRUQUIgd2FzIG9rIGJlY2F1
c2UNCml0IGhhcyBhbHdheXMgYmVlbiBsaWtlIHRoYXQsIGJ1dCB0aGVyZSdzIGEgbm9uLXRyaXZp
YWwgY2hhbmNlIHRoYXQNCnRoZXJlIGFyZSBleGlzdGluZyBkb20wIGtlcm5lbHMgd2hpY2ggdmlv
bGF0ZSB0aGlzIGNvbnN0cmFpbnQuDQoNCj4gKyAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0K
PiArI2VuZGlmDQo+ICAgICAgICAgIGNhc2UgX1BBR0VfV1Q6DQo+ICAgICAgICAgIGNhc2UgX1BB
R0VfV1A6DQo+IC0gICAgICAgICAgICBmbGlwIHw9IChsMWYgJiBQQUdFX0NBQ0hFX0FUVFJTKSBe
IF9QQUdFX1VDOw0KPiArICAgICAgICBjYXNlIF9QQUdFX1dCOg0KPiArICAgICAgICAgICAgLyog
Rm9yY2UgdGhpcyB0byBiZSB1bmNhY2hhYmxlICovDQo+ICsgICAgICAgICAgICByZXR1cm4gZmxp
cCB8ICggKGwxZiAmIFBBR0VfQ0FDSEVfQVRUUlMpIF4gX1BBR0VfVUMgKTsNCj4gKyAgICAgICAg
Y2FzZSBfUEFHRV9XQzoNCj4gKyAgICAgICAgY2FzZSBfUEFHRV9VQzoNCj4gKyAgICAgICAgY2Fz
ZSBfUEFHRV9VQ006DQo+ICsgICAgICAgICAgICByZXR1cm4gZmxpcDsNCj4gICAgICAgICAgfQ0K
PiAtDQo+IC0gICAgICAgIHJldHVybiBmbGlwOw0KDQpUaGlzIHdhbnRzIHJld29ya2luZyBvdmVy
IEphbidzIHN1Z2dlc3Rpb24gaW4gcGF0Y2ggMSwgYW5kIG1vZGlmeWluZyB0bw0KcmVkdWNlIGNo
dXJuLsKgIChLZWVwIF9QQUdFX1dCIGluIHRoZSBzYW1lIG9yZGVyIFdSVCBfUEFHRV9XVCwgdGhl
DQp1bmNhY2hlZCBtZW1vcnkgdHlwZXMgc2hvdWxkIHNpbXBseSBicmVhaywgYW5kIGRlZmF1bHQg
c2hvdWxkIGJlIGF0IHRoZQ0KZW5kLikNCg0KfkFuZHJldw0K

