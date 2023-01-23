Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5643678745
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 21:10:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483194.749197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK38I-0007jq-BE; Mon, 23 Jan 2023 20:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483194.749197; Mon, 23 Jan 2023 20:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK38I-0007gX-7Y; Mon, 23 Jan 2023 20:09:34 +0000
Received: by outflank-mailman (input) for mailman id 483194;
 Mon, 23 Jan 2023 20:09:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HTo8=5U=citrix.com=prvs=380e0b34c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pK38G-0007gR-Ld
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 20:09:32 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6efda1b-9b59-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 21:09:29 +0100 (CET)
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jan 2023 15:09:15 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB6115.namprd03.prod.outlook.com (2603:10b6:610:ba::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 20:09:12 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 20:09:12 +0000
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
X-Inumbo-ID: d6efda1b-9b59-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674504569;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=IMeUOonufG0fr/sflWmj3Tq5wJA/R6PntS6lJh0IYHI=;
  b=VbSRsjZrKya2D+8D0jQuQMLn6NrHieQf3vAmJqdWoHmoBidCQiAlFN7+
   qSv8/Vn4oqPNo7mkct1u9gVzedpYixmHhPrjZL2c8iyyi/C5xGU/oR5IM
   1mVlg+8mtXA+NTkZuSC7XME48FjEcMipH++pggUwRoMsV4PT6aGNYMs12
   Q=;
X-IronPort-RemoteIP: 104.47.66.40
X-IronPort-MID: 93330975
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HVDjyq7TWUW+uW33fuXcQwxRtKHGchMFZxGqfqrLsTDasY5as4F+v
 mpNWWiPaP/YZmWnKt51O4/lpBsGsJfVzt9iGQA6/HhgHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPakR5weE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m+
 KUYAg0dREi5ucGY8a20dLRtmp0oI5y+VG8fkikIITDxK98DGMqGZpqQoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6NkkotiNABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCdlJT+XpqaMCbFu7xjVPCQUaCHeAjdLjtkuXRIkEB
 Use9X97xUQ13AnxJjXnZDW/pHOHpR8dHdlNCeox6AKK4qXR6gedQGMDS1ZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAONnMLbyIASQoD4vHgrZs1gxaJScxseIa6j9TzHSz7y
 hiQrTY5nLQVhogA0KDT1VrAiTi9q4PJSgMw7wP/UWes7wc/b4mgD6Sh7VnA8f9BNsCXVFCHt
 3kfs9eS56YFCpTlvCeKRuMKHr2g+feeGDLZiF9rWZIm8lyQF2WLeIlR5HR7Ox1vO8NdIzvxO
 heP4UVW+YNZO2asYelveYWtBs82zK/mU9P4SvTTadkIaZ90HOOawBxTiYer9ziFuCARfWsXa
 P93re7E4a4mNJla
IronPort-HdrOrdr: A9a23:bjOue6uh5EzvomGYQAuo/vgB7skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-IronPort-AV: E=Sophos;i="5.97,240,1669093200"; 
   d="scan'208";a="93330975"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RsmFmCnJFvilSpr7gFM95EFQe17nfM3l0QAVw22Jj0IOclXeCTjk4Kpde+zCz4ge3sfUCBFRhoSrzEXA9uzw5HOO+B3LvE0SAHt918AAMYuZuBscpY8Ns5Y26aivg5QerrMPPbR3shyUXs+0wkgd5RzmhJ9UXxL3z+teLaYval91SBgi8EjrPwTY1NiEOyDFPy3TMxy/WsMZ0tJGltONtO764/8Rw1m5WjJ0nEoALHVskjiSbSBIzLRaDEYyVZYXhe1+qbw4SaFJ+YWAhx+ZBR6uFtwdT2CuX6YsWUe/TCctf/pPbzkAFxvuVBdztul8U2YU9QpBfU/UzCgZOETmjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMeUOonufG0fr/sflWmj3Tq5wJA/R6PntS6lJh0IYHI=;
 b=RVGGRVzhUbB5y6rqyBy/OmwoMbN3FXeyRFaNGCtDBDDqFnmi6NlghNGj63WH6BZ6c6EBZbEpMCgq2n9dawA4N0tiMZERpNvm57B0wI34l347JQEPXs+9SyYDASjdBabf4+QX/AS0vMANso7L2th9Dbrwb3snUAOzvQiv1tMNgkZcolTTh2XKrITN0ECF7kS0csLfP8A/xr3NSsCSv1O9cGChZkBTNKLNJASgY+3HSQLUQ4aBWT1FVuobKH933apsvl29zvGrFzFRS3u7UTLh8Y/8hjahOrv7/Ba7aIcUEPzSKUT5qic9RllCPAfKochDc/MPq4T2svPodqNTwebftA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMeUOonufG0fr/sflWmj3Tq5wJA/R6PntS6lJh0IYHI=;
 b=kWADXomgu474RiOnl2WovZCrzCpQeE5/SX8kS3s3UxDTVa7Km43QmFKXAnTS2NOivwAinAtrP2pU1Rxzs4KE7yNwmdY024F0ZTjbxzAkT5LieMrMGJ+A5VH72dcAcoPp3FZKPbUD00yBZTRQmeA/mZJfqUPf7Ji905R1/wHV+8s=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Oleksii <oleksii.kurochko@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	<gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
 Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v1 07/14] xen/riscv: introduce exception handlers
 implementation
