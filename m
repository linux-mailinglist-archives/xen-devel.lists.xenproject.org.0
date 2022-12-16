Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D62664F43B
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 23:41:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465062.723644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6JNf-00027q-Kv; Fri, 16 Dec 2022 22:40:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465062.723644; Fri, 16 Dec 2022 22:40:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6JNf-00024U-IB; Fri, 16 Dec 2022 22:40:39 +0000
Received: by outflank-mailman (input) for mailman id 465062;
 Fri, 16 Dec 2022 22:40:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Zr/=4O=citrix.com=prvs=342bb51ac=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p6JNe-00024O-E8
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 22:40:38 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7469e3b-7d92-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 23:40:36 +0100 (CET)
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Dec 2022 17:40:30 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO3PR03MB6759.namprd03.prod.outlook.com (2603:10b6:303:179::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.15; Fri, 16 Dec
 2022 22:40:25 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.019; Fri, 16 Dec 2022
 22:40:25 +0000
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
X-Inumbo-ID: a7469e3b-7d92-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671230436;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GrMm7LbLeNO+jBdvmSUZ/XmWutnjRhifjOyhwJzR0Yg=;
  b=KKA4Ar89PyKPpa7l0BAu9j2emijFRc4dTo2MJiMTnlzgWG95DHAKDlHA
   2ijac2z3AUtNJthT8JNAPj/Dke5+6up6bbO8kLY8vzX/jPWAC8tIG+DfO
   ZBowauYUJ8T7vXfD/0rL2+YxDCNFsiJrOaZFooBFjgL7Ab8lhEYYwwxbR
   g=;
X-IronPort-RemoteIP: 104.47.57.177
X-IronPort-MID: 88343321
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jaT+Qag3fyXrubplol42c4e6X161QBEKZh0ujC45NGQN5FlHY01je
 htvUWCDO63fM2vyeYwjadu+pkJSvMLVztQ3GQRoqC8xQ3kb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5gaAzyJ94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQqJ29RfwCmhdmE/5DrW7dJndwgDI7CadZ3VnFIlVk1DN4AaLWaGuDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEuluGyb7I5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6RO3jqqUx2gT7Kmo7VCFGVGO3rOaFo2mGS8xYc
 kEYwxUrlP1nnKCsZpynN/Gim1aUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebTAjy
 FKhhd7iAj1r9rqPRhq16bO8vT60fy8PIgc/iTQsSAIE55zvpd81hxeWF9J7Svfq0ZvyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLztJ6s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:Vaa5cKuLBKf5lfvgyvEn0sJD7skDS9V00zEX/kB9WHVpW+eTna
 mV7ZMmPHjP5Ar5OUtOpTnkAsK9qBznm6KdjbNxAV7BZniEhILYFuFfBOLZqlWLdhEWndQtt5
 uIHZIObOHYPBxXitv7/Rn9M/tI+qjgzElwv5a680tQ
X-IronPort-AV: E=Sophos;i="5.96,251,1665460800"; 
   d="scan'208";a="88343321"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0itp1/Qwo59cxaKfFQVnYphlKfmFyTkDJwoY2NKE6yJ0RV1d3ESyaAO4sp30qASQhkutF6djsS9a/W/w4q7l6b5z8IiL2HcWUYIYvlt6ucIcqHAAit7ie3nlPFDoW16qSl5twg4UwGkRct75M993Ru3+PHrMh09sEg+8ur33h6apyN7JTBiU/P2h4qIK6nezL+uUf81536vggSKeWPROJcQxDlAnr3ET1wweONbhvL2tHDKNriKvHcAlI2OBoSve3S64DC24ia5sWzKcjo3E8Z5nvM93n6RxThEwmH66aZdQzJma4qeZIJ5cXFHR5Z2kpy+8NMYZ4UnV9OAM6myzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GrMm7LbLeNO+jBdvmSUZ/XmWutnjRhifjOyhwJzR0Yg=;
 b=gzTGCMbiZNUV9A+WeUFcN/Yy5cY3cR4lm9XcShUOFK0vwi9BP8E13+p7TqiO3l/ROAryLRY8h0rxNgcOTlaiHpeMpBUjjz90i111inM2USs5GveHoTMHldArK+20aMOP3v3bH+2o81j60g4ukBn3K8cILy9IlH3Nbhdo/GL2NRf5RuPfGgOpyHmPs64zdA8XQmOh8UF7Na8KcDHReCDfiKrJ/IZkIHrkPyEMSSnw3ss+0nzr+z9zVrm+c/5uH1zSvvmc4NkYh9Mvp6V7GKWBgJ8Q9hXuZdtl5yhThQk8YmW8C2jtj5p2GRPTUet9FR3ke/b/CvgFX19I9id9Kppdqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GrMm7LbLeNO+jBdvmSUZ/XmWutnjRhifjOyhwJzR0Yg=;
 b=ANd+bwFX+gERNZfmXRXNPU5BcRhcgHNketYZov2ZCYGR8EZM/5ZrQG4qeFHJe5PWNEo6D0gHPKkEK7kghv6PV8gfMGjpp4HyDPFHGHdc1oHxhru+xbQ06DZTlTbtC2QEAtpg0daElgfO9KNnJbCA1S2kNdGTqgHY7N/njVhIOHk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH v4 01/11] tools/ocaml/libs/{xb, mmap}: use
 Data_abstract_val wrapper
