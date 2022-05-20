Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F8B52E134
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 02:31:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333357.557174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrqX9-0002LR-2h; Fri, 20 May 2022 00:30:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333357.557174; Fri, 20 May 2022 00:30:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrqX8-0002Ir-V7; Fri, 20 May 2022 00:30:22 +0000
Received: by outflank-mailman (input) for mailman id 333357;
 Fri, 20 May 2022 00:30:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mBQL=V4=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nrqX7-0002IS-24
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 00:30:22 +0000
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04847c2b-d7d4-11ec-837e-e5687231ffcc;
 Fri, 20 May 2022 02:30:17 +0200 (CEST)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 17:30:14 -0700
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 19 May 2022 17:30:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 19 May 2022 17:30:14 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 19 May 2022 17:30:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 19 May 2022 17:30:13 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 19 May 2022 17:30:13 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN6PR11MB4019.namprd11.prod.outlook.com (2603:10b6:405:78::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Fri, 20 May
 2022 00:30:11 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb%2]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 00:30:11 +0000
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
X-Inumbo-ID: 04847c2b-d7d4-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653006617; x=1684542617;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uGbVWzwOUCqloBLTEE9qFy9a6PxFR60HT2g9mikyTZI=;
  b=NYDAziuTQPMPRkF2+qos8bgZ5RMGwx+JJyI9WWnhrysRlWUceoFNZzOT
   1jcbQp0KAttm4wKnP9y70NV1WN9k3Flm6oAs3l0k5MuwgqpMZ28zgplen
   zpuDae6OR1WBurk79C+dKv/wPP4mxLwOJt3kfwH083qmH8HJSfI+l5Nnp
   UHkorUD9iaKxt1dqjdphrXSW9Y+C5LSpBe7etL/kDRrFofwv+kwgTYcdv
   67lQX46Su6GuF1YgNLaLPLbOZ7jk3uTYK0n02ZDWKQ9OTeC8miLSAurx8
   d1IORAOjBZlpcIoKbI5LqWs2cKxvwhG7bnLe/BRFgjsMKSEES9gUzwKqi
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="335481201"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; 
   d="scan'208";a="335481201"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; 
   d="scan'208";a="606760549"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6dJKP5OVzU8paOtAZfZ2xvzUG6ceshLkgT6cWRfqREiUBwfg/AZFUV2P43PJRKX6tze2DPG2VtoAAOUMllYQ1W9omnWoqql5fjP8zGcyCSKcJ4SO1PAYPDBpD4Ce9YI9yvJgUkASsVBz65Xz7l3pZKHowyk4CXCOMJl7q9emrL1q7+A1OxUZmvNPcxUN4C7JLzPsJnmrSyDb4YYT6ei+QPxVMNYf4ofBdgN1IidwVxnLPuI+XEeSc/pnVrnEVJSV8OwpwazwVGUoNAHIj6Q2zfhum/61366vx59xE+LCKqpfpyHsXo7ht2tCS2OU0Zct861GBfTnBlzy8Olak7nvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGbVWzwOUCqloBLTEE9qFy9a6PxFR60HT2g9mikyTZI=;
 b=IZBO2O5GBIF0wBOrxJUgAJ37+inNY7D2N3E3Ajx7GPchET6TE2xd8zBdwGmwmDKhscwBDtN5pbWnJl+BbtOyWEADDuTb1ZUuibprJWIBwauY4HAftrupVwh7cTXhM8AW/Ou1hJBUW+MuSxpKXg1fdmctTsjwscwvNg8W5vy5wk8MgsHDFD0nEAjE5NcHAZW5fhwfGzyW3FS0QZiTuwMFbhpG4bterQ1swerLHyngQvRnjdAc794lz2byADmhanM8u8f4+swJ8Xp+XBW+Ha6TiOc6pSY+Qc7h6DOuYMnWX/6GwlRA0ov0p9/XfUv7o9xFfdolENxcvx47hLc7nWLLVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: Ping: [PATCH] VT-d: fix !HVM build
Thread-Topic: Ping: [PATCH] VT-d: fix !HVM build
Thread-Index: AQHYVi+q4CycUma8TECQ0Ag+stUm460mSTmAgADL0nA=
Date: Fri, 20 May 2022 00:30:11 +0000
Message-ID: <BN9PR11MB52764F6D4A36EEE9B69DE6D78CD39@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <431d4212-07b8-63d5-1a4d-7e8c7a9108ea@suse.com>
 <072cf387-f61e-919e-a0a5-7c767d91d99c@suse.com>
