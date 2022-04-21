Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3654850A720
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 19:30:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310380.527197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhach-0003k4-UM; Thu, 21 Apr 2022 17:29:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310380.527197; Thu, 21 Apr 2022 17:29:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhach-0003hh-RD; Thu, 21 Apr 2022 17:29:43 +0000
Received: by outflank-mailman (input) for mailman id 310380;
 Thu, 21 Apr 2022 17:29:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O5Hx=U7=citrix.com=prvs=10361b9f4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nhacf-0003hb-T7
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 17:29:42 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9eea2f8a-c198-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 19:29:40 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 13:29:37 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB4988.namprd03.prod.outlook.com (2603:10b6:5:1e2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 17:29:35 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 17:29:35 +0000
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
X-Inumbo-ID: 9eea2f8a-c198-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650562180;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=1gQFfY2t396L6hNff6hEfdCdFQEnDCW6uEEb70wyU/s=;
  b=H1TjW6r9EtITo0LFCUY3xeBca9ee4SIo3UdyB4N2Ipuo06DmMKqPxSTe
   2LPKdJJsCTX6LUbCuihF596Yw65IEDAuIELpWrx4l4YOOleYTjD3yFhdS
   BOTx6+W8UjJ0xXq0Ulb53AwoTH7yK08aY70tJpoYZ11MgCwFU88HONuOZ
   c=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 69038089
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:whxG/KvoZdtlTDWLAGr+uNErYOfnVENfMUV32f8akzHdYApBsoF/q
 tZmKW+Db66JNmX8fd8nb4i/pBkDusKGx9RhQQU9/ipgESoa+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1/X4
 IuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8NPo30pLsxVCB4TT16IZF96bTWJ0Ow5Jn7I03uKxMAwt1IJWRvZMgy3LYyBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4IImm5u1qiiHt6HD
 yYdQRNpYA7NfFtkPVAPBYhltOypmmP+Y3tTr1f9Sa8fvTmLl1wpgOmF3Nz9YOShY+4Ewkahg
 kn072SiEEoEBt+f4G/Qmp6rrqqV9c/hY6oQHrCl8v9hgHWI23ceThYRUDOTq/6zgF/4VslfL
 0ER8ywGoq079UjtRd74NzWnpFaUsxhaXMBfe8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBONB0mLicSHbY/LHEqzq3YHERNTVbO39CShYZ6d7+po11lgjIUttoDK+yiJvyBC30x
 DeJ6iM5gt3/kPI26klyxnif6xrEm3QDZlddCtn/No590j5EWQ==
IronPort-HdrOrdr: A9a23:uT3N76u5ucWHM8yZLan1MHqh7skCL4Aji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKceeEqTPuftXrdyRGVxeZZnMTfKlzbamDDH4tmuZ
 uIHJIOb+EYYWIasS++2njBLz9C+qjIzEnLv5a5854Fd2gDBM9dBkVCe3+m+yZNNWt77O8CZf
 6hD7181l+dkBosDviTNz0gZazuttfLnJXpbVotHBg88jSDijuu9frTDwWY9g12aUIO/Z4StU
 z+1yDp7KSqtP+2jjXG0XXI0phQkNz9jvNeGc23jNQPIDmEsHfqWG0hYczBgNkGmpDq1L8Yqq
 iKn/7mBbU015rlRBDxnfIq4Xi47N9h0Q679bbSuwqfnSWwfkNHNyMGv/MZTvKR0TtfgDk3up
 g7oF6xpt5ZCwjNkz/64MWNXxZ2llCsqX5niuILiWdDOLFuIIO5gLZvin+9Kq1wVR4SKbpXYt
 VGHYXZ/rJbYFmaZ3fWsi1mx8GtRG06GlODTlIZssKY3jBKlDQhpnFojvA3jzMF7tYwWpNE7+
 PLPuBhk6xPVNYfaeZ4CP0aScW6B2TRSVbHMX6UI17gCKYbUki94KLf8fEw/qWnaZYIxJw9lN
 DIV05Zr3c7fwb0BciHzPRwg2fwqaWGLEDQI+1lluhEU+fHNcvW2AW4OSMTutrlpekDCcvGXP
 v2MI5KApbYXB7TJbo=
X-IronPort-AV: E=Sophos;i="5.90,279,1643691600"; 
   d="scan'208";a="69038089"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJ2m3wH1UPdYKexo5r9+C9Gtxyr1hQysMbcWFtGFQLegbj1RsAwt2q81/AXfbM5B0WJ0bezhNESd6/h+g8LY8HnX1G1ZGTXUlwoPyAMXoKvLGVISB7kiUnldhI6HsKOes+msKjdDjITfNvvhWl4BACvIXH95S3OFimy73pgxoQx3TnUVAtB0s0MoOXCQecGWWl7iwKvihURsqubrDQZhQT+pQVaLupwu22wz+AAMfKKMSDDzsVGUwqqjbcg/DPpac9zOAvOOzJUV1bFs/ywQlwXQahHfDAQrUhDS1HRys1piZbPJycsbPhm8Jdt2T5yk/Cn+8Is9sJ8HBJCC5kK2Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1gQFfY2t396L6hNff6hEfdCdFQEnDCW6uEEb70wyU/s=;
 b=TB2Eb6E4hgPBb6DRAqdOjOnuvj/ZqYySGIPbOHoOHg/YGwNMoHoYfGtsHGIiyDfFniKcGHAjN4YYUva5SLXczs5zFoRA3J0QBc9hlW6C3ztMKL5RvW10vMl779u08k66bHhHJuT+z1vSMrbwTiRRq4Gi90HlB2JUB1l+p6AXreHSemCAsEccUixZatYU5JlT46SHnLmk/SnijXfxvJlV0F5beuFYlVQZOAGJL4sM3gcTP/N4LTsdahHg5Qblyd9l0He4yOfZ57zOUClAAGdsdQPkfj3U4W+YOk6NR9GTx89U2yD1nx28o9IeOL76VdXxJt9So3MVPpt5GLq3uQVuXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gQFfY2t396L6hNff6hEfdCdFQEnDCW6uEEb70wyU/s=;
 b=UZTedu8yTf+3yGHqcfZO6JfcNMBaOZ2aWcQrMavcwUbwwo84yN32wNbR+ze4p4pJVeJZnvh+HzTPnYMa+VMkqQywmmhdlqSsdWToVktanPbqUPGb+XZ+5gpOAxSCZikG2U8+H6blaTtGi4gEHX0FvQ6xmpI6NkuGZD4xvR3db9E=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bobby Eshleman <bobby.eshleman@gmail.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 2/6] x86/gdbsx: Rename debug.c to gdbsx.c