Thread-Topic: [PATCH v4 01/11] tools/ocaml/libs/{xb, mmap}: use
 Data_abstract_val wrapper
Thread-Index: AQHZEXviniqeTfc5ckCqx5I7LdFfsa5xG80A
Date: Fri, 16 Dec 2022 22:40:25 +0000
Message-ID: <bd686c65-dbf6-4ec0-9094-1c561cd6ee1d@citrix.com>
References: <cover.1671214525.git.edwin.torok@cloud.com>
 <4eb53994bcc3548e8da6e8ab9c50acf822b85702.1671214525.git.edwin.torok@cloud.com>
In-Reply-To:
 <4eb53994bcc3548e8da6e8ab9c50acf822b85702.1671214525.git.edwin.torok@cloud.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CO3PR03MB6759:EE_
x-ms-office365-filtering-correlation-id: d7cd3943-97f5-47ec-12dc-08dadfb6861d
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 10+yRT2xBD5sevo7GUDCNRw9wUiDGClXoYURlmT8BCvn7dlKiCO7qPEX+eP7RP1J/asnn5d9yXXSBgpdW13Suoa1KRPJzXgJj1qnLxBPiT2fwQRv3SvMX0o/zmXBt0qk7kNBcbGJQfZj8WvhrctWx8nY5TA00QQKlBaUAdAVfPFX7Zm4Jx90kDxik0X2LmMoTKKlPIVE0Srs5JD99/iM/d6udDHXhnZfC7T5Meb5J1MPUaLviWhuNuxc12EIpmGqsDuPOQZ5fP2ztcIcrM9ZrfS4xDdVuVaYMyZ837zxXgoSP7RBjzK4rnL7DTPXj+AaxOLPcIANKRKz0Bbg4A5yuWdlqqR7OMKfWPSiGW8BlSjLIBrunNLSO5kw9VEUOt6m1QxLBRUoIrsVRJc1HSPzPFMtSWNV5sTxnQktNEb2Krhtj+CRiOtWqNmMbft7fBlmw5jpypRNiffKUpik5PUKp6ROygMxxvcPBXuH2rv1MHwc1U29W20i42uAPnBgLW4JZfXsU9eqT2ygqKrtS96pzIGSboyMfzcU6Bm+j/AO4E04bl9rt2+cxMmJzukpQHaY/OqAroLuLNATj+BybbbsrI3QIeLTRdwHtET3mvIdKG19WUtWlAD9qUmLX9LmEUtkPQi2+3bSQyh4hGBG8lKo6ox+fvLsXnmZ9AQo/lKtjph542m8iVRprV9IfKoQHVxfUXarf+DDIX9C1/eR+oJu07EVrY/bEeVo10PMjpT65zejOVW6agBLVfa1Ua3GNpyGtnV2O4+F82oMrie4CToixg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(366004)(39860400002)(346002)(396003)(451199015)(66476007)(36756003)(8936002)(4326008)(66556008)(76116006)(8676002)(91956017)(66446008)(64756008)(66946007)(316002)(110136005)(54906003)(107886003)(41300700001)(82960400001)(38100700002)(122000001)(38070700005)(71200400001)(6486002)(53546011)(2616005)(86362001)(478600001)(26005)(6506007)(6512007)(31696002)(186003)(2906002)(31686004)(4744005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NTJNRGZpbUZhSkZ2MGU5MnNYcHlVc3BBV241WEVtYVZlaUJUTG9iSkhub09X?=
 =?utf-8?B?Mzk5TFFJdmxBWFYyTjRZMFQ0T1JRa25tSEp5NnR0OGQ3cjBLRmVtOW05d2Vl?=
 =?utf-8?B?eWdzNGsxeWwvamVGeUlwbWVkaEhtajlsaXNMaW9OZmtxcGVrd2VpQXpnU3FF?=
 =?utf-8?B?WTJMNFl3UENrTURIRllXaktNZjR1SzBNNEhtRWU5RUEzS05yTkRrTVlXWEZF?=
 =?utf-8?B?Um5uTENCb3ZoNmh2dmNmRVV5Vk9VMW01eis2aUhZcHgxVTNxUVZ6dVUxSlJC?=
 =?utf-8?B?N1pPdHVybGxJblhnNEpiOFdjSVVUNno5WVY2d0ZzWlhTeGhLN1dRL0UyZVly?=
 =?utf-8?B?ajVRMUFzT2VQc1V5S09xMlRkcUIwN3BYV2tDYUJ4eXI0T3hYZ2lyNFpaTmM5?=
 =?utf-8?B?RVp6WDRNSFlVclRTVjlmRjVVd1dlYnVUeWhFN3hMWWVyQ0lBMHRoc2thUytU?=
 =?utf-8?B?dCtFdnFhZzBCVXlBTzY5WDhIOEV4KzVMNGM5UHpiZzRuSS8wbnBFT2M5dVYy?=
 =?utf-8?B?UStaUXZkNzJ4bW15RXRQa3R0bUE1ZllLZHBPSmtNeS9YT3ErcnF6K1RlajFT?=
 =?utf-8?B?N3N0dlVDYlZiU1N5TFhneDdjRXpGdDl6V3VLYVJjYW92cTZDSDBuSDRGUkdp?=
 =?utf-8?B?ODJ4aHFGK1BVdURuRzh6eEd1UkZIdHJMajlXY0F5bm5KQ01EanVjZTFrVVNi?=
 =?utf-8?B?dW9CRitwRERaN3RYVmU1QnRIVGxoWkp5Y0pMWmJEdmF1amwwRFpPb0RRdTc4?=
 =?utf-8?B?cXR0eEpGS0FDWVYrYmI4VktuZjFkZzJ3NGVDU0pIc3lxSE9NVkRDaDJXL3lv?=
 =?utf-8?B?Rlptd3FHNlU5NDl5d1c0QmZCR1lySmpEZDhPZ01UVFZ3ZWFVdGFTT3BOUlYx?=
 =?utf-8?B?OUZXM09USzFiR0g2aDF4c2lyRFlNbytiRkd6U2dZQ3BWMTFRQ3g1QUlMMVIz?=
 =?utf-8?B?M0t0c05oTmlGMzZIUEJwc3lKTVZ6cmpmbU5taklzRHIzbFVCU1RGRmk5M3RI?=
 =?utf-8?B?enRyckhuVC9kM2ZrNU9yRHd5UERiUWZHWStNWExRcDk2a2pXMVZrZ2svNjdO?=
 =?utf-8?B?Qk9oNXVsMmk2UUxBT3loSmF1elFlaE80b2VNZFd2K2NVbFZzUkt3YTlQVzRw?=
 =?utf-8?B?MU96ZFBwQ2xSQmRKOUl4dWs5VC91VUpsTDdOeGp6Uk1HRUQrTEhoUGtKemp4?=
 =?utf-8?B?OUtqRDZNaldIS1RVd29JUkpUNmxjMVBsYlVGcXdZYnFjcWY5NXRJQml0QmVZ?=
 =?utf-8?B?RlVOUUtWaU5uMno5WlRoOGpMdDROamJmazE2MlNLc0NnQlQ0WkI5L1pSNDVz?=
 =?utf-8?B?UWVGZnFRNG96RGNoTjVRT3FUamw0MXhxV25oT09DSmw5clU4V3FEVkl6NmlV?=
 =?utf-8?B?cUxsdExPbkx3NCthcmg2MHlsR2F6ajJMOVhyaXM5YlNleE9tTXNhb1F2V3VJ?=
 =?utf-8?B?MWYwMSt1TXh2akMrSTlyMUd0NWtXVXBHb3IvWjcrdFdxWTFQaldsVVU3Vlgx?=
 =?utf-8?B?aXRWbVhJeDZUUlJQSWhvdVNUZ1hlWGxXSEFTL2xnWTBFNlhiK0RPQy9sb3Qr?=
 =?utf-8?B?clMrK1NENmZpSktwWkhlNDhNOWhGZnkyV0VqZkh5d0pMUisxU1lIUmIzTzAx?=
 =?utf-8?B?Tkd5ZG56Vm9sbGNhUElvWDdmUjdTL1d4TjYvMkU0QTBxTXRXa3gxVDNpWGNG?=
 =?utf-8?B?eTNiWkVJMVNnVkd3T1hTY2tPeFE5eUJmQUxHUitzOFBPS2VncXdoeGhZbzZT?=
 =?utf-8?B?aXVBOWlMSTVGUHRnWDBXNjlCcTRpLzRCbXJ3OUlKZGJ0MEl4dXBPdTlPN1hx?=
 =?utf-8?B?M0E1Q0xiQk42dStwOTIyUFdtS0lBaFhXZWwzb0l6VC9nSlh0bXFOclZkVS9q?=
 =?utf-8?B?N0ZmenpFZFMzNUpsMitMM2J1WXNWYzNTR0htcVpPdmRqVVF0aEJBOHNMdHhO?=
 =?utf-8?B?MlMzeUxBN09meHlRK1RCZW9hR3lrN2VWRHpkejBEajROb0U5eTZQdnBkNEQx?=
 =?utf-8?B?QnpvMHFwVXgxRGVpc3dXTldPNVR1clN6bGhrZDBCeFBoNG1FaDZKN2U3TFVD?=
 =?utf-8?B?bUdDOVlSc0F5SWs0VCtCOURPaU44RjhTV1Z6Z212bFh0K2RLVXUxMnVydGdE?=
 =?utf-8?Q?xUrjGfeE1N/7lBpHzebqFsc71?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFF723CC5EA3964D90118D3308D67CAC@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7cd3943-97f5-47ec-12dc-08dadfb6861d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2022 22:40:25.2972
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5VyAJY5peeH4GTaKC7GWdpzDa9v3ju6EorMM+tSs55+ok/BYobCT5EgkEtjZ2d+pfXjSjA0iYLYERuUxU5KQAC1PEorckI6x2gJIXsJ/8i8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6759

T24gMTYvMTIvMjAyMiA2OjI1IHBtLCBFZHdpbiBUw7Zyw7ZrIHdyb3RlOg0KPiBkaWZmIC0tZ2l0
IGEvdG9vbHMvb2NhbWwvbGlicy9tbWFwL21tYXBfc3R1YnMuaCBiL3Rvb2xzL29jYW1sL2xpYnMv
bW1hcC9tbWFwX3N0dWJzLmgNCj4gaW5kZXggNjVlNDIzOTg5MC4uNjZmMThkNDQwNiAxMDA2NDQN
Cj4gLS0tIGEvdG9vbHMvb2NhbWwvbGlicy9tbWFwL21tYXBfc3R1YnMuaA0KPiArKysgYi90b29s
cy9vY2FtbC9saWJzL21tYXAvbW1hcF9zdHVicy5oDQo+IEBAIC0zMCw0ICszMCw4IEBAIHN0cnVj
dCBtbWFwX2ludGVyZmFjZQ0KPiAgCWludCBsZW47DQo+ICB9Ow0KPiAgDQo+ICsjaWZuZGVmIERh
dGFfYWJzdHJhY3RfdmFsDQo+ICsjZGVmaW5lIERhdGFfYWJzdHJhY3RfdmFsKHgpICgodm9pZCop
KHZhbHVlKikoeCkpDQoNCigodm9pZCAqKSh4KSkNCg0KSSB0YWtlIGl0IHRoaXMgaGFzIGNvbWUg
ZnJvbSB0aGUgT2NhbWwgaGVhZGVycz/CoCBUaGUgY2FzdCB0byAodmFsdWUgKikNCmluIHRoZSBt
aWRkbGUgaXMgZW50aXJlbHkgY2FuY2VsbGVkIG91dC4NCg0KQ2FuIGJlIGZpeGVkIG9uIGNvbW1p
dC4NCg0KfkFuZHJldw0K