In-Reply-To: <072cf387-f61e-919e-a0a5-7c767d91d99c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a9e7e55-3f9c-49a8-3241-08da39f7e6b7
x-ms-traffictypediagnostic: BN6PR11MB4019:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR11MB4019CC6B45ED928ED91FD66E8CD39@BN6PR11MB4019.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n5hJTjXMmtiNH1Z1l/9iC4mEnH18KlcXT9SqO8NW6KOLEMmsR/k440WB+Jy3kNQkFGQOfbpcchbA6AmgEbbcSfcSRYbHd+1FSAY9TuW8Lv5Xyp4uZNCZzYas/oGFYyToU25RIXHeX2W06Yd9tCQ2kYr+owHbi/AQ6dQQU641/VF1EIa/SjwEUR8yRboDEh8z6Z6PWMaOTYtLptyeGzLhnD8qA0f7/2LMJLAkv5iYSWpMvn6xVU6bA5RFtnn6TTshMWbIOZhAobQ90LbC6guOnSkbz2T3cJ8qRtI9U4Hiofv5F7S3ZbYFOwg5BBy82nAovIa8ZGkXfAxPjwiANW7S7SjsFLlWrmxLm27wJ3eHIQQ3XNwQrn73Fjs823l1vRGNxWS+VEYuCz1Rxos8KUwpIPT72GZFvx7BFjBJeUbFwEyeD6TmdTLGq6YuHHP1rE5VYpGdK7gnvEObG8Qk8AS0w2Fd7eBVa4PwbA+Kg33eDoGfjguZccqdVXWC/jtllu8GAD1LMo/6LcvRpI2SyvlAAc+TG9+HYmRdWVg1JGYcfk5ELEtkCahGny3dp5n2wjiWe/LUALs5XMECfzAtXqlDXIoRuvWV/pyWsLoPVi1KY4tBOben4V6e9hBUkxP9pri9m7+nkNv7mqc3aB74ovBmrnOKj3mjydqXjqljKcMQ6y61vAroTmRUvOViigZKl7w2/zfnS05hPaDRDJpsWvQLvg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(122000001)(8936002)(38070700005)(38100700002)(2906002)(82960400001)(52536014)(7696005)(71200400001)(86362001)(8676002)(53546011)(508600001)(6916009)(6506007)(186003)(316002)(54906003)(66476007)(66556008)(64756008)(66446008)(76116006)(66946007)(55016003)(83380400001)(33656002)(26005)(9686003)(5660300002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWRnbHBZQlVaSnl6d3Fjb3pvMXdQdVRhK0QwOEtYY2NIWitMTytzWWZyb2NQ?=
 =?utf-8?B?S0dBY0lOUnBBTi9CaDl0aVJ0K1llWEh5aVdjYU9PR1F0OHFYY1cwWFk0Yzgw?=
 =?utf-8?B?U1drWDRqU0lraXQySnVVcll1TlNtZ0ZiT0JuRDFKRCt1ZHl2c21PWmJRQ21t?=
 =?utf-8?B?eWdGcWprNWlQZ05hWDNNZ1NKU2VnV3ptMVB1N1doY293NXFOTlo1K0dhTm1O?=
 =?utf-8?B?Rlh3cUsrTjNMZGZjZG9RaCtvUTBDc2tYTFZTZ2xIR3VibERWRnJ4Tm5Ubk94?=
 =?utf-8?B?TjBRMDJZVlh5Umw2VjJFT0NqbUVSRHpVZnNvSkVCcEhaaFVURnRXako5d252?=
 =?utf-8?B?VVJuS1BURVdqY09Pa0hUN1RzVzhqcVZ4L0ErcmZ5UER2b2wzZ3RISHBLemVt?=
 =?utf-8?B?Qjl5c2V5YyttUmRVbnd2K2xBQWdpakN3WE52NU9vRk5ERFNabi9WNmNYSmZF?=
 =?utf-8?B?WHZPdDJSOWhVeE04TTNqZWhjZVFDUS9oSmxTc01FK0lzRnRydTAwU05OUi92?=
 =?utf-8?B?UXhvOVltSHRyYlU1MHcrVnZhMHZONVpqMXpGYlB3VU1leVZHZFVWcHNxdlR4?=
 =?utf-8?B?YkhNcG96M1l0cXAxRGE5aWMyYTBoNWpHOUFDcWNoMVVQZk9zWW9YTU1XT042?=
 =?utf-8?B?RVI3SHFhbGhvUzJWbnR1NTZXdFFZQzZoOTFNQU1EWnFNaytDbW5JMjlNdkQz?=
 =?utf-8?B?U0VBWmp6WFhsaHNSWjhkUkNtTjJwakJ1MWxvdVpXVDY0SFVpVWVvSkY4aE9y?=
 =?utf-8?B?WnlKbVU5R1g5d2JnZkZLWGJQUmdJOHBONk9ZcjVvMEk4amdlU0IvVXZCcE04?=
 =?utf-8?B?WUczaTk5cVpMREQ3NnplaWllcGR4K2pPa0VwQnFQNFY4czNUaVJZSjNUNExU?=
 =?utf-8?B?dHRvSktIWnJFZDNKdEJjdkpzdjVXL1NNdDNnQ0xKSk1ZME5leFB4azMxcFpZ?=
 =?utf-8?B?cDV1UXFuNkE1K1IyeUI1K1dkK2VFUDVBYWxPVUQzNlVlanptZlBVSm83ZExu?=
 =?utf-8?B?WGhiRVYvNWs2ZVM3UlpBczNKR2x4Q0l6SjJVcThPS2hwWnI3d09BT0o5N1c3?=
 =?utf-8?B?bVBuVytOd04xMjZxRXBaZTRjVXR1VCtoOHNWMGVUblYvOU9BOWRuWFBia0RN?=
 =?utf-8?B?VHhiUVlPbk1BYzVIVDc3OGNoMnR0eHdHWlR3cEZuUmRQSG5oQ29YU0p4RnFz?=
 =?utf-8?B?Ny9aZEV5QmhxUUlLaVRDdzg4R2hKU2VnWTJZTG9PaDg4WnIwNTdaRnducm5V?=
 =?utf-8?B?L2FSeG1Yd092dnovdFNDcS9TTEpOak93cUI0alRSekZqcGpKU2x0RDI4OEdX?=
 =?utf-8?B?YXV3RHBoL3VTdDVyejBxZVUyOERGWjIyVnVkaWdhV1NTZjRyZ0dDa2lPY0N4?=
 =?utf-8?B?Y0JxQzNURUo0QkxTT1dpWjI5RTJqMHNtNGw3NHE0NS9CVGZ6aTJxYmtIQXBi?=
 =?utf-8?B?alN4cW1JemE0VGNSYm4rMnU1enJoNWExcFl4b2xZdVllMEZiRDFzai9UZjhH?=
 =?utf-8?B?c0IyY2ZBUWsvakgzRGVnYmJUS0x5RWJQWXBlK3EwWnYvMW1jUDcwSFBrdWdw?=
 =?utf-8?B?Wks4TzhQUE5iRzE3eHlmODlGM2RUUFZlSHVMTmtSbisveEtUQ3RHdktXUXpk?=
 =?utf-8?B?aDUrUGVxYUJ0T3h5OUtUMEFiTml0aVpHOEduSFh3MExMTDhwdGV3V3JCWGQ1?=
 =?utf-8?B?Q3Jyc2F3VVZqQ3VKdEFEZU1qODZkNXBBVWFMbmhTRVRDWVk2Uk9IdWM3UDFl?=
 =?utf-8?B?RHJ0b0tuQy9KOGx1QkxqbG1yTWt2eGwvM2pOY3RXWnFGUGc1RlQ0UDh2eHhn?=
 =?utf-8?B?KzRNdVMyckM0NlNEaVVoNWt4a2ZlTU9FVTZrRjI3SDN0MVBIR3k4amQxUWg5?=
 =?utf-8?B?Vi9XbEJHU01xUXJQRXp0YlY1VHIrTG1YQjBLdWN6WUpSd2xwaE5HcTQrNHpj?=
 =?utf-8?B?M29YL1lsOWI3ejNGazVYa25lcDhxM2VSN2F2TFNBaDZiSTBKbmpNejVMTFV3?=
 =?utf-8?B?dWlCVEx2ajJvLzNBeUI1c0NmbUp4TTVuSHJYVU9mR05OVnVqSEdwOGliUXA0?=
 =?utf-8?B?VVBrVWxjTlpxdVkzN3JsRElBMC9yVkhmTzZOaGZ6eHFzZTNBdTNtYVBKSm82?=
 =?utf-8?B?MGMvRlUyZjZ4aVkvWFB5djFBUlhUeUdJYXFQazl4YmhHelJBSlY3NHVCN0x1?=
 =?utf-8?B?ZnFvVUFiak1kK2IxbWV0d0VDb3A0RXQ1NVF0Y2s1T3U1NzZMUytJLzg2QlNL?=
 =?utf-8?B?NkdKRHZGcEFjNjNtWlZDMzUzajhHUkU5ZEVxUTVTS2dKMENwN3dCMkpscEho?=
 =?utf-8?B?Q0RvZjZyTHhOTnY4bGxBUjgxcVhSZ3FZVWtQUEViSCtkblRUODZodz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a9e7e55-3f9c-49a8-3241-08da39f7e6b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2022 00:30:11.6348
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mpr4QQXJnuo+iAovUa28pmy/M6ca7v8USSllGs/HixItRyjSyTJmIP+rO99zvtbd5CmobDS710blWoJENWxQFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4019
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5
LCBNYXkgMTksIDIwMjIgODoyMCBQTQ0KPiANCj4gT24gMjIuMDQuMjAyMiAxMTo1OCwgSmFuIEJl
dWxpY2ggd3JvdGU6DQo+ID4gRVBUIGlzIG9mIG5vIGludGVyZXN0IHdoZW4gIUhWTS4gV2hpbGUg
SSdtIG9ic2VydmluZyBnY2MxMSB0byBmdWxseQ0KPiA+IGVsaW1pbmF0ZSB0aGUgZnVuY3Rpb24s
IG9sZGVyIGdjYydzIERDRSBsb29rcyB0byBub3QgYmUgYXMgZ29vZC4gQWlkIHRoZQ0KPiA+IGNv
bXBpbGVyIGluIGVsaW1pbmF0aW5nIHRoZSBhY2Nlc3NlcyBvZiBvcHRfaGFwX3sybWIsMWdifSwg
d2hpY2gNCj4gPiBvdGhlcndpc2UgY2F1c2UgdW5kZWZpbmVkIHN5bWJvbCBlcnJvcnMgd2hlbiBs
aW5raW5nLg0KPiA+DQo+ID4gV2hpbGUgdGhlcmUgYWRqdXN0IHR5cGVzLg0KPiA+DQo+ID4gRml4
ZXM6IGM0Nzk0MTU2MTBmMCAoIng4Ni9QMk06IHAybS5jIGlzIEhWTS1vbmx5IikNCj4gPiBSZXBv
cnRlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IA0KPiBJIGd1
ZXNzIEknbGwgcHV0IHRoaXMgaW4gKGFzIGJlaW5nIHNpbXBsZSBlbm91Z2gpIGlmIEkgZG9uJ3Qg
aGVhcg0KPiBhbnl0aGluZyBiYWNrIGJ5IHRoZSBlbmQgb2YgdGhlIHdlZWsuDQoNClJldmlld2Vk
LWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCg0KPiANCj4gSmFuDQo+IA0K
PiA+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQo+ID4gKysrIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMNCj4gPiBAQCAtMjE1NSwxNCArMjE1
NSwxNyBAQCBzdGF0aWMgaW50IGNmX2NoZWNrIGludGVsX2lvbW11X2xvb2t1cF9wDQo+ID4gICAg
ICByZXR1cm4gMDsNCj4gPiAgfQ0KPiA+DQo+ID4gLXN0YXRpYyBpbnQgX19pbml0IHZ0ZF9lcHRf
cGFnZV9jb21wYXRpYmxlKHN0cnVjdCB2dGRfaW9tbXUgKmlvbW11KQ0KPiA+ICtzdGF0aWMgYm9v
bCBfX2luaXQgdnRkX2VwdF9wYWdlX2NvbXBhdGlibGUoY29uc3Qgc3RydWN0IHZ0ZF9pb21tdQ0K
PiAqaW9tbXUpDQo+ID4gIHsNCj4gPiAtICAgIHU2NCBlcHRfY2FwLCB2dGRfY2FwID0gaW9tbXUt
PmNhcDsNCj4gPiArICAgIHVpbnQ2NF90IGVwdF9jYXAsIHZ0ZF9jYXAgPSBpb21tdS0+Y2FwOw0K
PiA+ICsNCj4gPiArICAgIGlmICggIUlTX0VOQUJMRUQoQ09ORklHX0hWTSkgKQ0KPiA+ICsgICAg
ICAgIHJldHVybiBmYWxzZTsNCj4gPg0KPiA+ICAgICAgLyogRVBUIGlzIG5vdCBpbml0aWFsaXNl
ZCB5ZXQsIHNvIHdlIG11c3QgY2hlY2sgdGhlIGNhcGFiaWxpdHkgaW4NCj4gPiAgICAgICAqIHRo
ZSBNU1IgZXhwbGljaXRseSByYXRoZXIgdGhhbiB1c2UgY3B1X2hhc192bXhfZXB0XyooKSAqLw0K
PiA+ICAgICAgaWYgKCByZG1zcl9zYWZlKE1TUl9JQTMyX1ZNWF9FUFRfVlBJRF9DQVAsIGVwdF9j
YXApICE9IDAgKQ0KPiA+IC0gICAgICAgIHJldHVybiAwOw0KPiA+ICsgICAgICAgIHJldHVybiBm
YWxzZTsNCj4gPg0KPiA+ICAgICAgcmV0dXJuIChlcHRfaGFzXzJtYihlcHRfY2FwKSAmJiBvcHRf
aGFwXzJtYikgPD0NCj4gY2FwX3Nwc18ybWIodnRkX2NhcCkgJiYNCj4gPiAgICAgICAgICAgICAo
ZXB0X2hhc18xZ2IoZXB0X2NhcCkgJiYgb3B0X2hhcF8xZ2IpIDw9IGNhcF9zcHNfMWdiKHZ0ZF9j
YXApOw0KPiA+DQo+ID4NCg0K

