Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DC063F1BD
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 14:36:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450720.708132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0jj8-0007S1-Ih; Thu, 01 Dec 2022 13:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450720.708132; Thu, 01 Dec 2022 13:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0jj8-0007Pt-Em; Thu, 01 Dec 2022 13:35:46 +0000
Received: by outflank-mailman (input) for mailman id 450720;
 Thu, 01 Dec 2022 13:35:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pMaK=37=citrix.com=prvs=3274cb7b8=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p0jj7-0007Pf-5N
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 13:35:45 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a99fb41-717d-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 14:35:42 +0100 (CET)
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Dec 2022 08:35:19 -0500
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by MN2PR03MB5311.namprd03.prod.outlook.com (2603:10b6:208:19f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 13:35:18 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b%5]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 13:35:17 +0000
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
X-Inumbo-ID: 0a99fb41-717d-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669901743;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=uUr8G0OJ3rME1PTNnZPjnOZ2rQWWRH2g/anZg+PYxNQ=;
  b=U1IlX9wJ3JMJ0t3Sp+gO94rCdX9ClbSUrD0GYkJI4hd6yIxSSqjI4aWo
   4EbJ0LRJDcxUMdSzF7FES4DbK9TfjL0a69hgfcsV7NQDRXnV2Spx0qqZf
   x39KdpSLrIaIS3oAvtaPSomEIlLk6VS4JP/sqycTpzeR6RakJC0H9na70
   Q=;
X-IronPort-RemoteIP: 104.47.66.41
X-IronPort-MID: 86069490
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8fIcOagAHegd83vQGpwiduPtX161RxEKZh0ujC45NGQN5FlHY01je
 htvCmqGb6uLMGb8ft0nOdi3oUsP7JbUzt41SQZrpCg9Ey0b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5geHzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ3ASEoVQKkntvqg6ulQ9U3qJQkd+3CadZ3VnFIlVk1DN4AaLWaGeDv2oUd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilIvluS0WDbWUoXiqcF9k0qGp
 2SA42PjBRIyP92D0zuVtHmrg4cjmAurBtpMReHprpaGhnWDm2oRTxtKVWKHiqel0k+yX/xRd
 lwtr39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOuMYoSBQw2
 1SOntevAiZg2JWKTVqN+7HSqim9URX5NkcHbC4ACA4aud/qpdhpigqVFoo6VqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTxuDA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:zjxtt6kOOFn3ZBhJgvM/fbgrwMfpDfMEiWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SETUOy1HYVr2KirGSjwEIeheOvNK1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge+VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJLqDhSC2R8acjVXhZMv63
 LMnQDV7riq96jT8G6c60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKhxRrGYuzgxgee3rHInis
 PFrRsMN9l6r1nRYma2ix3w3BSI6kdh11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtlqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bWDHAcEcYa
 xT5fPnlbFrmGChHjbkV65UsYWRt0EIb1O7q445y5SoOnZt7StEJgAjtbEidz87he4Aot9/lq
 T52+1T5c9zZ95TYqRnCOgbR8yrTmTLXBLXKWqXZU/qDacdJhv22tfKCCVc3pDURHUk9upEpH
 36aiIviUciP0b1TcGe1pxC9R7ABG27QDT208lbo5x0oKf1SrbnOTCKDAlGqbrqn9wPRsnAH/
 qjMpNfBPHuaWPoBIZSxgX7H51fM2MXXsEZsssyH1iOvsXIIIv3sfGzSoeaGJP9VTI/Hm/vCH
 oKWzb+YM1G80CwQ3f9xAPcXnv8E3aPia6Y0JKqitT75LJ9RbGk6DJl+GhRzvv7WQFqo+gxYF
 Z0Jq/hn+eyuXS2lFy4nVlUBg==
X-IronPort-AV: E=Sophos;i="5.96,209,1665460800"; 
   d="scan'208";a="86069490"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzqm7rF9W2h8b/0ephyBqwqZAy5DpW+6UKp6WFMs7gqW0HF18LX4xXoGI86300spZcOW+Uj6q7YqCpf6yS5lvmUoDwmb4qKfp89MFiAAeLLAedQIRjGhe3JyfLvOTkzNClUeL7d18l0J35fA/KMbUk6DN7HnBheYhbSgTobvTeL5S7z53e/XU+vpUO53Wq2wQ0RShPznDPAzPQzH7rYSlmCAT9PfGxT5UrxtqqtfPnw3ndmUlwklkTBg3v+OZjo6kZ+DQ3F6XbRuxx6eEDymvCZwHbG25MrHtHsH5GxI4deDE6asVnf0VGVATIAv0jSQDhJN+q4eGyVj8PZLQfq09g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUr8G0OJ3rME1PTNnZPjnOZ2rQWWRH2g/anZg+PYxNQ=;
 b=n+yD+1dJkfiAQZIrzTIi04KmZ0xaVQWT4/7QQhf/mWC5wDGO3s3Cp41GaOpwENNNi/NvMcT/ipFrHo9a2WXeE5vFgBrw2/f8obl/pN7UKBDgocYo0fHqRO28uoCloYj+l5ylp5vFHG/EnvnJei0cfjr4sml8aXef1NuT67fbxezZA9n4/SOVINQy2dREWKXnbtoEC7yeKaiA/VDw5Ob1JIXYOFdvtUYW1UQMIUJ5F4KOGkwkizAmCv9uPq8X0+06R6eyQ+oPzmoFXtsniHFQCe2fkjkTFRi8qkRh6Wlou1OoyzOA7idDtXlSKDzmOicmvjnCGxFcXsvqSxvEpKBybA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUr8G0OJ3rME1PTNnZPjnOZ2rQWWRH2g/anZg+PYxNQ=;
 b=jwNHQEmPKjxnIxOXvRQTDz37NdPplPGU56obs0WG9sugeUocAPoWnuIe/H/lu8FtIIH26k4pNX992Dx4Eb4KA5d8ISh3EU16wJ4dKP1KOJ5r6XOIIwfQQCHND02a7fWV/G/NvJa7nl7zUB3tMc0mbseEXM8NgXfBOTjYrrtbrMA=