Thread-Topic: [PATCH v5 2/6] x86/gdbsx: Rename debug.c to gdbsx.c
Thread-Index: AQHYVMDYNMJuqSTXg0Gj9wXP4qElXaz6V7UAgABJhoA=
Date: Thu, 21 Apr 2022 17:29:35 +0000
Message-ID: <c7feeb73-78fb-136e-2dac-4a3f87e0ae93@citrix.com>
References: <20220420141307.24153-1-andrew.cooper3@citrix.com>
 <20220420141307.24153-3-andrew.cooper3@citrix.com>
 <bb1961c1-af89-0220-6328-aa8cb98a1d84@suse.com>
In-Reply-To: <bb1961c1-af89-0220-6328-aa8cb98a1d84@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cd37b02-554e-4e6b-793a-08da23bc814f
x-ms-traffictypediagnostic: DM6PR03MB4988:EE_
x-microsoft-antispam-prvs:
 <DM6PR03MB4988E578571A51F52C4C660DBAF49@DM6PR03MB4988.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 zL37tbrHkpmN+eMV1cPElsYQ3NDvx0bkiwX0J3l7lDGGN+hflSBSMvp4ibc3fXNom1DCCsKw+XxeT70Z7AuXzGlFYhOj5Qillc2re65zXPChamyizaMS0GOzOZKbZlKyV8m+JnXblvbDBxElnntxC4YlJteP0Lb8nqLu+cjkrsyCKKlhJ6OE7EtHsnWpykKPpXxVq17ZnmxUXNAg7kcu65SiRi/9PF+rJNsS1eiFTVaZAvf6ymnKdlzFbLSqVdu90ph7VXYOENRgs807Cm62A5LXuljBHpKDLc/hwq/g0lR7MC8zw8dTGg/s7sy7QAx/c/SZAdWZ9n/QRxK14c5j1N/+wTqziSwJPdbgbDKuvhEfHLLbvx0rL7i9TtDfifwtD6wgrF1lQWG440acaOfi+hLVU7y1E7xiQqEP9BquekgWOdyAWIdaBq5oeSVtcSAYGXRFj+BtkGES5nFaAxMox118I2+IKHq6VseePTvPvWNfzRhCANXAbYzAc8EWvgCLVZznZdmtZhgM09ImGkc/biHo0Lf4tSXeLvhxIPQOAropFXD0Po4Iik/pgWEvqFnY7/9lB58y0njaYiLaq4lkagcSkA/RiI4IT/Tzv2QiBUX6egMtS8RLSmzbiuDSXSeZWfZtH1t/9POq37BdRlpC37OVBZfMVV1m8ZRwzv4A8lv3Zc7foR3U7fmZh2T8Nc/G5u5IsdiFYRodfJx7+riMobNz+BVNyyW+oUgajCuU9yfM+fmgSTKiTVncop/S7/9eLEe0bN1BzZm4zVyUaLfbevMUrt3kT76xEKPeBFYs8LbVFAjafUzyjDPRk7IM1YIabbpMO+A9W/hhqiGdBQfAUB+PJLZsROUJsPzE4IpATWU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(508600001)(6486002)(6916009)(54906003)(6512007)(71200400001)(6506007)(2616005)(53546011)(66946007)(36756003)(316002)(966005)(91956017)(86362001)(186003)(76116006)(31686004)(64756008)(8936002)(8676002)(5660300002)(82960400001)(122000001)(2906002)(66476007)(38070700005)(4326008)(66446008)(66556008)(38100700002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MWJxNUVLZmZ6UTNzU2JUdC80UkNuVm9rUm9YekN6TEd6Ym9pNmVBVnZ3YzJK?=
 =?utf-8?B?Y0JmQXVFbWhpZ21GMyt0TUhlWVFIUlhYYWVpeXpTODY2TDd2UU9NUmFZZ2Yx?=
 =?utf-8?B?dncwSTA1SUhLK2dZdlRtTy9WdEQ4aUhRWUFLTDBvTVFjeGhUZ2FNUkJLSjA3?=
 =?utf-8?B?bzBPSWdUOVRlOWVnNVBpRkJ6aysvbWlqZDBOWktOTnFLZUQvRUlBUHB4YmxR?=
 =?utf-8?B?WkxsdW40QklNN2NNeDlpTEsycUZXOGFTQ0x4L0dncnVMUGE3czk0am5PK3NG?=
 =?utf-8?B?K1JmcFpNRXJMSTAweE9rSXJ4UWpYSk8vNGEyRVN2RGVnMWVPZVcwUHlnMHdu?=
 =?utf-8?B?WkNYRVRHdWxPYUF0SElnRDZDanN6YWpYRUk0WWFMdy9RNTF4bE8wSG42Ymd6?=
 =?utf-8?B?OVJZaFd2QUdtODJCRzlBTjFRVmM3MmlYaDRML2tPZHJxazhqT2JUVWtuQjlL?=
 =?utf-8?B?UnB2MldXZGFNaW0rVFlZdzlHTCsyclVRSzNTWm9sR0t4NCswVVI4SzNlRWlM?=
 =?utf-8?B?anFVWEtFaHRMTEJ4L2l2M2VsRFF4UXpvbGdodEpkZVYwNExIYnF1Ym4vL2pX?=
 =?utf-8?B?SGl1dVZVc1YzYkpKZ0pUZ0tJQ2dmdlNFRzd2Z25iYzhFTlBuRkpjNGtSTktM?=
 =?utf-8?B?OUJ4ZVBRRXg5ZmE4NVdjc0FJQ3FJRFdhSGJ5S05tV1AvVm45YkRjMnh1RkU2?=
 =?utf-8?B?Z09XVEt1blUzUnpnc1hHclV2NWtQLzh0bmFkbzlyVEEvcmhlaDRaS3A5OXpv?=
 =?utf-8?B?cWI1WUk4Mi9ONU9oS3IvZXIxZEN4MnFrWlJmQzNMRzk1Qzg2ZUVrRU1uRzBr?=
 =?utf-8?B?akRqYjlvQ1FScWVDRWdIRUpKVHljSEpmV2JGQ1R2Z2NZNnZkYi9VenlaYkdV?=
 =?utf-8?B?UkIvbmNibGhxaHZjd0xmRndJT2tYVDhmMW9sNWhndHpxN1BZZUFqV290dEtz?=
 =?utf-8?B?dU9wT2czUXJxZURVZkQxRlVVMTdmRjR0K0pOSUtjb3NtcHRLMVh5UjZYTWx0?=
 =?utf-8?B?YXc5aEJmN0pwZFE2MnNwRlJpWGZlRGg3OUU2RUtvTndKWkYyelVrcTFWRDF3?=
 =?utf-8?B?bHd4UTZMcDB0cmR6bmhPdDlWOCs2eDIrMTZhSnpyNDJmMWpNWUMrNDcxdkxK?=
 =?utf-8?B?K1NpZ2lMaGM0LzJubm5RQzhzeTBGUVlsZWhWTnR2UEZnUGtCWFNBMnFnV1ll?=
 =?utf-8?B?cFpwSTgrU0o3QkQwSFlsU0p5eUx5YnNVdHRKZTFodS9iRzJqcVRFS2RMZmln?=
 =?utf-8?B?TTlSUVJCNFZkSUlqSU5WMjFnY1JXc2FIYks1Y05iTmt5Ry9Ld3RiM0k0Rm94?=
 =?utf-8?B?MWNjbDBxd0t0YkxncWpGSFBPQXlXSXFjT1F0MHZyZlM1Yll4NTUvY1JQM1BV?=
 =?utf-8?B?QkhOV3N0bVpkTFRpSnJ4V0U3QStFODdjSkNFdmxESUZLWmpxd2xUa2NlbGlF?=
 =?utf-8?B?dHJ3Q0tyVEJudU13Um5BYksvcDd2bk5vQlRNaEhBNEdhRXZQVHZYSkg5L2h3?=
 =?utf-8?B?UHQvVVZqL01MbzRJckp6eitkdVhHMTlDbXdLOEQzSjFvWDl2cDJwWmNuL2pL?=
 =?utf-8?B?Tk9hcFFoc2d5UGxja25GazlQcm5hL3RxOTBMUUY4WGFreGdiR0ZlaGZ1SGhw?=
 =?utf-8?B?ZFhVcUxTTWxnZFFKWGRSRFA1THRiOEJKYWNraDB4YktMMzh0R1Fob0pKMGln?=
 =?utf-8?B?SVRiVGdMSlNPWC9lcW5HVzZjQm1TVTZ6aFFJQTZwTERydUpjOTNVRmFoeTRY?=
 =?utf-8?B?RXppTHUrMHVqbnBFdGdrMEFCTjZQR1RnL3N6SWI0VUw5ZTB3Zm5uY2dPZWg2?=
 =?utf-8?B?U1RSNkxHUkFuMjR4dmI5Uy9MeWlhM1NKR2VleDhWRUlDVzBUVkkxZWNINlMv?=
 =?utf-8?B?S1BrY1o1R1RBSjFrbTZZcnV3UHRGV21laWpUNTNUM2FrYVpIdjB2cU9mMExk?=
 =?utf-8?B?aG11UW1uTUUrT0gybDVMZzBTb29LL0pYWklKWGc3SC96QVV5ZE5NNkU1d1RJ?=
 =?utf-8?B?ZUNSbGtRM1RKTjA5WEx1ZTQxTlhXTDQ2eVZCaDlYdmxxcXEvZFFwWkRHYmRz?=
 =?utf-8?B?bkpuYVVOSGZZRy9Xc242a1ZwVlhGN0VOVmJnSjc0bGx6UWlIT3ZvVXAxNGxK?=
 =?utf-8?B?MlRjZk5KRDBGK0RqYXBmZFNyTE1LYU9yVUNMSU1kazV0V0dnQnRHdTB3SExC?=
 =?utf-8?B?UW14WUJlOGVnZGswbW9vTVRqcXZDOHhueDd2b20zYVhKU3lUV01wVStpZzJP?=
 =?utf-8?B?NE5KM2VSdlhRaDF0bXdBMmNFWHU1am1nSzF5eG12YzVuc29Ca1dtckFiT3hy?=
 =?utf-8?B?bnJYZXp6WFBFV1dCZFhmaDVqYWhDOFVEMm96a1F0N2hYYTNNV0QwUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8AEE7DB5C0B3F54B98750BDBE31652F5@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd37b02-554e-4e6b-793a-08da23bc814f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 17:29:35.6170
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dp8b+uOFWY9xTQKl+F1sClOabquVRRydWr2lzL7NvIJkNEcbHt3ArXrtNzmky/1vTL5v4jOZ4pE66xMv+ky+Kci0Iz1VUGbLVDmqVvw/UtE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4988

T24gMjEvMDQvMjAyMiAxNDowNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIwLjA0LjIwMjIg
MTY6MTMsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBGcm9tOiBCb2JieSBFc2hsZW1hbiA8Ym9i
YnkuZXNobGVtYW5AZ21haWwuY29tPg0KPj4NCj4+IGRlYnVnLmMgY29udGFpbnMgb25seSBkYmdf
cndfbWVtKCkuICBSZW5hbWUgaXQgdG8gZ2Ric3guYy4NCj4+DQo+PiBNb3ZlIGdkYnN4X2d1ZXN0
X21lbV9pbygpLCBhbmQgdGhlIHByaW9yIHNldHVwIG9mIGlvcC0+cmVtYWluLCBmcm9tIGRvbWN0
bC5jDQo+PiB0byBnZGJzeC5jLCBtZXJnaW5nIGl0IHdpdGggZGJnX3J3X21lbSgpLg0KPj4NCj4+
IFNpZ25lZC1vZmYtYnk6IEJvYmJ5IEVzaGxlbWFuIDxib2JieS5lc2hsZW1hbkBnbWFpbC5jb20+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPg0KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpU
aGFua3MuDQoNCj4NCj4+IFRoZSBzZW1hbnRpY3MgYXJlIHJhdGhlciBicm9rZW4uICBYRU5fRE9N
Q1RMX2dkYnN4X2d1ZXN0bWVtaW8gb25seSBzZXRzDQo+PiBjb3B5YmFjayB3aGVuIHRoZXJlJ3Mg
bm90aGluZyB0byBjb3B5IGJhY2ssIGFuZCBza2lwcyBjb3B5aW5nIGJhY2sgaW4gdGhlDQo+PiAt
RUZBVUxUIGNhc2Ugd2hlbiB0aGUgaW9wLT5yZW1haW4gZmllbGQgaXMgcmVsZXZhbnQuICBGdXJ0
aGVybW9yZSwgaXQgY2FuIGJlDQo+PiBhc2tlZCB0byBtb3ZlIHVwIHRvIDRHQiBpbiBvbmUgZ28s
IHdpdGggbm8gY29udGludWFiaWxpdHkgd2hhdHNvZXZlci4NCj4gVGhlIGxhc3QgcG9pbnQgcGVy
aGFwcyBpc24ndCBvdmVybHkgbXVjaCBvZiBhIHByb2JsZW0gZm9yIHRoaXMgc3BlY2lmaWMNCj4g
b3BlcmF0aW9uLg0KDQpJdCdzIGFsc28gbm90IHRlcnJpYmx5IGhhcmQgdG8gZml4LCBidXQgSSBy
ZWFsbHkgZG9uJ3QgaGF2ZSB0aW1lIHRvIGdldA0KYm9nZ2VkIGRvd24gaW4gIm1ha2UgdGhlIGdk
YnN4IGh5cGVyY2FsbHMgc2FuZSIuwqANClhFTl9ET01DVExfZ2Ric3hfZG9tc3RhdHVzIGlzIGEg
ZGlzYXN0ZXIsIGFuZCB0aGVyZSBhcmUgZmFyIGJldHRlciB3YXlzDQpvZiBkb2luZyB0aGlzLsKg
IGh0dHBzOi8vd3d3LnlvdXR1YmUuY29tL3dhdGNoP3Y9b3NaZWlvWUtzeEEgaXMgb25lIHdoaWNo
DQp3YXMgcHJlc2VudGVkIGF0IFhlblN1bW1pdCBpbiAyMDE5Lg0KDQp+QW5kcmV3DQo=