Thread-Topic: [PATCH v1 07/14] xen/riscv: introduce exception handlers
 implementation
Thread-Index: AQHZLOAVkIPSVA/PBEeRaJXa6cnAQq6r6ACAgAA54ACAAFF9gA==
Date: Mon, 23 Jan 2023 20:09:12 +0000
Message-ID: <29b9b149-d3b3-922b-c17f-d86b7f949fca@citrix.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
 <7a459ea843d5823ee2c50b0e44dded5bdb554ca6.1674226563.git.oleksii.kurochko@gmail.com>
 <ac6f02e8-c493-7914-f3c4-32b4ebe1bc26@citrix.com>
 <ea3c256c0f5a7f09a2504c548e649a0cf0edcb43.camel@gmail.com>
In-Reply-To: <ea3c256c0f5a7f09a2504c548e649a0cf0edcb43.camel@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CH0PR03MB6115:EE_
x-ms-office365-filtering-correlation-id: b82f8fff-52a1-4d91-20f7-08dafd7db1da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 shFRAr9QZbH6ya9Kg9l6SBh40fVGiLxUnUS2XxY7Kp8KQ0PzwZkHcj9UoDwP3yG/z54pBiOZtDSAiYxDCb8+SuFi4XXHPWzxU9Ne2M4QsxGpzZ/1lny9X5Gr7SIKRLQQKcgAqaWfTPqU25uiMhvGmPPfg1YEM3ynJgIMVhtFCXnh41uCvjiUpYZS/uKgJYwyCI4MvYkFha28fEGU1L0jH9IyS2Z1miwXm9oJBjPRLvLHqGQCFZd8QJynLJ0dZTMGB2clsWSJhr5ECBqR1kBPjr+eoL/OIm5Co34ifFsKnn7JQ37JrkzsVAAxWzrvOLn9ffZErD3a4GJLj26GgBK/58XaABjtcqeo5pPLkvObyWErA2LYPwEx7/gCE0xFE6nxz/1k6f+aDJNoOcaYxazq0g53lb7Um/0gYNKJ90kyjT2JpXdyfZzFIFPJQLFtg8OY85z+xd4JfWVBZGiHeaCHaf+tL4UFbftTiwyvA4cJDrjpm6OPSEZHPPg/LBsubtzwYiFgl3N9E8PM8r8nzTLKVBHPTH1rMcHwP+xkymql1R0rUxsbMZrEsHqNHYlbB9hLH1ylSjD/wino6bnGMUzYeqR/whSX5SjTwctkG2jIUy+/pP9zrlLK3R4MoQUAziOvuXHbCXJg2MvboaXV8Od8UipGos2nkIHJ2ea8d1sYXOldaXtU+2557P1mf/NsRDNwoW81rN3zPhaC/5WY+WwWfVm7VW9dB2D1WM6j45pbFySjZw6q3DtXlqj0XVy5gVnzdkl+Ur4GD6R3mDOrR8bQnw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(451199015)(82960400001)(38070700005)(36756003)(86362001)(31696002)(316002)(110136005)(54906003)(91956017)(4326008)(8676002)(66556008)(66946007)(76116006)(66446008)(64756008)(66476007)(53546011)(6512007)(26005)(186003)(478600001)(6506007)(31686004)(71200400001)(2616005)(6486002)(2906002)(38100700002)(122000001)(8936002)(5660300002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OEVFV3FsSk40N3RTeHlsRFdhQkE5Mm9UTEZZSXQxWnBuajJrNnk2aFFnbmdN?=
 =?utf-8?B?SDJzR05mMnc1bVVBejRCdTYydlJPRnI1NEM3dE1KRFVrV0dKandkTy9oaHlu?=
 =?utf-8?B?MVkvZi9KbmdHMG1XRWRlQ2VOTFJicXJDb3BxM2lrWGkwYVhpM1FuOFdhakcw?=
 =?utf-8?B?Qm5CNjJHcDBhUWR1Z0x0aTBDOWxXaWR6Z1J2cW1hQXcwV3EzWjArTFlTcTgy?=
 =?utf-8?B?M3p0TzFwTUw5aFV1V09kR0RVenZuZmUyY3lQeFl4OWtZbEFpYU50a3NwK1k4?=
 =?utf-8?B?ejRxRzErQkxDVG9sWW40d2t3c241V0lEVzlYRDlsWCtEUE5hN1JzZXhnNmVS?=
 =?utf-8?B?M2R4VHZnODNVZUh2aUo3RENxZHMyL2RiZEJXVDhIcWRHTlp4RDlWZ2lSSGJs?=
 =?utf-8?B?SlJYK04zeTI4QkFobGNGZ2NvMGp1YnRuY25MUHRTdXhUWURTT2xPS1FEWEo4?=
 =?utf-8?B?b3R6ME5Kd09xckwzUlhranUvM0tld1NYU0xwUW53Q2NXTXlJMGREb3VLSTFm?=
 =?utf-8?B?aFBlcW82YytkQ0Nha0dmN2dCaXRxOTRjdHVtWXB2QWpHNXVMbjF6ZURKVG5V?=
 =?utf-8?B?UWpPbElZdlNHVFA2a0hEK1AvMFZMb2pUVmlLTkQ5UFBvZEZSc05td055SlJs?=
 =?utf-8?B?UmNRQkRoMDFHWldQT21ubDIwZ1pzeEtUNnhaalRGVURXZHhSckF4VFNXUSt0?=
 =?utf-8?B?VkIrZzN6b3ByTERmWFFyMk1LOGozVmFkYVMwZWJMS0xzSzZQMjFxYzdISVdY?=
 =?utf-8?B?KzYvUWszTU5oTjMvSFVENXJKeWJSOE05WHVvTWdxUDZlQ2oxeC9qbVVpUjh2?=
 =?utf-8?B?NzcvY3V0VjlVdVMrS2wyU2F5NUQ2YnpobGFrVDhOS2xTOHd1SXpqMjJRS0cv?=
 =?utf-8?B?ampZV1Vzempqaks2Z2Y0VFplTW9kUjFwZmJJbUVzVEZsTDUrTWxZVmo1cjl2?=
 =?utf-8?B?MHg1VDVkWlN3WW5YVEx4YVIveTk1UnozWEVGeFF1UHpzc0Y5dUZPTzgxUW9U?=
 =?utf-8?B?ckQwcWRTYTJZTkNka01mQWJ4ZUtTUC9XRTNNcmdZUnNqRkhaSFlENEpacjlo?=
 =?utf-8?B?TkltM2R0QXdJRzRIbmphdE8yT1dHNy91TkFlKzU1V0cxYnJLSGI3UGdoYmxl?=
 =?utf-8?B?Y0FwMW96TTFxWFR1bG9KTHc1Q2JaVFJJTExFV0VlTmFHYzRhTFp4NGcremwv?=
 =?utf-8?B?bFBJdlJCUUx3Sk9jeUY2cDRjMWF1bU5GTkVoVzJGeUh5aVRNUnVwRlBDMGJN?=
 =?utf-8?B?dGk3Tnp6SlMvU0tBY0FxYnhCMkNoUWhndFEvMTJiYkJxRWlubzVjZTJjemhS?=
 =?utf-8?B?am1CYnFXWWNZQVZUUUVERXM4VEhYWDVYV0g0bEdXU0h6S3hvM2RSZ1JFdE1V?=
 =?utf-8?B?MXAwVkVoQURsRmJsZHE3VnByWmpWQXR0bTI2Q3BZWCtxNmhickcrakNCM2RN?=
 =?utf-8?B?bkFOTlcydTV5MDBzTzh1dkFJT1NJeGkvNFZkUnpjUGNMNWxpMjBIQm05Ylpt?=
 =?utf-8?B?ZnhTRFBJSS9mU2x0V3lhWnVaVWplVFdyN25TUDhOWDQyV28yK0JDRktFWTNI?=
 =?utf-8?B?R3c0YVRNZVJLalpMSTBHNmRWTEcwQzQrVCtGVEs2Qi81cm5MeXNUbnhoWUNL?=
 =?utf-8?B?YVMxd1pBVjczSGl3Sm1TUzdWb1d3VkxyYzNPZEpEMGdyaVhvY1c1Vk5jM2tR?=
 =?utf-8?B?U1NqRlNSU1pQQVF0RTBVUnh6MzhHYmVCN0NZc2V6cjBLQzVPWlk5LzBNRXd3?=
 =?utf-8?B?SGtqbUVVWC9nT1J0SEhubkJJUmFXQ2VSZENLMS8wc3phc3J5TjhsZU1RVGMy?=
 =?utf-8?B?WU1CM2Jud21hZmtTU2RmQWsyNjlHN0JCRmZvY3NtQW1SSHV4a1c1WnczMUMr?=
 =?utf-8?B?ZDkvWmVSK2tjMDVTWEFnUjQ0L1BtLzFsaDZTQ0ZEMFFML1Z0QTk1djJTbFVi?=
 =?utf-8?B?NHVBaXNUWTgrbElQOWh1SjQydjduclZ6eVZxUXJsVzlDZURMdHJzT3VwaXZ6?=
 =?utf-8?B?M1UxRHhNSTFKYVZqa001ZlBDbzNzVGdkNWNOR0p2UThwOW8rNXNlOGdEMjdq?=
 =?utf-8?B?OWpEaDNnK2VoTDRXekdtcW9HRy9adjV2dDE4ZUR1dzRDRFlmVkEwcVJ5S2lq?=
 =?utf-8?Q?NyOrguFW/87HWbY2uOis1I6c7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0DEFD24B816E7846AFB476766BFA0BC3@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YO2Rg4Q+wPuM6DsTNrARDpwl5pPST3HlF/1QDJnHiGIyb8HU9wpPepG9d/CFyXA6vXeXGCLWOfJLpW7zhhCbuCAJMwhrWCc27jJG24xujCGtTxWBLPJ+JDvWXpIrmdXAyA954OkEBz2WIX94/kSDg2ee0ijWSg0FmavA8hp1JnbJzE1I9hFT/HbMz0IPrcVM2zIZOvcYvgt+DHg913g+www4PgjQv29PIAz2KVC7gliLMytbYSDvwady6qpWggOB9G2Qijf49pxZwXB/B9to790tNwv0m6LmKQnz2mQA6B5jKeaT13Em3KWrFMnW1D7sjaadZoXKDN2A3R+24xtZZo7dJeVQY8U8ducz27Kdhvp/ttmFwrOXaiXMMhvcDqwu3lecdAp9G0HIb94Sjy/DY7q+QTzekLnIT8M3Ggc7x6+UVSrhuGeJBbowb/IpdXW2WdAWh7EQpc9Zxr2HSMQ7KiRCffyfYqjrBULl/QUNzaqlylGoyfTiMjcmB5pEgC1h6LqQRTE5ZeT9MIyFTsq0QW2uYlSgrP7hnrsgId9i4FqtGpqx0TLW9WibOtJ5BC8SkBkVtaOEWJZ3ATu3i2VtfNkjHCxcvq57EEcERujMdaBJGkk8FZ1HbDD0Ame/WB1RbcuM4LmsKyPylRCfWxtp/bN2FmtMOnE1ZP3HfA/IDMvLwln0O1lalL96tYPURUqUX8nx/7aUuf+NvyFdzSawiF50V4U/UFFwRV6Lfbzwr7V/Y4o1mp7XVYMMyieSB2AX61YOAxu6m9T3wz2dubIGihj3gvyA+SAyj4YE99dLhnbjTf57dwRnaU0Y5DLPGSVSiXkgux7UqYzoXiRz4WtiEAteEu1Tv7Rw/isRorhfukCdb4siRIog2eytXkloGsqhcQuBDMf4QkC4ieKwAhAZgw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b82f8fff-52a1-4d91-20f7-08dafd7db1da
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2023 20:09:12.2792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J9ow27tUoAwJSvFthwOcgWN97P6+brj1UM95mQRv2eSJA76q6mQS8LI1s7FXiibXoXsySZvg+EPAFSLtZWfjYOVhI9tae/Bc5lmbfEXh/DA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6115

T24gMjMvMDEvMjAyMyAzOjE3IHBtLCBPbGVrc2lpIHdyb3RlOg0KPiBPbiBNb24sIDIwMjMtMDEt
MjMgYXQgMTE6NTAgKzAwMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAyMC8wMS8yMDIz
IDI6NTkgcG0sIE9sZWtzaWkgS3Vyb2Noa28gd3JvdGU6DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIC8q
IFNhdmUgY29udGV4dCB0byBzdGFjayAqLw0KPj4+ICvCoMKgwqDCoMKgwqDCoCBSRUdfU8KgwqAg
c3AsIChSSVNDVl9DUFVfVVNFUl9SRUdTX09GRlNFVChzcCkgLQ0KPj4+IFJJU0NWX0NQVV9VU0VS
X1JFR1NfU0laRSkgKHNwKQ0KPj4+ICvCoMKgwqDCoMKgwqDCoCBhZGRpwqDCoMKgIHNwLCBzcCwg
LVJJU0NWX0NQVV9VU0VSX1JFR1NfU0laRQ0KPj4+ICvCoMKgwqDCoMKgwqDCoCBSRUdfU8KgwqAg
dDAsIFJJU0NWX0NQVV9VU0VSX1JFR1NfT0ZGU0VUKHQwKShzcCkNCj4+IEV4Y2VwdGlvbnMgb24g
UklTQy1WIGRvbid0IGFkanVzdCB0aGUgc3RhY2sgcG9pbnRlci7CoCBUaGlzIGxvZ2ljDQo+PiBk
ZXBlbmRzDQo+PiBvbiBpbnRlcnJ1cHRpbmcgWGVuIGNvZGUsIGFuZCBYZW4gbm90IGhhdmluZyBz
dWZmZXJlZCBhIHN0YWNrDQo+PiBvdmVyZmxvdw0KPj4gKGFuZCBhY3R1YWxseSwgdGhhdCB0aGUg
c3BhY2Ugb24gdGhlIHN0YWNrIGZvciBhbGwgcmVnaXN0ZXJzIGFsc28NCj4+IGRvZXNuJ3Qgb3Zl
cmZsb3cpLg0KPj4NCj4+IFdoaWNoIG1pZ2h0IGJlIGZpbmUgZm9yIG5vdywgYnV0IEkgdGhpbmsg
aXQgd2FycmFudHMgYSBjb21tZW50DQo+PiBzb21ld2hlcmUNCj4+IChwcm9iYWJseSBhdCBoYW5k
bGVfZXhjZXB0aW9uIGl0c2VsZikgc3RhdGluZyB0aGUgZXhwZWN0YXRpb25zIHdoaWxlDQo+PiBp
dCdzIHN0aWxsIGEgd29yayBpbiBwcm9ncmVzcy7CoCBTbyBpbiB0aGlzIGNhc2Ugc29tZXRoaW5n
IGxpa2U6DQo+Pg0KPj4gLyogV29yay1pbi1wcm9ncmVzczrCoCBEZXBlbmRzIG9uIGludGVycnVw
dGluZyBYZW4sIGFuZCB0aGUgc3RhY2sNCj4+IGJlaW5nDQo+PiBnb29kLiAqLw0KPj4NCj4+DQo+
PiBCdXQsIGRvIHdlIHdhbnQgdG8gYWxsb2NhdGUgc3RlbXAgcmlnaHQgYXdheSAoZXZlbiB3aXRo
IGFuIGVtcHR5DQo+PiBzdHJ1Y3QpLCBhbmQgZ2V0IHRwIHNldCB1cCBwcm9wZXJseT8NCj4+DQo+
IEkgYW0gbm90IHN1cmUgdGhhdCBJIGdldCB5b3UgaGVyZSBhYm91dCBzdGVtcC4gQ291bGQgeW91
IHBsZWFzZSBjbGFyaWZ5DQo+IGEgbGl0dGxlIGJpdC4NCg0KU29ycnkgLSBzc2NyYXRjaCwgbm90
IHN0ZW1wIC0gSSBnb3QgdGhlIG5hbWUgd3JvbmcuDQoNCkFsbCByZWdpc3RlcnMgYXJlIHRoZSBp
bnRlcnJ1cHRlZCBjb250ZXh0LCBub3QgWGVuJ3MgY29udGV4dC7CoCBUaGlzDQppbmNsdWRlcyB0
aGUgc3RhY2sgcG9pbnRlciwgZ2xvYmFsIHBvaW50ZXIsIGFuZCB0aHJlYWQgcG9pbnRlci4NCg0K
VHJhcCBzZXR1cCBpcyBzdXBwb3NlZCB0byBzdGFzaCBYZW4ncyB0cCBpbiBzc2NyYXRjaCBzbyBv
biBhbg0KaW50ZXJydXB0L2V4Y2VwdGlvbiwgaXQgY2FuIGV4Y2hhbmdlIHNzY3JhdGNoIHdpdGgg
dHAgYW5kIHJlY292ZXIgdGhlDQpzdGFjayBwb2ludGVyLg0KDQpMaW51eCBwbGF5cyBnYW1lcyB3
aXRoIGhhdmluZyBzc2NyYXRjaCBiZSAwIHdoaWxlIGluIGtlcm5lbCBhbmQgdXNlcw0KdGhpcyB0
byBkZXRlcm1pbmUgd2hldGhlciB0aGUgZXhjZXB0aW9uIG9jY3VycmVkIGluIGtlcm5lbCBvciB1
c2VyDQptb2RlLsKgIFRoaXMgaXMgbWFzc2l2ZSBjYW4gb2YgcmUtZW50cmFuY3kgYnVncyB0aGF0
IGFwcGVhcnMgdG8gYmUgYmFrZWQNCmludG8gdGhlIGFyY2hpdGVjdHVyZS4NCg0KSSBnZW51aW5l
bHkgY2FuJ3QgZmlndXJlIG91dCBhIHNhZmUgd2F5IHRvIGNvcGUgd2l0aCBhIHN0YWNrIG92ZXJm
bG93LA0Kb3IgYSBiYWQgdHAsIGJlY2F1c2UgaXQgaXMgbm90IHNhZmUgdG8gYSBwYWdlZmF1bHQg
dW50aWwgdGhlIGV4Y2VwdGlvbg0KcHJvbG9ndWUgaGFzIGNvbXBsZXRlZC7CoCBJZiB5b3UgZG8s
IHlvdSdsbCBzd2l0Y2ggYmFjayB0byB0aGUNCmludGVycnVwdGVkIHRhc2sncyB0cCBhbmQgdXNl
IHRoYXQgYXMgaWYgaXQgd2VyZSBYZW4ncy4NCg0KfkFuZHJldw0K