From: Edwin Torok <edvin.torok@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH v1 2/5] tools/ocaml/libs/xc: add binding to
 xc_evtchn_status
Thread-Topic: [PATCH v1 2/5] tools/ocaml/libs/xc: add binding to
 xc_evtchn_status
Thread-Index: AQHZBOHW/H7dZ4yOzkGdiH1xKACrBq5Y590AgAAh0QA=
Date: Thu, 1 Dec 2022 13:35:17 +0000
Message-ID: <EEEF329C-788A-41A0-BDC5-9E42ED07416B@citrix.com>
References: <cover.1669829264.git.edvin.torok@citrix.com>
 <4daa8daa6398774e5cb0a90c30648c970faed6af.1669829264.git.edvin.torok@citrix.com>
 <71ff1c99-4006-dd28-e01a-4c2946798f78@citrix.com>
In-Reply-To: <71ff1c99-4006-dd28-e01a-4c2946798f78@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|MN2PR03MB5311:EE_
x-ms-office365-filtering-correlation-id: 911241e0-f65d-42b6-6d87-08dad3a0e2be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 So9z3OeQ6BhKlFZQ2zfiq/FYH7LgTGRsPSxqPMmuVXx/Z0BxYWfDib7xnxRherul0UdcivcYJUxiHone+eLat6M2+R7u+7/ls+G+9kZAr7I2gK1eETw6ZyY3jtVJAQu3BVXSaYPQrq3VdDatwuL0t6uSYO4h1JckqJ5l7Y+Fdgo8mqC3z/zB7o+Fa4H4W9yeSH5cZIKmrzFjg0y9SQtLJsitZ3pr5Thf3tPuBMVHKgEG8IafEH2sSYHDjUs9zA2T0gN2qhlDw2X/328fWhGCTYqyTPRWk13vUTXCJMQxXblcaAhA2X8qCLXXcnmIsVz/iKd9dUPL80lWJjnhbmAiQ2OkC2p4a8V8VbLUqQRobfr9A7gfEn05euXZ3ayqeIqDJIDe3MlrqaxAMY822sFCXWuyWDjBBwVWFkQIrGAuu1OmtnACAo8174hjjQchaKnBQA9qd40qo5WhirsXbIFAzup2ofvOOtt19QcHtH4pV2o49M6z28J/fe9824/jc+ZcPvLhHE/cJGKTkCnRjv1nogHUU4Fer80+l4RLF4uMml3JWh0J1OVDGDGTB1Z+qiPtcKE6X2N4byrydK6Ov6yr+J1ARpu8whUO+z8gPoJVnqc3Jldvaxhum9gSeTfrOqrCq4URLaTG3r2qExj+g4BgbUHLSG6nNz0ZbNpB6GIfBbBvS9ottcXpe05spQkCVs5V7fKMCV3N1WAGw7eGCPT6EiThV8i4xQot4PJmsFMvyzI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199015)(2906002)(5660300002)(41300700001)(6862004)(8936002)(6636002)(316002)(37006003)(66556008)(66946007)(66476007)(76116006)(36756003)(8676002)(54906003)(64756008)(66446008)(4326008)(91956017)(33656002)(71200400001)(107886003)(6486002)(478600001)(86362001)(6512007)(2616005)(66574015)(26005)(186003)(82960400001)(83380400001)(122000001)(6506007)(53546011)(38100700002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z1hoYi9oWEdGSlQzM2FOTUx4MmcrZXBmR0E1U1hadDRTVXVzSlBPY1hFR3VP?=
 =?utf-8?B?QlhHZERqUTFRcEh2YkRTcWRZQWJRQm41L21pbVNFQUx3enVmdVo0R2hob1Mx?=
 =?utf-8?B?dnFTcDRya1pGbitieVk3cXhnM2p1ZGk2eTJWd01odGQ5QmNzVHdkT3Z6RW42?=
 =?utf-8?B?dkhVdkEzTVEwUmt2cDhGTVBWaUNqUHQzM0dLMEwyVHBsTXJHTTdyMEZtV3Nz?=
 =?utf-8?B?Mk9OWEJwZFBlUUtEZ0hwUlIreFZtZVR6NFIrQjk4MU9WMWpDYkFLajdnQ3Vx?=
 =?utf-8?B?RjVUTVB0YXMwRFpWbjVUaDZCS1BaeGUyNGxzUFNReUdjN0VTY3luUnNpSjFR?=
 =?utf-8?B?V3RJWWNoQW9FYzgrZ1VtRlJObitoMzFVL1ZMZ0Fqd0tJcGJ2bzd4bFJ6WXAr?=
 =?utf-8?B?UnJlM2UwZFRhNUd4Wmg5Z1ZDNDVhTjcrVmp6Z1RTcnlYY1daUDFiTHE5eFBx?=
 =?utf-8?B?THR2SVBDVjNZc2M2OWJ3dVZDZXV3dlNaSzlNS1grOG9lSVZTRVdUdUZFVXg4?=
 =?utf-8?B?dDhJV3Y1RUZ0NzF4YkxtNmV0dmxCN0cwTkV2M3huUFVIU0M5SXdmZU8yakZn?=
 =?utf-8?B?U3Q4RWV4V0xNaEE2MG5OclJGdW9ubXFGZFE2Q2RWbFgwUHFFVTR6V1ZhL0ZU?=
 =?utf-8?B?LzNPTWU3VHFpMVRoYmlWd1htRUdpSjRpNjdUZDFJVGdqVnk3SkJjb3EycDh2?=
 =?utf-8?B?OFhXUzkvWDZ3MFYwMWRGSHNINzhFekdENFF4a1FrdDNvR0JxWVY3dlFtWEVt?=
 =?utf-8?B?KzlCTG93SjZXM3doekhOQWRtOFRHb3U2SDFaZUp3aWRKQ0lRN1lUSDFBTEx2?=
 =?utf-8?B?MzhsZEdkMmdLdlFhQytERzhzVHNnSzRkenFuL2g2UGhTN2MyWWZwS3J4eUdV?=
 =?utf-8?B?b0loM2l3UXppSlFtTGJzdWVuWXVwUnJiemRTcDlNZjc4NDVmN3lQaHVHY01x?=
 =?utf-8?B?SzBMUWFEOEU1Snp4M3Q0b2RQVkRHaXVzem9UOE04NFV3TVVrUnlqYlUxY3Vl?=
 =?utf-8?B?TmNzM2w3d3QyaDIzUi9ZYlBJL0xiYkhMSHhyTTI4SU9IQzBGWnBFblM2VDNV?=
 =?utf-8?B?d1dvb2xqM2dZRFJqM0dRMHo2eEJRSDRrcDA2OVFFTUF5RHdKOFhzNVMxQ3hJ?=
 =?utf-8?B?SWhDMkhWTVF6Zlg4SndnTDdDNHh5V0RQKzQvMTlveHY3VzFIeGhEbndYcHFY?=
 =?utf-8?B?RlNjMTdQMG9mVUVRVHg5YzdMZXdsL3lvc1VXbk9Ic0YveHlQdnV0RG01TzB0?=
 =?utf-8?B?SWpLN3NuZGJGZWg1bFlabCsrMDFjSTE1NW5tMEdWMUk4S3lWUXE2TS9SaDIz?=
 =?utf-8?B?NitkNE1Jam5ja1RGVTZzb1Zuck1NcUZjZ09EdUNOME5mb1VOenFkZFlUSDZU?=
 =?utf-8?B?VkkwQm1RbHBSRndVeldMcTVhWno5VFlYYi9vM0hFTjRib1BPeUdkWGREbDJx?=
 =?utf-8?B?Rk94QjJoTUd3U1RpendaWjNlNDRObmlBZ1dvbFl2VVMzNm50WHo0TW0vYlBX?=
 =?utf-8?B?WWNzWTJhMWxWcE5FK0JraklVV01nMjdKMlowUE9OVWVpYkl6MXVGYTRoUG5x?=
 =?utf-8?B?WmxJU3FiMEVoK2VmM1Q4Ri9PQk5zOUF2cE9SRnRFc0I0OEdPazVOejIrMEJk?=
 =?utf-8?B?bGVtTmgvTzhsdURBWmtZNk5VZkhHdmhCSTAvb004YlJsQk1Gd21RMy80OURH?=
 =?utf-8?B?NkowQzVHYmtQWGlwNUZxYnlvWndCTFRWTkUzcHJEc3F3VjFNU1dnd2pLQy8w?=
 =?utf-8?B?N0RDSUZsRG1ZRVltMVZYY2R1ZWJOMnVhTXR5R0hpUUJZLzQ4ODlUaXVkZS9q?=
 =?utf-8?B?Ny92T1N1WllyajVWM295N3UwUUovcmI3YmhnMHdQZ1ZNYUpsUXJrb3lVOTRL?=
 =?utf-8?B?eng2RVFEdkJCY2NvaDJsd3lRazUraGM4dENmVWNONkk3eVZYYjN3SS9HSWNV?=
 =?utf-8?B?VklWd0haaHU0YzNiWHR0TDR2MTd1Q3RRSkFHdHAyQkhaYkZYZ1JGZFV0T1k1?=
 =?utf-8?B?MGdZR3JYc0xiT0dNV0ZTNlBWZE91TXgyYVFGNzFKRTFpeXNGanVCVmwxTmpK?=
 =?utf-8?B?NGpSdnlYcnRwS2lzbVpTQitxaW8vMitLQ3NVTXNiazNOWGhnNld1cmhMTFhB?=
 =?utf-8?B?bTVmRVhseEdENHk0K2FYRTcyK2hPcjV2dEg3amxiclljdEZ4R3FuVG15ZWw4?=
 =?utf-8?B?WFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F1B6DDE719AB5845ACBFE3BCBEA72B26@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xMPYo1CliTh2c8K/s6lfxraxd1lHpCVEEK2KFy47LwxfgG7i6gAm64p5T5jsIk8XJE/0ZiKhKcRlfUHPFEtsDsdxypafUcLVvlBbDQyJQVNi/fvcYfqDtYovebSIk4ntExg92kzl9pquj3kmqMDrb00FKWbM5AkjhKaYjZ//8oPPpXNiEol5Zl+S8CH2o5EeOCY8n0BjTgAkzd+Dh/2Z/w8XEq5YAxD7LgwPHj7GO1R9W1vZaWyAqQB4Kzz4owAX56h71vrTRD996JMUed6OUBkUv7PnNvt2bRhm06q3nrbTYp4rNAT4uDCGYulDS1WAzAuqwNGhNDMiI134m12TJaDyhVgdFvBvSh0ztVPm1N8mSXPeVh038kSHiz7TdfyFDk4NhD8BOca10u1ZgUHLGSFYN1h16UpkJOkscMxPJoGYLBj9KDeq3I2ilPQwO76HawSviko044uHzT2ZK4iALwQ9iubsDavUCFFu5oXZJ1c6tibInIesQCIhCgVHYda2hG4vmvj9SJpwDwdw5SqROgjrvKtIIW0oeu7afrUnRw2TV9+vs6vMyIyYj1pIvqz7mXVbkeegbzSoB7dfqOjgWi90ApM8im4iTPvf1t0iZPutxtLdgR9whxa4GFy9itXgJOsWVFvCCzbIwv1fK2rTz+zWocZni48D2g2prZrnrU7Eg6J+bZ5k3t7UQ1AkRRU7c9Oz7LxGy86NDdR/QRQMHNhzea8XY1rEnKbltRU+1hZsjSVRBRc3iuLjurGdUfMYGgR8d67imPd6XXpdIU8o78+IkwJRPW7XINrn9iwFJ2ssueM+RfYTLe3qf9g6mQe4ubUjljmiurmcALaI8539RQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 911241e0-f65d-42b6-6d87-08dad3a0e2be
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 13:35:17.8549
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ENkjPWk0Rkbc1Q4zlRYuG8uik68T7rm4bl/ndtv2VlhyWtxpykFfNBQJll+GcnuMoLkA++wajEjqv6wXjLyXSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5311

DQoNCj4gT24gMSBEZWMgMjAyMiwgYXQgMTE6MzQsIEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gT24gMzAvMTEvMjAyMiAxNzozMiwgRWR3aW4g
VMO2csO2ayB3cm90ZToNCj4+IFRoZXJlIGlzIG5vIEFQSSBvciBpb2N0bCB0byBxdWVyeSBldmVu
dCBjaGFubmVsIHN0YXR1cywgaXQgaXMgb25seQ0KPj4gcHJlc2VudCBpbiB4ZW5jdHJsLmgNCj4g
DQo+IFllYWgsIHRoaXMgaXMgdmVyeSB1bmZvcnR1bmF0ZSwgYmVjYXVzZSBpdCByZWFsbHkgd2Fu
dGVkIHRvIGJlIHBhcnQgb2YNCj4gdGhlIHhlbmV2dGNobiBzdGFibGUgQVBJL0FCSS4NCj4gDQo+
PiBUaGUgQyB1bmlvbiBpcyBtYXBwZWQgdG8gYW4gT0NhbWwgdmFyaWFudCBleHBvc2luZyBqdXN0
IHRoZSB2YWx1ZSBmcm9tIHRoZQ0KPj4gY29ycmVjdCB1bmlvbiB0YWcuDQo+PiANCj4+IFF1ZXJ5
aW5nIGV2ZW50IGNoYW5uZWwgc3RhdHVzIGlzIHVzZWZ1bCB3aGVuIGFuYWx5emluZyBXaW5kb3dz
IFZNcyB0aGF0DQo+PiBtYXkgaGF2ZSByZXNldCBhbmQgY2hhbmdlZCB0aGUgeGVuc3RvcmUgZXZl
bnQgY2hhbm5lbCBwb3J0IG51bWJlciBmcm9tDQo+PiB3aGF0IGl0IGluaXRpYWxseSBnb3QgYm9v
dGVkIHdpdGguDQo+IA0KPiBUaGlzIHBhcmFncmFwaCBpcyB3aHkgd2UgbmVlZCBpdCBub3csIGJ1
dCBpdCdzIG5vdCByZWFsbHkgcmVsZXZhbnQgZm9yDQo+IHRoZSB1cHN0cmVhbSBjb21taXQuICBJ
J2QgZHJvcCB0aGlzIHNlbnRlbmNlLCBhbmQgc2ltcGx5IGhvdyB0aGUgbG93ZXINCj4gb25lIG5v
dGluZyB0aGUgc2ltaWxhcml0eSB0byBsc2V2dGNobi4NCj4gDQo+PiBUaGUgaW5mb3JtYXRpb24g
cHJvdmlkZWQgaGVyZSBpcyBzaW1pbGFyIHRvICdsc3RldnRjaG4nLCBidXQgcmF0aGVyIHRoYW4N
Cj4gDQo+ICJsc2V2dGNobiIuDQo+IA0KPj4gcGFyc2luZyBpdHMgb3V0cHV0IGl0IHF1ZXJpZXMg
dGhlIHVuZGVybHlpbmcgQVBJIGRpcmVjdGx5Lg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBFZHdp
biBUw7Zyw7ZrIDxlZHZpbi50b3Jva0BjaXRyaXguY29tPg0KPj4gLS0tDQo+PiB0b29scy9vY2Ft
bC9saWJzL3hjL3hlbmN0cmwubWwgICAgICB8IDE0ICsrKysrKysNCj4+IHRvb2xzL29jYW1sL2xp
YnMveGMveGVuY3RybC5tbGkgICAgIHwgMTUgKysrKysrKw0KPj4gdG9vbHMvb2NhbWwvbGlicy94
Yy94ZW5jdHJsX3N0dWJzLmMgfCA2NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4g
MyBmaWxlcyBjaGFuZ2VkLCA5NCBpbnNlcnRpb25zKCspDQo+PiANCj4+IGRpZmYgLS1naXQgYS90
b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWwgYi90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0
cmwubWwNCj4+IGluZGV4IDJlZDc0NTRiMTYuLmMyMWUzOTFmOTggMTAwNjQ0DQo+PiAtLS0gYS90
b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWwNCj4+ICsrKyBiL3Rvb2xzL29jYW1sL2xpYnMv
eGMveGVuY3RybC5tbA0KPj4gQEAgLTI2Nyw2ICsyNjcsMjAgQEAgZXh0ZXJuYWwgZXZ0Y2huX2Fs
bG9jX3VuYm91bmQ6IGhhbmRsZSAtPiBkb21pZCAtPiBkb21pZCAtPiBpbnQNCj4+ICAgPSAic3R1
Yl94Y19ldnRjaG5fYWxsb2NfdW5ib3VuZCINCj4+IGV4dGVybmFsIGV2dGNobl9yZXNldDogaGFu
ZGxlIC0+IGRvbWlkIC0+IHVuaXQgPSAic3R1Yl94Y19ldnRjaG5fcmVzZXQiDQo+PiANCj4+ICt0
eXBlIGV2dGNobl9pbnRlcmRvbWFpbiA9IHsgZG9tOiBkb21pZDsgcG9ydDogaW50fQ0KPiANCj4g
U3RyaWN0bHkgc3BlYWtpbmcsIHBvcnQgbmVlZHMgdG8gYmUgaW50MzIuDQo+IA0KPiBBQkktd2lz
ZSwgaXQgY2FuIGJlIGNvbmZpZ3VyZWQgYXMgbGFyZ2UgYXMgMl4zMi0yIGR1cmluZyBkb21haW4g
Y3JlYXRpb24uDQo+IA0KPiBIb3dldmVyLCBGSUZPIGN1cnJlbnRseSB0b3BzIG91dCBhdCAyXjE3
IGFuZCBoYXMgYSB0aGVvcmV0aWNhbCBtYXhpbXVtDQo+IGF0IDJeMjgsIHNvIHBlcmhhcHMgaW50
IG91Z2h0IHRvIGVub3VnaCBmb3Igbm93Lg0KPiANCj4+ICsNCj4+ICt0eXBlIGV2dGNobl9zdGF0
ID0NCj4+ICsgIHwgRVZUQ0hOU1RBVF91bmJvdW5kIG9mIGRvbWlkDQo+PiArICB8IEVWVENITlNU
QVRfaW50ZXJkb21haW4gb2YgZXZ0Y2huX2ludGVyZG9tYWluDQo+PiArICB8IEVWVENITlNUQVRf
cGlycSBvZiBpbnQNCj4+ICsgIHwgRVZUQ0hOU1RBVF92aXJxIG9mIGludA0KPiANCj4gU2ltaWxh
ciBjb21tZW50LiAgQSB2Y3B1IGlkIHNob3VsZCBpbiBwcmluY2lwbGUgYmUgaW50MzINCj4gDQo+
PiArICB8IEVWVENITlNUQVRfaXBpDQo+IA0KPiBOb3JtYWxseSB3aGVuIGhhdmluZyBhbiBlbnVt
ZXJhdGlvbiBsaWtlIHRoaXMsIHdlIHdhbnQgdG8gaG9vayB1cCB0aGUNCj4gYnVpbGQtdGltZSBB
QkkgY2hlY2suDQo+IA0KPiBCdXQgaW4gdGhpcyBjYXNlLCBpdCdzIHByb2R1Y2VkIGJ5IHRoZSBi
aW5kaW5ncyAobm90IGNvbnN1bWVkIGJ5IHRoZW0pLA0KPiBhbmQgdGhlcmUncyBhbiBleGNlcHRp
b24gcmFpc2VkIGluIHRoZSBkZWZhdWx0IGNhc2UsIHNvIEkgZG9uJ3QgdGhpbmsgd2UNCj4gbmVl
ZCB0aGUgYnVpbGQtdGltZSBBQkkgY2hlY2sgZm9yIGFueSBraW5kIG9mIHNhZmV0eSAoYW5kIHRo
ZXJlZm9yZQ0KPiBzaG91bGRuJ3QgZ28gdG8gdGhlIHJlYXNvbmFibHktaW52YXNpdmUgZWZmb3J0
IG9mIGFkZGluZyB0aGUgY2hlY2spLg0KDQpZZXMsIEkgd2FzIGxvb2tpbmcgZm9yIGhvdyB0byBh
ZGQgYW4gQUJJIGNoZWNrIHRoZXJlLCBidXQgb3RoZXIgcGxhY2VzIGxpa2UgdGhlIGZlYXR1cmVz
ZXQgZW51bSBkb2Vzbid0IGhhdmUgaXQgZWl0aGVyLg0KVGhlIEFCSSBjaGVjayBvbmx5IHNlZW1z
IHRvIGV4aXN0IGZvciB0aGUgY2FzZSB3aGVyZSB0aGUgdmFsdWVzIGFyZSB1c2VkIGFzIGJpdCBm
bGFncy4NCg0KPiANCj4+IGRpZmYgLS1naXQgYS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxf
c3R1YnMuYyBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jDQo+PiBpbmRleCBk
MzA1ODVmMjFjLi42N2YzNjQ4MzkxIDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMvb2NhbWwvbGlicy94
Yy94ZW5jdHJsX3N0dWJzLmMNCj4+ICsrKyBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9z
dHVicy5jDQo+PiBAQCAtNjQxLDYgKzY0MSw3MSBAQCBDQU1McHJpbSB2YWx1ZSBzdHViX3hjX2V2
dGNobl9yZXNldCh2YWx1ZSB4Y2gsIHZhbHVlIGRvbWlkKQ0KPj4gICAgIENBTUxyZXR1cm4oVmFs
X3VuaXQpOw0KPj4gfQ0KPj4gDQo+PiArQ0FNTHByaW0gdmFsdWUgc3R1Yl94Y19ldnRjaG5fc3Rh
dHVzKHZhbHVlIHhjaCwgdmFsdWUgZG9taWQsIHZhbHVlIHBvcnQpDQo+PiArew0KPj4gKyAgICBD
QU1McGFyYW0zKHhjaCwgZG9taWQsIHBvcnQpOw0KPj4gKyAgICBDQU1MbG9jYWw0KHJlc3VsdCwg
cmVzdWx0X3N0YXR1cywgc3RhdCwgaW50ZXJkb21haW4pOw0KPj4gKyAgICB4Y19ldnRjaG5fc3Rh
dHVzX3Qgc3RhdHVzOw0KPj4gKyAgICBpbnQgcmM7DQo+PiArDQo+PiArICAgIG1lbXNldCgmc3Rh
dHVzLCAwLCBzaXplb2Yoc3RhdHVzKSk7DQo+PiArICAgIHN0YXR1cy5kb20gPSBfRChkb21pZCk7
DQo+PiArICAgIHN0YXR1cy5wb3J0ID0gSW50X3ZhbChwb3J0KTsNCj4gDQo+IHhjX2V2dGNobl9z
dGF0dXNfdCBzdGF0dXMgPSB7DQo+ICAgICAuZG9tID0gX0QoZG9taWQpLA0KPiAgICAgLnBvcnQg
PSBJbnRfdmFsKHBvcnQpLA0KPiB9Ow0KPiANCj4gaXMgdGhlIG1hcmdpbmFsbHkgcHJlZmVycmVk
IHdheSBvZiBkb2luZyB0aGlzLiAgSXQgcmVtb3ZlcyBwb3RlbnRpYWwNCj4gaXNzdWVzIHdpdGgg
dHlwby1pbmcgdGhlIG1lbXNldCgpLg0KPiANCj4+ICsNCj4+ICsgICAgY2FtbF9lbnRlcl9ibG9j
a2luZ19zZWN0aW9uKCk7DQo+PiArICAgIHJjID0geGNfZXZ0Y2huX3N0YXR1cyhfSCh4Y2gpLCAm
c3RhdHVzKTsNCj4+ICsgICAgY2FtbF9sZWF2ZV9ibG9ja2luZ19zZWN0aW9uKCk7DQo+PiArDQo+
PiArICAgIGlmICggcmMgPCAwICkNCj4+ICsgICAgICAgIGZhaWx3aXRoX3hjKF9IKHhjaCkpOw0K
Pj4gKw0KPj4gKyAgICBpZiAoIHN0YXR1cy5zdGF0dXMgPT0gRVZUQ0hOU1RBVF9jbG9zZWQgKQ0K
Pj4gKyAgICAgICAgcmVzdWx0ID0gVmFsX25vbmU7DQo+PiArICAgIGVsc2UNCj4+ICsgICAgew0K
PiANCj4gVGhpcyBpcyBhY3R1YWxseSBvbmUgZXhhbXBsZSB3aGVyZSB1c2luZyBhIHNlY29uZCBD
QU1McmV0dXJuIHdvdWxkDQo+IHNpbXBseSB0aGluZ3Mgc3Vic3RhbnRpYWxseS4NCj4gDQo+IHN3
aXRjaCAoIHN0YXR1cy5zdGF0dXMgKQ0KPiB7DQo+IGNhc2UgRVZUQ0hOU1RBVF9jbG9zZWQ6DQo+
ICAgICBDQU1McmV0dXJuKFZhbF9ub25lKTsNCj4gDQo+IGNhc2UgRVZUQ0hOU1RBVF91bmJvdW5k
Og0KPiAgICAgLi4uDQo+IA0KPiBXb3VsZCByZW1vdmUgdGhlIG5lZWQgZm9yIHRoZSBvdXRlciBp
Zi9lbHNlLg0KDQoNCkNBTUxyZXR1cm4gaGFzIHNvbWUgbWFjcm8gbWFnaWMgdG8gZW5zdXJlIGl0
IGdldHMgcGFpcmVkIHdpdGggdGhlIHRvcGxldmVsIENBTUxwYXJhbSBjb3JyZWN0bHkgKG9uZSBv
ZiB0aGVtIG9wZW5zIGEgeyBzY29wZSBhbmQgdGhlIG90aGVyIGNsb3NlcyBpdCwgb3Igc29tZXRo
aW5nIGxpa2UgdGhhdCksDQpzbyBJJ2QgYXZvaWQgcHV0dGluZyBpdCBpbnRvIHRoZSBtaWRkbGUg
b2Ygb3RoZXIgc3ludGFjdGljIGVsZW1lbnRzLCBpdCBtaWdodCBqdXN0IGNhdXNlIHRoZSBidWls
ZCB0byBmYWlsIChlaXRoZXIgbm93IG9yIGluIHRoZSBmdXR1cmUpLg0KDQo+IA0KPiANCj4+ICsg
ICAgICAgIHN3aXRjaCAoIHN0YXR1cy5zdGF0dXMgKQ0KPj4gKyAgICAgICAgew0KPj4gKyAgICAg
ICAgY2FzZSBFVlRDSE5TVEFUX3VuYm91bmQ6DQo+PiArICAgICAgICAgICAgc3RhdCA9IGNhbWxf
YWxsb2MoMSwgMCk7IC8qIDFzdCBub24tY29uc3RhbnQgY29uc3RydWN0b3IgKi8NCj4+ICsgICAg
ICAgICAgICBTdG9yZV9maWVsZChzdGF0LCAwLCBWYWxfaW50KHN0YXR1cy51LnVuYm91bmQuZG9t
KSk7DQo+PiArICAgICAgICAgICAgYnJlYWs7DQo+PiArDQo+PiArICAgICAgICBjYXNlIEVWVENI
TlNUQVRfaW50ZXJkb21haW46DQo+PiArICAgICAgICAgICAgaW50ZXJkb21haW4gPSBjYW1sX2Fs
bG9jX3R1cGxlKDIpOw0KPj4gKyAgICAgICAgICAgIFN0b3JlX2ZpZWxkKGludGVyZG9tYWluLCAw
LCBWYWxfaW50KHN0YXR1cy51LmludGVyZG9tYWluLmRvbSkpOw0KPj4gKyAgICAgICAgICAgIFN0
b3JlX2ZpZWxkKGludGVyZG9tYWluLCAxLCBWYWxfaW50KHN0YXR1cy51LmludGVyZG9tYWluLnBv
cnQpKTsNCj4+ICsgICAgICAgICAgICBzdGF0ID0gY2FtbF9hbGxvYygxLCAxKTsgLyogIDJuZCBu
b24tY29uc3RhbnQgY29uc3RydWN0b3IgKi8NCj4+ICsgICAgICAgICAgICBTdG9yZV9maWVsZChz
dGF0LCAwLCBpbnRlcmRvbWFpbik7DQo+PiArICAgICAgICAgICAgYnJlYWs7DQo+PiArICAgICAg
ICBjYXNlIEVWVENITlNUQVRfcGlycToNCj4+ICsgICAgICAgICAgICBzdGF0ID0gY2FtbF9hbGxv
YygxLCAyKTsgLyogM3JkIG5vbi1jb25zdGFudCBjb25zdHJ1Y3RvciAqLw0KPj4gKyAgICAgICAg
ICAgIFN0b3JlX2ZpZWxkKHN0YXQsIDAsIFZhbF9pbnQoc3RhdHVzLnUucGlycSkpOw0KPj4gKyAg
ICAgICAgICAgIGJyZWFrOw0KPj4gKw0KPj4gKyAgICAgICAgY2FzZSBFVlRDSE5TVEFUX3ZpcnE6
DQo+PiArICAgICAgICAgICAgc3RhdCA9IGNhbWxfYWxsb2MoMSwgMyk7IC8qIDR0aCBub24tY29u
c3RhbnQgY29uc3RydWN0b3IgKi8NCj4+ICsgICAgICAgICAgICBTdG9yZV9maWVsZChzdGF0LCAw
LCBWYWxfaW50KHN0YXR1cy51LnZpcnEpKTsNCj4+ICsgICAgICAgICAgICBicmVhazsNCj4+ICsN
Cj4+ICsgICAgICAgIGNhc2UgRVZUQ0hOU1RBVF9pcGk6DQo+PiArICAgICAgICAgICAgc3RhdCA9
IFZhbF9pbnQoMCk7IC8qIDFzdCBjb25zdGFudCBjb25zdHJ1Y3RvciAqLw0KPj4gKyAgICAgICAg
ICAgIGJyZWFrOw0KPj4gKw0KPj4gKyAgICAgICAgZGVmYXVsdDoNCj4+ICsgICAgICAgICAgICBj
YW1sX2ZhaWx3aXRoKCJVbmtvd24gZXZ0Y2huIHN0YXR1cyIpOw0KPj4gKyAgICAgICAgfQ0KPiAN
Cj4gV2UnZCBub3JtYWxseSBoYXZlIGEgYmxhbmsgbGluZSBoZXJlLg0KPiANCj4+ICsgICAgICAg
IHJlc3VsdF9zdGF0dXMgPSBjYW1sX2FsbG9jX3R1cGxlKDIpOw0KPj4gKyAgICAgICAgU3RvcmVf
ZmllbGQocmVzdWx0X3N0YXR1cywgMCwgVmFsX2ludChzdGF0dXMudmNwdSkpOw0KPj4gKyAgICAg
ICAgU3RvcmVfZmllbGQocmVzdWx0X3N0YXR1cywgMSwgc3RhdCk7DQo+PiArDQo+PiArICAgICAg
ICAvKiBUYWdfc29tZSBhbmQgY2FtbF9hbGxvY19zb21lIGFyZSBtaXNzaW5nIGluIG9sZGVyIHZl
cnNpb25zIG9mIE9DYW1sDQo+PiArICAgICAgICAgKi8NCj4gDQo+IENhbiB3ZSBkbyB0aGUgdXN1
YWwNCj4gDQo+ICNpZm5kZWYgVGFnX3NvbWUNCj4gIyBkZWZpbmUgVGFnX3NvbWUgLi4uDQo+ICNl
bmRpZg0KPiANCj4gYXQgdGhlIHRvcCwgYW5kIHVzZSBpdCB1bmNvbmRpdGlvbmFsbHkgaGVyZT8N
Cg0KDQpZZXMgdG8gdGhlIG90aGVyIHN1Z2dlc3Rpb25zLg0KDQo+IA0KPiBjYW1sX2FsbG9jX3Nv
bWUoKSBpcyBwZXJoYXBzIGxlc3MgaW50ZXJlc3RpbmcgYXMgaXQgb25seSBhcHBlYXJlZCBpbg0K
PiBPY2FtbCA0LjEyIEFGQUlDVCwgYnV0IHdlIGNvdWxkIGFsc28gaGF2ZSBzb21lIGlmZGVmYXJ5
IGZvciB0aGF0IGF0IHRoZQ0KPiB0b3Agb2YgdGhlIGZpbGUuDQo+IA0KPiBJIGRvbid0IGtub3cg
d2hldGhlciB3ZSBoYXZlIG9wZW5jb2RlZCBvcHRpb25zIGVsc2V3aGVyZSBpbiB0aGUNCj4gYmlu
ZGluZ3MsIGJ1dCBpdCBjZXJ0YWlubHkgd291bGQgYmUgcmVkdWNlIHRoZSBhbW91bnQgb3BlbmNv
ZGluZyB0aGF0DQo+IGV4aXN0cyBmb3Igc3RhbmRhcmQgcGF0dGVybnMuDQoNCg0KcGVyaGFwcyB3
ZSBjYW4gbG9vayBpbnRvIGRvaW5nIHRoYXQgY2xlYW51cCBhcyBhIHNlcGFyYXRlIHBhdGNoLg0K
DQpCZXN0IHJlZ2FyZHMsDQotLUVkd2lu

