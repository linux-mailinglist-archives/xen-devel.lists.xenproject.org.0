Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9633E5396
	for <lists+xen-devel@lfdr.de>; Tue, 10 Aug 2021 08:36:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165260.302028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDLLv-0003nf-TG; Tue, 10 Aug 2021 06:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165260.302028; Tue, 10 Aug 2021 06:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDLLv-0003km-Pk; Tue, 10 Aug 2021 06:35:07 +0000
Received: by outflank-mailman (input) for mailman id 165260;
 Tue, 10 Aug 2021 06:35:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VKff=NB=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDLLt-0003kg-Hy
 for xen-devel@lists.xenproject.org; Tue, 10 Aug 2021 06:35:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.50]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 178ac782-f9a5-11eb-9f5a-12813bfff9fa;
 Tue, 10 Aug 2021 06:35:03 +0000 (UTC)
Received: from AM5PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:206:1::17)
 by PA4PR08MB6079.eurprd08.prod.outlook.com (2603:10a6:102:ee::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Tue, 10 Aug
 2021 06:35:00 +0000
Received: from AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::20) by AM5PR04CA0004.outlook.office365.com
 (2603:10a6:206:1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Tue, 10 Aug 2021 06:35:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT021.mail.protection.outlook.com (10.152.16.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Tue, 10 Aug 2021 06:34:59 +0000
Received: ("Tessian outbound 79bfeeb089c1:v101");
 Tue, 10 Aug 2021 06:34:59 +0000
Received: from 04811aa943c4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0FCD5D54-D256-43C2-A5A5-DDC8F1C88BDE.1; 
 Tue, 10 Aug 2021 06:34:52 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 04811aa943c4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Aug 2021 06:34:52 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB5948.eurprd08.prod.outlook.com (2603:10a6:10:202::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Tue, 10 Aug
 2021 06:34:41 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%6]) with mapi id 15.20.4394.023; Tue, 10 Aug 2021
 06:34:40 +0000
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
X-Inumbo-ID: 178ac782-f9a5-11eb-9f5a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmOkUiPG/ccgqTyiVPAdNi/gPzXNs9CFuFNupouyhYQ=;
 b=z2wELy7QlsKUKMBagQU7wjAUjZJWRIjvTyNGKDg9uVv7mi7cSUEnhnp4aein3/+dMjZVeLMlhM0VzjdbEMEsl3z4qW4OS6miX1eWPiY0e5yCzkLMHXsP+FspC1z/4kCrSp4HO7YFKeY6uIr95mjGMtUUQY5a3hecnI0twjW8o98=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVfTzePOcTljKUWs27xb8yUwWLI7NY2mPbeuv7yTzeS7NdBtq7K7aFc1ocjtbvhbs1mop4we11HdW1oYCF3v/LX4NqiNvqzq/rmvnZfxXJatstU2jafW1ptALgbYXGAaDNpYIhiY2JHlkQZ9vAJ8jWbMKbbMSskZOBaW3QSNQNtGVNewxatkuaIux22u0uGbccb6yUHAqaesIbZDS/6hjfQS4WX8RQTcseDmaEjknrIy9KWPOik66pKzw1/d2tzcE/5dfUrDKL9vXtGtK4cxRjCOytjGieOCAwmTMQ4AsWmzAVkqiQkBAwr7JNfULXXJk8eGx8fPkbunt+FINenopQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmOkUiPG/ccgqTyiVPAdNi/gPzXNs9CFuFNupouyhYQ=;
 b=WIaMO97xb7qpJg8lPJsJdSHiDGYus1roMskB/EClBYxosnANHlUoI2f5L+h3UfbhcA3uKfrLHC5EQWbCn01sJCB+FzeT+DXmus/2f1KpN9alTOyocVsyXMG8W6IRVgaA1kWYXeeDSOTh/Nkv4kSZi48MDyaHLlGciheylcdS1pTIJeCKnGGIDKoxg+YZ9CMcAmplvoRrkJ3fDtU9nNhC7VArlicjS2BsJfu6tuFRDvWjoUvow4VyqNFgXwUsT6OREetzs6y0CW8Pb9TB5rSghJPmVckscLpmc4zx99jF9S6zUzlF4ikOv29Lyjo8mu5kfaYCCcKgPOc3ENEWTYX1JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmOkUiPG/ccgqTyiVPAdNi/gPzXNs9CFuFNupouyhYQ=;
 b=z2wELy7QlsKUKMBagQU7wjAUjZJWRIjvTyNGKDg9uVv7mi7cSUEnhnp4aein3/+dMjZVeLMlhM0VzjdbEMEsl3z4qW4OS6miX1eWPiY0e5yCzkLMHXsP+FspC1z/4kCrSp4HO7YFKeY6uIr95mjGMtUUQY5a3hecnI0twjW8o98=
From: Wei Chen <Wei.Chen@arm.com>
To: Oleksandr <olekstysh@gmail.com>, Julien Grall <julien@xen.org>, Penny
 Zheng <Penny.Zheng@arm.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
Thread-Topic: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
Thread-Index:
 AQHXg8xICZg4GbkvRUi6KcMYqJ5Tb6tYofOAgAACKACAABoQgIAADqwAgALnQwCAAIF7AIAEZ4iAgANBs4CAABH5AIABvA2AgAKn7QCAAw4SgIAALTOAgADLRpA=
Date: Tue, 10 Aug 2021 06:34:40 +0000
Message-ID:
 <DB9PR08MB6857442248B996CC978BBA379EF79@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
 <80fafc01-f063-d6e5-1c08-7ad64550310c@citrix.com>
 <e8db3021-78a5-e040-a70b-62ca5b500149@xen.org>
 <4de5ed21-379e-b618-44c8-924d88b1a519@citrix.com>
 <bbc7f597-5249-20a0-cac9-13f594268299@xen.org>
 <6a633f4e-13e0-4a2b-cf6e-35ef90ae977c@gmail.com>
 <alpine.DEB.2.21.2107301630510.10122@sstabellini-ThinkPad-T480s>
 <f6b2e6c6-bf58-960f-4a09-f05ebcf1f566@gmail.com>
 <5643d414-0b76-74a4-2c37-c7a99338d547@gmail.com>
 <c83378af-4d3b-9256-0e0d-f88c43c6de2f@xen.org>
 <alpine.DEB.2.21.2108051720210.18743@sstabellini-ThinkPad-T480s>
 <6596ad08-8398-64dd-ef62-cd7bc6f7333e@gmail.com>
 <bc576a23-d107-c67d-8dca-62691e5eea1a@xen.org>
 <1d0ea55d-2e5a-daa7-9c60-c7a1c4b48fa1@gmail.com>
In-Reply-To: <1d0ea55d-2e5a-daa7-9c60-c7a1c4b48fa1@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9D0CB942C20C8B499759BB9CB660FA49.0
x-checkrecipientchecked: true
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 86439dd4-14f0-4610-b448-08d95bc8fa36
x-ms-traffictypediagnostic: DBBPR08MB5948:|PA4PR08MB6079:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB6079AA1D2F2DBFD83610D42B9EF79@PA4PR08MB6079.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TcsR3l38N4hL5rC99YZboK7aBG8+M3MStJJpAkkWSKoPdRsXpij/cvCJYPEo7b5RGoUVnrvQA2KFLZxFVkpWxI8hDIBn4130eUAyEDpxqaQWYi1Qmbr2nr83/UJRoD//xuIyf8X6Tuw0t5tvn3vhDwQw/5iRsWWlh7zEyWQGofqZvNhbntUu+NxwXnNxTnoKjv94B66PNT/bZQq46rGxLNnvpjWKFJXqTdg8aVAIwUCdvAzgQCrnwxC992ORpXnpp7z/Zm2wzdL+zfAYgMG7jAEcVOVtawZjTmNcvdYNqlWWsC9jSOaGzC4N95KCCigE1duapNTaSux/ZV5/aXTxRzT80a0x5a24B5v1YXuAgQ3Fl+93H6dqt/uvlvwx53WhmA4zGjN7/3NppHjGM+BwJAu+UeyD8I10dhgBt/4hYODHIoo4RDvFX4D/6MyKD3l9T67wsTqCLmCS94JkIBe2Oy7mCkk+yQT1O7uVLBcSxKB4ZoJzLC2Pl8R18uY1+c11+cdg9pGVagZ37q9+68spbwWkPghU/GzYHb2tHFiDjcUIogdB11MVt3Yoq7+iWyS4Pucs2J4TZTIKokw0NNjqw+RVGsvraRaWwxPW6dsa3pMBHO+PUWqThg3KD4JUJJC9FGSFx184tSskam9BSTlVyMHOXVLE+8Bu4m5Np2TzvPh52SJP1stCUwjxa9s6vUE72FC2aVm3tUcQ8NYzE8rGBYosJKR4yAWlIlGQVyIaMQ4ZANEeVkiHCq3kcz8VSLMBLb/Ff3V73ibSKf5CPtKUhLyDNG8at7dtQQHT2FfJASo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(186003)(966005)(83380400001)(33656002)(86362001)(55016002)(66476007)(52536014)(316002)(66446008)(2906002)(9686003)(66556008)(508600001)(71200400001)(8676002)(8936002)(4326008)(110136005)(54906003)(66946007)(6506007)(38100700002)(76116006)(53546011)(64756008)(38070700005)(7696005)(122000001)(5660300002)(7416002)(6636002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Zm9EMUo0em1xV0tEUWlnd3Q4VTdtZ3dSMXR0aVk1ZXFUR2tRRFErbWhycG1E?=
 =?utf-8?B?TnduNEprckt4bjZLMHZ2TStxbnBVbndXeGpwUUlHbFRGdkFUR2I4TTdlOXBk?=
 =?utf-8?B?UVhMZS9rZ0lzYmczOERtbzhpMEQ5bEpzL3M2c1lyc3BCcUpaVmd6eE00WEk1?=
 =?utf-8?B?QldaNk1EeVYwdTRuNWFTTWlkS3pNZW1yS2tLeGV6bDhiRW9GcWM0VnVzTTNr?=
 =?utf-8?B?Y0NiS2p1eXpBVlI1QlZHR2tLT0lsZjFnblo4Q0plNENPb3h2RmxKdnZ1YWRE?=
 =?utf-8?B?aHo1YlZpMk1oMFZsQjE4TjZMR3paZTI3b1ZlVEtVYzFZOG9RR2dML0pHMTla?=
 =?utf-8?B?OUtRTnlQYjMyNmUwR2ZXZFNGOWlsU25QOW41VDR1OFg4YWRzdmliUnRYK29E?=
 =?utf-8?B?clF0ZkZFMGZDaEJwK0JyOHpxdldvakxjNHplcjBNcUtWbjltOGp1ZGZRSFZP?=
 =?utf-8?B?WW42UjFlYUx3eXhpSExUNWR3N3BFM0YrKytzL2swMS9MbGdvUVpydmxweng5?=
 =?utf-8?B?SG1kUklLWXJ4RVU1QmFsNTBrMngzeHJnaGRBVmk1aFZsdjRiZVErZ21Fb1R6?=
 =?utf-8?B?SmIvdU83ZTFneDhIWkJtWlVvSDl3RW9ISE8wNXhFcW1yQ0FScFNubm9wMlkw?=
 =?utf-8?B?TnFEeThCMzUwNEJnTS83bHllTzVZYW1sY2w5NDhXeElKT0V2YzlWZnFMM3lV?=
 =?utf-8?B?cGZ6MWVBUFJ1V1hsYTdhZGpXUElkOFFYRTI0MkNZOWc3ZzZNM2taVVBkL2Jw?=
 =?utf-8?B?TkN2MGFENnppTUN4NUNXczFGK0xSTnd4MFZHQ2hQTmhJMUxOdDBFQU1VQkpj?=
 =?utf-8?B?UUk2MEo0UUdpSlZRV3FkOENNYko0UHJnekVzVVB0WUR0YWpRSCtmVmQvek94?=
 =?utf-8?B?YjRJRzMzTDhKVFN4QjVDa2JGOStiUGpkZjBjdXhxL3JDYU9POStPbUpidmFx?=
 =?utf-8?B?SG13akhtdzVCeXdVUHI4dTh2T0FQZWxwcThmZko3RnNnMkNlSGpWOGl4SWNR?=
 =?utf-8?B?WlIxQVNIZnU2enhEaERYZEVSd1VEUHRxK2ExWFo3c2I0QUlKblpnOWJDK21Q?=
 =?utf-8?B?MVowSzIyalJMNDk0elZJaTYzNzU0Smo4S2VIeE1RTC92NWFiblNkT1Vjd0Vh?=
 =?utf-8?B?M0JWdUZJMkt5ZGoxcGF1NzJCNGdGNGpnZ2JkMzBkWlQ3K0lpUVExRlQxQTUr?=
 =?utf-8?B?YTM0YW44WjBnVHpuQkhKRmp4eVdBbzN3bTFSbEorRjVyUzJkaHVvRUUxRGtk?=
 =?utf-8?B?RzFFZ3E2OXJoN2RMYk80Qnp5MVdmeHZpQ0lyeDlSZ3Fzck1zOWJxd25FOFYr?=
 =?utf-8?B?TzJlMUlPWTMrclZtbWU3TjBaVVRlYkROQlJ1Q3dLS2RLWWFHWmxycUZ5VWlL?=
 =?utf-8?B?QzN3UFJ0bHVhUElkNXRXek4zY29QRjFJRWNUY1BPaUExOGV2VVhtaWpqR1Ix?=
 =?utf-8?B?RDJ6YVY2QVJ6aEFBcmdaeXZraXIwWGlkbjYzRC9UYUF3cWs1UTFZcGdtR2Zw?=
 =?utf-8?B?aWU2ZlVLVWNPaXE5TS9BWFcxUC8zVnF6ejF3MFFHZ1pFeHFzdlRQRUg2Zmcr?=
 =?utf-8?B?THNnam9MMWtTK2lzbU13QVpKRE56ODRGSEV2dkRNZGgzcGUyUlp6SWJEemhG?=
 =?utf-8?B?ZS9JWFcvQ3psZmR1S0U3L1pJeFduMTJuSnZiOUQxdkFoZGZEMmI5cS9ydzQw?=
 =?utf-8?B?OW9PTEhvTWJ3NUVHSGFSZUlGaUVsK2FJZDd5cmV3YXFQUmhIV0UwZGZub2ZN?=
 =?utf-8?Q?elYNfhGonSh/C6RLpkFfqQVIYgw0PDWHK64oV4F?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5948
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	80e3d17e-ba56-4f4d-263f-08d95bc8eeee
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GAUssLZ2HMibadsxhXGEsuh5x7I6KMq87SEx9dzw77sxW9VIfmzVJt4B3sV//4V5DmvczrVdppPM7sxEZN5mgS4KDX4hzhCxBdNHRThEmEaYRTlpsbHu4XJelpJb2MwcASC5VHVH2Bh1E+slgNHzWTRZLuus5enEOkEcYOQ90m6BAd+VFZh5p6/kphSPcwV0d8goh+vazppfaoHc7mYmiVEGNuhixTLAgxod4krfjxvI+w0OJFql/jHYOIe9KQGKHv1zEwBLitctQx7uHlWNvPeyhyBWOiuhckxHg3gq/kndRlFyw2HbbWskydc3TC3tYeN+Ds7fnDU+Af2ItPwugho+h47HSZhVbOa7pXItsmgjbWxZEDzmoooPi09LtVC3ZB7GsxmZ9g5zwdtZ0YG28p4NkQg3shgBisRK6XO2D8HrHD0saDDrs01OVU8Hk/rJ69lzHMhVLq5DTFURcCQYkgxFxad/Uqu5ZHxBUx7JAKAKWEVZWEU+LrRRnTYFaIqH1ZP3q4IX+/Q+/IDzfkKCtz7MdMSX5wA0ExhWfkU8LoVm2DcPKao4m4tgxCaXupbTUrVeoFzD1v9KeDpIpQ9fbpgmFDYrrER6vMTl/cbRU79OSmmq23uaxKPFQxKl0GZrM9p7b+GCnCw3ItRQVTk3hxL+DRyotv3nhQ4SwBSgdmVECvnY/IYvfcBIdIOU20sofn1xZ7vY5U4+TcIO1cIAzP3puOWgCUVVtycV53ywPeL/uWrsi0HypmATFSTM6va5oG58JZ5IJo2ET2PeCfXiSw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(36840700001)(46966006)(186003)(966005)(26005)(2906002)(7696005)(54906003)(6506007)(53546011)(5660300002)(478600001)(6636002)(336012)(55016002)(47076005)(33656002)(316002)(356005)(4326008)(36860700001)(9686003)(82740400003)(52536014)(8676002)(8936002)(82310400003)(81166007)(86362001)(70586007)(83380400001)(110136005)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 06:34:59.8372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86439dd4-14f0-4610-b448-08d95bc8fa36
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6079

SGkgT2xla3NhbmRyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE9s
ZWtzYW5kciA8b2xla3N0eXNoQGdtYWlsLmNvbT4NCj4gU2VudDogMjAyMeW5tDjmnIgxMOaXpSAy
OjI1DQo+IFRvOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiBDYzogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsg
T2xla3NhbmRyDQo+IFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPjsg
RGFuaWVsIERlIEdyYWFmDQo+IDxkZ2RlZ3JhQHR5Y2hvLm5zYS5nb3Y+OyBEYW5pZWwgUC4gU21p
dGggPGRwc21pdGhAYXBlcnR1c3NvbHV0aW9ucy5jb20+Ow0KPiBJYW4gSmFja3NvbiA8aXdqQHhl
bnByb2plY3Qub3JnPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEdlb3JnZSBEdW5sYXANCj4gPGdl
b3JnZS5kdW5sYXBAY2l0cml4LmNvbT47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47
IFZvbG9keW15cg0KPiBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IFJvZ2Vy
IFBhdSBNb25uw6kNCj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgQmVydHJhbmQgTWFycXVpcyA8
QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgV2VpDQo+IENoZW4gPFdlaS5DaGVuQGFybS5jb20+
DQo+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIXSB4ZW4vbWVtb3J5OiBJbnRyb2R1Y2UgYSBoeXBl
cmNhbGwgdG8gcHJvdmlkZQ0KPiB1bmFsbG9jYXRlZCBzcGFjZQ0KPiANCj4gDQo+IE9uIDA5LjA4
LjIxIDE4OjQyLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+ID4gSGkgT2xla3NhbmRyLA0KPiANCj4g
DQo+IEhpIEp1bGllbi4NCj4gDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBpbnB1dC4NCj4gDQo+
IA0KPiA+DQo+ID4gT24gMDcvMDgvMjAyMSAxODowMywgT2xla3NhbmRyIHdyb3RlOg0KPiA+Pg0K
PiA+PiBPbiAwNi4wOC4yMSAwMzozMCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPiA+Pg0K
PiA+PiBIaSBTdGVmYW5vDQo+ID4+DQo+ID4+PiBPbiBXZWQsIDQgQXVnIDIwMjEsIEp1bGllbiBH
cmFsbCB3cm90ZToNCj4gPj4+Pj4gKyNkZWZpbmUgR1VFU1RfU0FGRV9SQU5HRV9CQVNFIHhlbl9t
a191bGxvbmcoMHhERTAwMDAwMDAwKSAvKg0KPiA+Pj4+PiAxMjhHQiAqLw0KPiA+Pj4+PiArI2Rl
ZmluZSBHVUVTVF9TQUZFX1JBTkdFX1NJWkUgeGVuX21rX3VsbG9uZygweDAyMDAwMDAwMDApDQo+
ID4+Pj4+DQo+ID4+Pj4+IFdoaWxlIHRoZSBwb3NzaWJsZSBuZXcgRFQgYmluZGluZ3MgaGFzIG5v
dCBiZWVuIGFncmVlZCB5ZXQsIEkgcmUtDQo+IHVzZWQNCj4gPj4+Pj4gZXhpc3RpbmcgInJlZyIg
cHJvcGVydHkgdW5kZXIgdGhlIGh5cGVydmlzb3Igbm9kZSB0byBwYXNzIHNhZmUNCj4gPj4+Pj4g
cmFuZ2UgYXMgYQ0KPiA+Pj4+PiBzZWNvbmQgcmVnaW9uLA0KPiA+Pj4+PiBodHRwczovL2VsaXhp
ci5ib290bGluLmNvbS9saW51eC92NS4xNC0NCj4gcmM0L3NvdXJjZS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvYXJtL3hlbi50eHQjTDEwOg0KPiA+Pj4+Pg0KPiA+Pj4+IFNvIGEg
c2luZ2xlIHJlZ2lvbiB3b3JrcyBmb3IgYSBndWVzdCB0b2RheSwgYnV0IGZvciBkb20wIHdlIHdp
bGwNCj4gPj4+PiBuZWVkIG11bHRpcGxlDQo+ID4+Pj4gcmVnaW9ucyBiZWNhdXNlIGl0IGlzIG1h
eSBiZSBkaWZmaWN1bHQgdG8gZmluZCBlbm91Z2ggY29udGlndW91cw0KPiA+Pj4+IHNwYWNlIGZv
ciBhDQo+ID4+Pj4gc2luZ2xlIHJlZ2lvbi4NCj4gPj4+Pg0KPiA+Pj4+IFRoYXQgc2FpZCwgYXMg
ZG9tMCBpcyBtYXBwZWQgMToxIChpbmNsdWRpbmcgc29tZSBndWVzdCBtYXBwaW5nKSwNCj4gPj4+
PiB0aGVyZSBpcyBhbHNvDQo+ID4+Pj4gdGhlIHF1ZXN0aW9uIHdoZXJlIHRvIGFsbG9jYXRlIHRo
ZSBzYWZlIHJlZ2lvbi4gRm9yIGdyYW50IHRhYmxlLCB3ZQ0KPiA+Pj4+IHNvIGZhcg0KPiA+Pj4+
IHJlLXVzZSB0aGUgWGVuIGFkZHJlc3Mgc3BhY2UgYmVjYXVzZSBpdCBpcyBhc3N1bWVkIGl0IHdp
bGwgc3BhY2UNCj4gPj4+PiB3aWxsIGFsd2F5cw0KPiA+Pj4+IGJlIGJpZ2dlciB0aGFuIHRoZSBn
cmFudCB0YWJsZS4NCj4gPj4+Pg0KPiA+Pj4+IEkgYW0gbm90IHN1cmUgeWV0IHdoZXJlIHdlIGNv
dWxkIGFsbG9jYXRlIHRoZSBzYWZlIHJlZ2lvbnMuDQo+ID4+Pj4gU3RlZmFubywgZG8geW91DQo+
ID4+Pj4gaGF2ZSBhbnkgaWRlYXM/DQo+ID4+PiBUaGUgc2FmZXN0IGNob2ljZSB3b3VsZCBiZSB0
aGUgYWRkcmVzcyByYW5nZSBjb3JyZXNwb25kaW5nIHRvIG1lbW9yeQ0KPiA+Pj4gKC9tZW1vcnkp
IG5vdCBhbHJlYWR5IGFsbG9jYXRlZCB0byBEb20wLg0KPiA+Pj4NCj4gPj4+IEZvciBpbnN0YW5j
ZSBmcm9tIG15IGxhc3QgYm9vdCBsb2dzOg0KPiA+Pj4gKFhFTikgQWxsb2NhdGluZyAxOjEgbWFw
cGluZ3MgdG90YWxsaW5nIDE2MDBNQiBmb3IgZG9tMDoNCj4gPj4+IChYRU4pIEJBTktbMF0gMHgw
MDAwMDAxMDAwMDAwMC0weDAwMDAwMDcwMDAwMDAwICgxNTM2TUIpDQo+ID4+PiAoWEVOKSBCQU5L
WzFdIDB4MDAwMDAwNzgwMDAwMDAtMHgwMDAwMDA3YzAwMDAwMCAoNjRNQikNCj4gPj4+DQo+ID4+
PiBBbGwgdGhlIG90aGVyIHJhbmdlcyBjb3VsZCBiZSBnaXZlbiBhcyB1bmFsbG9jYXRlZCBzcGFj
ZToNCj4gPj4+DQo+ID4+PiAtIDB4MCAtIDB4MTAwMDAwMDANCj4gPj4+IC0gMHg3MDAwMDAwMCAt
IDB4NzgwMDAwMDANCj4gPj4+IC0gMHg4XzAwMDBfMDAwMCAtIDB4OF84MDAwXzAwMDANCj4gPj4N
Cj4gPj4gVGhhbmsgeW91IGZvciB0aGUgaWRlYXMuDQo+ID4+DQo+ID4+IElmIEkgZ290IHRoZSBp
ZGVhIGNvcnJlY3RseSwgeWVzLCBhcyB0aGVzZSByYW5nZXMgcmVwcmVzZW50IHRoZSByZWFsDQo+
ID4+IFJBTSwgc28gbm8gSS9PIHdvdWxkIGJlIGluIGNvbmZsaWN0IHdpdGggdGhlbSBhbmQgYXMg
dGhlIHJlc3VsdCAtIG5vDQo+ID4+IG92ZXJsYXBzIHdvdWxkIGJlIGV4cGVjdGVkLg0KPiA+PiBC
dXQsIEkgd29uZGVyLCB3b3VsZCB0aGlzIHdvcmsgaWYgd2UgaGF2ZSBJT01NVSBlbmFibGVkIGZv
ciBEb20wIGFuZA0KPiA+PiBuZWVkIHRvIGVzdGFibGlzaCAxOjEgbWFwcGluZyBmb3IgdGhlIERN
QSBkZXZpY2VzIHRvIHdvcmsgd2l0aCBncmFudA0KPiA+PiBtYXBwaW5ncy4uLg0KPiA+PiBJbiBh
cm1faW9tbXVfbWFwX3BhZ2UoKSB3ZSBjYWxsIGd1ZXN0X3BoeXNtYXBfYWRkX2VudHJ5KCkgd2l0
aCBnZm4gPQ0KPiA+PiBtZm4sIHNvIHRoZSBxdWVzdGlvbiBpcyBjb3VsZCB3ZSBlbmQgdXAgd2l0
aCB0aGlzIG5ldyBnZm4gcmVwbGFjaW5nDQo+ID4+IHRoZSB2YWxpZCBtYXBwaW5nDQo+ID4+ICh3
aXRoIGdmbiBhbGxvY2F0ZWQgZnJvbSB0aGUgc2FmZSByZWdpb24pPw0KPiA+DQo+ID4gUmlnaHQs
IHdoZW4gd2UgZW5hYmxlIHRoZSBJT01NVSBmb3IgZG9tMCwgWGVuIHdpbGwgYWRkIGFuIGV4dHJh
DQo+ID4gbWFwcGluZyB3aXRoIEdGTiA9PSBNRk4gZm9yIGZvcmVpZ24gYW5kIGdyYW50IHBhZ2Vz
LiBUaGlzIGlzIGJlY2F1c2UNCj4gPiBMaW51eCBpcyBub3QgYXdhcmUgdGhhdCB3aGV0aGVyIGEg
ZGV2aWNlIGlzIHByb3RlY3RlZCBieSBhbiBJT01NVS4NCj4gPiBUaGVyZWZvcmUgaXQgaXMgYXNz
dW1pbmcgaXQgaXMgbm90IGFuZCB3aWxsIHVzZSB0aGUgTUZOIHRvIGNvbmZpZ3VyZQ0KPiA+IGZv
ciBETUEgdHJhbnNhY3Rpb24uDQo+ID4NCj4gPiBXZSBjYW4ndCByZW1vdmUgdGhlIG1hcHBpbmcg
d2l0aG91dCBzaWduaWZpY2FudCBjaGFuZ2VzIGluIExpbnV4IGFuZA0KPiA+IFhlbi4gSSB3b3Vs
ZCBub3QgbWFuZGF0ZSB0aGVtIGZvciB0aGlzIHdvcmsuDQo+ID4NCj4gPiBUaGF0IHNhaWQsIEkg
dGhpbmsgaXQgd291bGQgYmUgYWNjZXB0YWJsZSB0byBoYXZlIGRpZmZlcmVudCB3YXkgdG8NCj4g
PiBmaW5kIHRoZSByZWdpb24gZGVwZW5kaW5nIG9uIHRoZSBkb20wIGNvbmZpZ3VyYXRpb24uIFNv
IHdlIGNvdWxkIHVzZQ0KPiA+IHRoZSBSQU0gbm90IHVzZWQgYnkgZG9tMCB3aGVuIHRoZSBJT01N
VSBpcyB0dXJuZWQgb2ZmLg0KPiANCj4gT0sNCj4gDQo+IA0KPiA+DQo+ID4+PiBUaGUgc2Vjb25k
IGJlc3QgY2hvaWNlIHdvdWxkIGJlIGFuIGhvbGU6IGFuIGFkZHJlc3MgcmFuZ2Ugbm90IHVzZWQg
YnkNCj4gPj4+IGFueWJvZHkgZWxzZSAobm8gcmVnIHByb3BlcnR5KSBhbmQgYWxzbyBub3QgZXZl
biBtYXBwYWJsZSBieSBhIGJ1cw0KPiAobm90DQo+ID4+PiBjb3ZlcmVkIGJ5IGEgcmFuZ2VzIHBy
b3BlcnR5KS4gVGhpcyBpcyBub3QgdGhlIGJlc3QgY2hvaWNlIGJlY2F1c2UNCj4gPj4+IHRoZXJl
DQo+ID4+PiBjYW4gY2FzZXMgd2hlcmUgcGh5c2ljYWwgcmVzb3VyY2VzIGFwcGVhciBhZnRlcndh
cmRzLg0KPiA+DQo+ID4gQXJlIHlvdSBzYXlpbmcgdGhhdCB0aGUgb3JpZ2luYWwgZGV2aWNlLXRy
ZWUgZG9lc24ndCBldmVuIGRlc2NyaWJlDQo+ID4gdGhlbSBpbiBhbnkgd2F5IChpLmUuIHJlc2Vy
dmVkLi4uKT8NCj4gPg0KPiA+Pg0KPiA+PiBVbmZvcnR1bmF0ZWx5LCB5ZXMuDQo+ID4NCj4gPiBT
byB0aGUgZGVjaXNpb24gd2hlcmUgdGhlIHNhZmUgcmVnaW9uIGlzIGxvY2F0ZWQgd2lsbCBiZSBk
b25lIGJ5IFhlbi4NCj4gPiBUaGVyZSBpcyBubyBpbnZvbHZlbWVudCBvZiB0aGUgZG9tYWluIChp
dCB3aWxsIGRpc2NvdmVyIHRoZSByZWdpb24NCj4gPiBmcm9tIHRoZSBEVCkuIFRoZXJlZm9yZSwg
SSBkb24ndCB0aGluayB3ZSBuZWVkIHRvIHRoaW5rIGFib3V0DQo+ID4gZXZlcnl0aGluZyByaWdo
dCBub3cgYXMgd2UgY291bGQgYWRhcHQgdGhpcyBpcyBleGFjdCByZWdpb24gaXMgbm90DQo+ID4g
cGFydCBvZiB0aGUgc3RhYmxlIEFCSS4NCj4gPg0KPiA+IFRoZSBob3RwbHVnIGlzIG9uZSBJIHdv
dWxkIGRlZmVyIGJlY2F1c2UgdGhpcyBpcyBub3Qgc3VwcG9ydGVkIChhbmQNCj4gPiBxdWl0ZSBs
aWtlbHkgbm90IHdvcmtpbmcpIGluIFhlbiB1cHN0cmVhbSB0b2RheS4NCj4gDQo+IFNvdW5kcyBy
ZWFzb25hYmxlLg0KPiANCj4gDQo+ID4NCj4gPg0KPiA+IE5vdyByZWdhcmRpbmcgdGhlIGNhc2Ug
d2hlcmUgZG9tMCBpcyB1c2luZyB0aGUgSU9NTVUuIFRoZSBhc3N1bXB0aW9uDQo+ID4gaXMgWGVu
IHdpbGwgYmUgYWJsZSB0byBmaWd1cmUgb3V0IGFsbCB0aGUgcmVnaW9ucyB1c2VkIGZyb20gdGhl
DQo+ID4gZmlybXdhcmUgdGFibGUgKEFDUEkgb3IgRFQpLg0KPiA+DQo+ID4gQUZBSUssIHRoaXMg
YXNzdW1wdGlvbiB3b3VsZCBiZSBjb3JyZWN0IGZvciBEVC4gSG93ZXZlciwgZm9yIEFDUEksIEkN
Cj4gPiByZW1lbWJlciB3ZSB3ZXJlIG5vdCBhYmxlIHRvIGZpbmQgYWxsIHRoZSBNTUlPcyByZWdp
b24gaW4gWGVuIChzZWUgWzFdDQo+ID4gYW5kIFsyXSkuIFNvIGV2ZW4gdGhpcyBzb2x1dGlvbiB3
b3VsZCBub3Qgd29yayBmb3IgQUNQSS4NCj4gPg0KPiA+IElmIEkgYW0gbm90IG1pc3Rha2VuLCB3
ZSBkb24ndCBzdXBwb3J0IElPTU1VIHdpdGggQUNQSSB5ZXQuIFNvIHdlDQo+ID4gY291bGQgZGVm
ZXIgdGhlIHByb2JsZW0gdG8gd2hlbiB0aGlzIGlzIGdvaW5nIHRvIGJlIHN1cHBvcnRlZC4NCj4g
DQo+IFNvdW5kcyByZWFzb25hYmxlLg0KPiANCj4gDQo+IFRvIHN1bW1hcml6ZToNCj4gDQo+IDAu
IFNraXAgQUNQSSBjYXNlIGZvciBub3csIGltcGxlbWVudCBmb3IgRFQgY2FzZQ0KPiANCj4gMS4g
SWYgSU9NTVUgaXMgZW5hYmxlZCBmb3IgRG9tMCAtPiBwcm92aWRlIGhvbGVzIGZvdW5kIGluIEhv
c3QgRFQgYXMNCj4gc2FmZSByYW5nZXMNCj4gDQoNCkRvZXMgc3RhdGljIGFsbG9jYXRpb24gYW5k
IGRpcmVjdCBtYXBwaW5nIGRyaXZlciBkb21haW4gY2FuIGJlIHRyZWF0ZWQNCmFzIHRoaXMgY2Fz
ZT8NCg0KPiBJIHdvdWxkIHRha2UgaW50byB0aGUgYWNjb3VudCBob2xlcyA+PSAxTUIuIEkgYW0g
d29uZGVyaW5nLCBkbyB3ZSBuZWVkIGENCj4gc3BlY2lhbCBhbGlnbm1lbnQgaGVyZSBvdGhlciB0
aGFuIGEgUEFHRV9TSVpFPw0KPiANCj4gMi4gSWYgSU9NTVUgaXMgZGlzYWJsZWQgZm9yIERvbTAg
LT4gcHJvdmlkZSBSQU0gd2hpY2ggbm90IGFzc2lnbmVkIHRvDQo+IERvbTAgYXMgc2FmZSByYW5n
ZXMNCj4gDQo+IFdlIGNvdWxkIGV2ZW4gcHJvdmlkZSBob2xlcyBoZXJlIGFzIHdlbGwuDQo+IA0K
PiANCj4gPg0KPiA+DQo+ID4gQ2hlZXJzLA0KPiA+DQo+ID4gWzFdIGh0dHBzOi8vbWFyYy5pbmZv
Lz9sPWxpbnV4LWFybS1rZXJuZWwmbT0xNDg0NjkxNjkyMTA1MDAmdz0yDQo+ID4gWzJdIFhlbiBj
b21taXQgODBmOWMzMTY3MDg0MDBjZWE0NDE3ZTM2MzM3MjY3ZDNiMjY1OTFkYg0KPiA+DQo+IC0t
DQo+IFJlZ2FyZHMsDQo+IA0KPiBPbGVrc2FuZHIgVHlzaGNoZW5rbw0KDQo=

