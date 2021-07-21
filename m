Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 696783D088C
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 07:54:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159136.292748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m65Ay-00087S-Vg; Wed, 21 Jul 2021 05:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159136.292748; Wed, 21 Jul 2021 05:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m65Ay-00085P-RM; Wed, 21 Jul 2021 05:53:48 +0000
Received: by outflank-mailman (input) for mailman id 159136;
 Wed, 21 Jul 2021 05:53:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KCq8=MN=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m65Aw-00085J-Um
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 05:53:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::60b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 511f6bca-b20b-4612-9959-f31a7cbd5c6a;
 Wed, 21 Jul 2021 05:53:43 +0000 (UTC)
Received: from AM6PR04CA0060.eurprd04.prod.outlook.com (2603:10a6:20b:f0::37)
 by AM6PR08MB4312.eurprd08.prod.outlook.com (2603:10a6:20b:72::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.28; Wed, 21 Jul
 2021 05:53:41 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::4f) by AM6PR04CA0060.outlook.office365.com
 (2603:10a6:20b:f0::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Wed, 21 Jul 2021 05:53:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 05:53:40 +0000
Received: ("Tessian outbound bbfc4df8f27e:v99");
 Wed, 21 Jul 2021 05:53:40 +0000
Received: from 24603811279c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7CBD3BB7-0372-4DB5-959C-6BF47FF88579.1; 
 Wed, 21 Jul 2021 05:53:30 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 24603811279c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 21 Jul 2021 05:53:30 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB3424.eurprd08.prod.outlook.com (2603:10a6:803:88::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Wed, 21 Jul
 2021 05:53:27 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918%7]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 05:53:27 +0000
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
X-Inumbo-ID: 511f6bca-b20b-4612-9959-f31a7cbd5c6a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKjrWnnq0+FT8D3CJXFMEELjQLo2C9Kprahat8OVowI=;
 b=poECFF2aMuBI2xavmvOWo1W0oXeEkxhPaXTTd05Jxi9hkybw2AaGl9ktHoUaTZqq4L0rI6vD6ND2m4I4pHKQJoWeMoR46Ep8fxN9uIcXeBtgXVEqE+Y5sE5gwaehD/uwInf0DPEgHAxp89KvU/FiidFzC/39q4i9nj7hsBs2Ldo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hy+YnjjxAwH54kBqFmIfJX07GVS9RelTFFvgUgjRucDIqti4n1PjjUK7q9T2SwUk85w+dlp2xZEblOGu/9TyOqqAbaiAtwvsDzZW3CCY1p2Q0VoU0p7BcxTQdXstUrom2vhMy2h1SWFgjRVHxP7arNMFEt8XMBHfP7pKsrSr1BCHwM33acYVqqPux/Isbdsfcib2C4kmjDWz21D48+s/vUTa1vxuzzqW30P13CSl+78RZY9vHczFRnZRcl2K00XjfoNHONmFrA1MwetGvtvJ3JM3Lj6RPQrcPqYtPh/ucn3P7U7l5Taw8l6PoicifZlcLk6TbAK21sfaYiVHS+VNXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKjrWnnq0+FT8D3CJXFMEELjQLo2C9Kprahat8OVowI=;
 b=PnyU/u/16s0wB4tqm+wnQwMnjxKRppFvmD/sOPf/poloskcEGLvRPHSwWnvNnPF3+H1VlvUyEcE63ibIYCOQemHpex32C8nAst3lclmXIutlRlWV9ZoDuINJF/D/s+ApdGAIcQxNrhh35evJV29C0yyK39i2gCzSZ9XN9zYyg8qhlp02ipyrVmWRMavual/KytTg7mz5iHVUvMyYLac4bW5+kxk2Vl2n4dcR+46ihrymw90sz35UDrWYvyZ5vTJRxE0RSYIT7v1CbHKivP4KTNKbpP54ldYmxgRjIs+98AK8QiwjKa/qy1pfGAjBia6PlMihgfYyljV9Y/KjTGw8Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKjrWnnq0+FT8D3CJXFMEELjQLo2C9Kprahat8OVowI=;
 b=poECFF2aMuBI2xavmvOWo1W0oXeEkxhPaXTTd05Jxi9hkybw2AaGl9ktHoUaTZqq4L0rI6vD6ND2m4I4pHKQJoWeMoR46Ep8fxN9uIcXeBtgXVEqE+Y5sE5gwaehD/uwInf0DPEgHAxp89KvU/FiidFzC/39q4i9nj7hsBs2Ldo=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
Subject: RE: [PATCH V3 07/10] xen: re-define assign_pages and introduce
 assign_page
Thread-Topic: [PATCH V3 07/10] xen: re-define assign_pages and introduce
 assign_page
Thread-Index: AQHXeTjssWFc0WhZV0Sk9HnWQhMRratKAUqAgALtfsA=
Date: Wed, 21 Jul 2021 05:53:26 +0000
Message-ID:
 <VE1PR08MB5215A9CC9C882353FAB0C717F7E39@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210715051819.3073628-1-penny.zheng@arm.com>
 <20210715051819.3073628-8-penny.zheng@arm.com>
 <b2ece197-a9fe-71bc-2480-ea1db83acaee@suse.com>
In-Reply-To: <b2ece197-a9fe-71bc-2480-ea1db83acaee@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: FF3AFEA485DA6C47BA43913485913E0E.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 51a0fb8c-061b-47f9-194b-08d94c0be441
x-ms-traffictypediagnostic: VI1PR08MB3424:|AM6PR08MB4312:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB43121EE4D16FFD1F237EC4FEF7E39@AM6PR08MB4312.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4nqrVTZsY2Mvx9W4xI8GU2oU4DP+y16JJJ1/BvKkXiBEjJRIsMt3ri1TTchZSU/Yw70ZiFKAvqaTXRSyDtfxfWPk5p3gNFtFKZgn9ou6Jws/4A4+NUMCF8Vs3qf51lG06MB52zb2cHpcu03BYSQcRDT8y9PvFE06wRz70xpyR9W+gRk0vKquKRcsnnkUIbqX/7x6kKbDT/B2Jcir/elS131oIbGn4jv8zX6hgzMfxGaEvFKr7p/L5w+6qQeXTzqtBZT/T1u78qb8Kd+KvKbEwQr2bX1i5ByHuPFz+y2scIfYE/RUhMwuQjcM3bW+yrbP4m+ZnYTMpmwhhHoWIxjKl/Fjv/4Qsn8MFKD+9AX1e2aIGLqQ0XKwZjgl4GFoLIK2n0x92FfJT+zhUymWycRYkhuecwxLiRnBo8Sy1WpiX1uX55QpDFFa91+LT+UB5YHQpVTyXF7Q9l0G101m5J5Cm1TlNmLD4xSedS9I6opUwjmBWAPTckAm9G6d8cbqw8OxHEcqSPZzH+RZlOzdiwiPg4ARFcoYaejr4sOxKS3y0R0xPqZ9a3tLmH7J6aiO6hQ6YjQn5i0Ld1imkUBUfM9hHPXSUyFoHPviSC782RGab25SJ7n+vcbVqc+lDA/mqv/Ffog93kaWFwPi6bXnmES7ya7wswRxud5uxPoTZV13DCUqRfcFfpPRzsvBs+HgrK8ql3j9v6uzYOHn7YblIwKg0Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(376002)(136003)(366004)(346002)(86362001)(55016002)(6506007)(7696005)(122000001)(38100700002)(316002)(5660300002)(53546011)(9686003)(4326008)(33656002)(110136005)(478600001)(54906003)(64756008)(66476007)(66556008)(186003)(8936002)(26005)(66946007)(76116006)(83380400001)(8676002)(66446008)(52536014)(2906002)(71200400001)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K0RwWHpHbCtvSHRBUkdrdHJ3QUowcmtVOGhkaUVWRjZheHRURkJHMTAyV01w?=
 =?utf-8?B?MG53SnFTcWFTbkNrQWRkdmRsaUU3SWYvTlkrN0g1QXZKQmsyWi9rS2gyYkc1?=
 =?utf-8?B?dXFMYjZDNlJrWTNSU2ZBMVJGNGFpdVNKRkZRcTlGZkw0Y3RWdTUxUUxTZmZp?=
 =?utf-8?B?YjVxMWxQblhuSGNxbFIzZjVtcDNVazJiMlJVOEtOeTlkOUJxem1sSHdsSERQ?=
 =?utf-8?B?KytSSHlSeUNiOFNUblpGYTJWalJ2Wk8yeUk0c1V4a01tM0xXMDhxWmlYL2I0?=
 =?utf-8?B?TlRzTzlQZlY3Q0lPdkpPeTcvb0NWSEtEZWpGNFBrcnFPUi9Rd3A2TlpvZGVp?=
 =?utf-8?B?Q2pQNXljOXJlSHZEZTI1RUc1RkRJVFlqdDRLeks2TWlCQ3NqWjlJalkwdXJR?=
 =?utf-8?B?UzZ0dlB0cklrcGhMVkhaQXkwRVo0TERLZVhuQjU4cFZuY3lGSExDUmtQUlFp?=
 =?utf-8?B?Vk9ySURKcWlqSzVZblliRFQ0dHI0ZnBRbHI1bWdWYWRnY082RWRxbEZRTzNH?=
 =?utf-8?B?WW1hdFlzbnQxVzB2Q1hDeVU1dk4zd0t6MTJJdDVNZ1RWTWpsN09TVWU2VTR3?=
 =?utf-8?B?bmpaUmNuczR3WVcwVUkvMGpUK3RCV1RqYUJ2U1pJdlRuMWlPQTBHYXovaG9j?=
 =?utf-8?B?VTJjLzY0a01mVW9IRThzU2NDZER4RGVqRTBsWDJzRXZIU05UYzNQT0ZWRmNs?=
 =?utf-8?B?dnBlZkhJZzRpT203eGhiZ25EZ2VDYmhPY1lsS2FLQTE5dWRFTmxyWkxhZTAw?=
 =?utf-8?B?RlF4cG45NVpvOTN2bnpLTUROZVdEQkY2RytuMFFndXAyellsdkJubXZtamZm?=
 =?utf-8?B?ajhPQkVhR2tEUUpQZE9ic09tZEhOTEtiVStzcTJwdU81dWp5a0lkY3lyYzhw?=
 =?utf-8?B?N0poUFV1aFJDMFljT2RGT3FQOGRKaWhER1B1RGlIVVFLVUdkK1dBZVY5RFpZ?=
 =?utf-8?B?TWFzM1lhT29Ec3lFZEhZYzN0SnpQUVJka25TUC9TNTgzK2Y1cXJEaVFCdGV6?=
 =?utf-8?B?NGNxbmRjNEZ6NWJydHlMemNLSFE1YUdMTUhCYVlIMEsxNXNEcEhmZWFUSDVV?=
 =?utf-8?B?V3lBb0F3c3NTdW5FNXhWY3cxYWNId3JUY1BUTVNRUUozUnJKbHRHQkw2NVhr?=
 =?utf-8?B?SGNqU3dkQ0xEQmd4R0c4ZXZDUGZKcFhLVkhNQUU2ajJrL21Hdm8xTkZ2eWtr?=
 =?utf-8?B?WXJlWlZ0YXhHWDg0dUJqMjJOdXFvNmlWZGhEaVMyVGVBY1FqZmxhUTEzUXI0?=
 =?utf-8?B?UFlYUVNzTGt5RklrYWs0V09ZNUZhdWhSc2grSS9VQ013L3RvNmg1VytUUDFx?=
 =?utf-8?B?dXRRcFgwSmhhSFE5amUxWk1BdmVha1VndXVmV09FK2RrWEpQdnZzRTVYMWRI?=
 =?utf-8?B?em0zaVFGWFNqbHR6L1N2aWliQ1p1QTRtb0pNdUlMNUtMenZXNTRsbWRjRjRx?=
 =?utf-8?B?VVZFOXU0ajhTcUNEZkZmMFFPYm5XZGFsdEZxT2RudFlidis1UDFHcitDVkRw?=
 =?utf-8?B?NzZYRE9IK3RVNDFnY1JKRnJ3aHZHWFNjN1I2UnhqK3lxcUU2dEQ5OG5FYWZs?=
 =?utf-8?B?ZGNJblo0NDdnanljRSs3ZmtCKzVCWWZRRzNPMnRCaVhleU4wVnErbXZCMDRw?=
 =?utf-8?B?M3QwVjBuZm5ZeEk2VW13WUY0VjZtN3MvdzkrWGxyZjVZbjBFdHpCeDhNN3Jp?=
 =?utf-8?B?UVRGaytyN1R1SWhvUWJLT29VTGJEK2xxcG1zcEJ3OUNXeDZjN0VBNU55OWpE?=
 =?utf-8?Q?MMfq1BvG9JjoDD+qQOuO09wUE4WKMpEqY2Rzk9T?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3424
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	42b2c246-d845-457b-7835-08d94c0bdc1d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JwxE9m9Qgn5Q/Og/2GXfZf4bJ0Ckg9ZcV5Clw9xter7MgVRhXKJFZHwN+dlb2lM0G5e0U67RBOonsQH/vh2LUG4CaW/uLUnJKRkk/fSq0TfMz/XtalasrYWanYEoEBVyJHRy36Jz+xTbY8LP1YONYZO8XfS8bMekr1nNK8w7p7JvCLuKWZEkjckHxyi8etJzpX+LErtNN9657IcEDhKTgp2Ec+TYZMGQg4g2RMytTkpIB3YdeETbFPEMYpJ1NqvOBrjJ7vukTnekkTBEd0CPEumDeKentgFBKyZHxoZAtREd3cNEitYFRAJGAnmP+xbR4gTTis3cZpY4xvtBVEUWqRiJ1EzfijlKaSClRNvQjvqG4RYBV5JfXtfz5A6zFFcepe44hGAnf/01tld+0WlsRq+iVE3evSWix3Cc+lAruEba7bFSTjYkMc4a8Y7XAanklt6M8+/x65BCF2dB3ZQ5zWWeH0mYN1fLLHbW90dDNQ4K0eGprnfdAdZqzfykOv6uhC2WvHR7KcL8pKMUSjjJFsv+50dbQgvPLW559JU7TaVMDxeudbGlji7mrmkBO9NKvqXH/VmOA7/jyD7qdWT431snUDsjrEEJwFIynHsvHKM6y7sJ6PmahdA/1f4OMuORtio2ZoriZu/1XJqgYHRqCjLtrBcV9603QPNLQ46qGo0fjBJqC8s5CvrCksqub92zkAdF4vMtpzCIfwLkka2OaQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(346002)(376002)(36840700001)(46966006)(81166007)(8676002)(82740400003)(53546011)(26005)(107886003)(5660300002)(36860700001)(4326008)(356005)(70206006)(9686003)(86362001)(55016002)(47076005)(336012)(6506007)(70586007)(82310400003)(316002)(2906002)(83380400001)(110136005)(33656002)(54906003)(478600001)(186003)(52536014)(7696005)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 05:53:40.6884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a0fb8c-061b-47f9-194b-08d94c0be441
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4312

SGkgSmFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBNb25kYXksIEp1bHkgMTksIDIwMjEgNDo0
MSBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyBqdWxpZW5AeGVu
Lm9yZw0KPiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsg
V2VpIENoZW4NCj4gPFdlaS5DaGVuQGFybS5jb20+OyBuZCA8bmRAYXJtLmNvbT47IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsNCj4gc3N0YWJlbGxpbmlAa2VybmVsLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIFYzIDA3LzEwXSB4ZW46IHJlLWRlZmluZSBhc3NpZ25fcGFnZXMgYW5k
IGludHJvZHVjZQ0KPiBhc3NpZ25fcGFnZQ0KPiANCj4gT24gMTUuMDcuMjAyMSAwNzoxOCwgUGVu
bnkgWmhlbmcgd3JvdGU6DQo+ID4gSW4gb3JkZXIgdG8gZGVhbCB3aXRoIHRoZSB0cm91YmxlIG9m
IGNvdW50LXRvLW9yZGVyIGNvbnZlcnNpb24gd2hlbg0KPiA+IHBhZ2UgbnVtYmVyIGlzIG5vdCBp
biBhIHBvd2VyLW9mLXR3bywgdGhpcyBjb21taXQgcmUtZGVmaW5lDQo+ID4gYXNzaWduX3BhZ2Vz
IGZvciBuciBwYWdlcyBhbmQgYXNzaWduX3BhZ2UgZm9yIG9yaWdpbmFsIHBhZ2Ugd2l0aCBhIHNp
bmdsZQ0KPiBvcmRlci4NCj4gPg0KPiA+IEJhY2twb3J0aW5nIGNvbmZ1c2lvbiBjb3VsZCBiZSBo
ZWxwZWQgYnkgYWx0ZXJpbmcgdGhlIG9yZGVyIG9mDQo+ID4gYXNzaWduX3BhZ2VzIHBhcmFtZXRl
cnMsIHN1Y2ggdGhhdCB0aGUgY29tcGlsZXIgd291bGQgcG9pbnQgb3V0IHRoYXQNCj4gPiBhZGp1
c3RtZW50cyBhdCBjYWxsIHNpdGVzIGFyZSBuZWVkZWQuDQo+IA0KPiBCYWNrIG9uIHRoZSBpbml0
aWFsIGZvcm0gb2YgdGhpcyBwYXRjaCBKdWxpZW4gc2FpZDoNCj4gDQo+ICJIb3dldmVyLCBJIHRo
aW5rIEkgd291bGQgcHJlZmVyIGlmIHdlIGludHJvZHVjZSBhIG5ldyBpbnRlcmZhY2UgKG1heWJl
DQo+ICBhc3NpZ25fcGFnZXNfbnIoKSkgcmF0aGVyIHRoYW4gY2hhbmdlIHRoZSBtZWFuaW5nIG9m
IHRoZSBmaWVsZC4gVGhpcyBpcyAgZm9yIHR3bw0KPiByZWFzb25zOg0KPiAgICAgMSkgV2UgbGlt
aXQgdGhlIHJpc2sgdG8gbWFrZSBtaXN0YWtlIHdoZW4gYmFja3BvcnRpbmcgYSBwYXRjaCB0b3Vj
aA0KPiBhc3NpZ25fcGFnZXMoKS4NCj4gICAgIDIpIEFkZGluZyAoMVVMIDw8IG9yZGVyKSBmb3Ig
cHJldHR5IG11Y2ggYWxsIHRoZSBjYWxsZXIgaXMgbm90IG5pY2UuIg0KPiANCj4gMSkgaXMgdGFr
ZW4gY2FyZSBvZiBoZXJlIGFueXdheSAoYWxiZWl0IHNlZSB0aGUgcmVtYXJrIGJlbG93KSwgYW5k
IG9mIHRoZQ0KPiBjYWxsZXJzIG9ubHkgc29tZSB3b3VsZCByZWFsbHkgbmVlZCAiMVVMIDw8IiBh
ZGRlZCAob3RoZXJzIGNvdWxkIHNpbXBseQ0KPiBjb252ZXJ0IHRoZWlyIGxpdGVyYWwgMCB0byBs
aXRlcmFsIDEpLiBKdWxpZW4gLSBkbyB5b3Ugc3RpbGwgdGhpbmsgMikgaXMgcHJldHR5DQo+IGlt
cG9ydGFudCB0byBhdm9pZCBhdCB0aGUsIG92ZXJhbGwsIDIgcGxhY2VzIHRoYXQgd291bGQgYmUg
bGVmdD8NCj4gDQo+ID4gLS0tIGEveGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYw0KPiA+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMNCj4gPiBAQCAtNTU2LDcgKzU1Niw3IEBA
IGludCBfX2luaXQgZG9tMF9jb25zdHJ1Y3RfcHYoc3RydWN0IGRvbWFpbiAqZCwNCj4gPiAgICAg
ICAgICBlbHNlDQo+ID4gICAgICAgICAgew0KPiA+ICAgICAgICAgICAgICB3aGlsZSAoIGNvdW50
LS0gKQ0KPiA+IC0gICAgICAgICAgICAgICAgaWYgKCBhc3NpZ25fcGFnZXMoZCwgbWZuX3RvX3Bh
Z2UoX21mbihtZm4rKykpLCAwLCAwKSApDQo+ID4gKyAgICAgICAgICAgICAgICBpZiAoIGFzc2ln
bl9wYWdlKGQsIG1mbl90b19wYWdlKF9tZm4obWZuKyspKSwgMCwgMCkgKQ0KPiANCj4gSSB0aGlu
ayBpbiBhbGwgY2FzZXMgd2hlcmUgb3JkZXItMCBwYWdlcyBnZXQgcGFzc2VkLCB5b3UnZCByYXRo
ZXIgd2FudCB0byBjYWxsDQo+IGFzc2lnbl9wYWdlcygpIGRpcmVjdGx5IChpZiwgYXMgcGVyIGFi
b3ZlLCB3ZSdsbCBrZWVwIGJvdGggZnVuY3Rpb25zIGluIHRoZSBmaXJzdA0KPiBwbGFjZSkuDQo+
IA0KDQpTdXJlLiAgSSdsbCB1c2UgbGl0ZXJhbCAxLCBpdCdzIG1vcmUgcmVhc29uYWJsZSB0byBt
ZSBhbHNvLg0KDQo+ID4gLS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMNCj4gPiArKysgYi94
ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYw0KPiA+IEBAIC0yMjgzLDggKzIyODMsOCBAQCB2b2lkIGlu
aXRfZG9taGVhcF9wYWdlcyhwYWRkcl90IHBzLCBwYWRkcl90IHBlKQ0KPiA+DQo+ID4gIGludCBh
c3NpZ25fcGFnZXMoDQo+ID4gICAgICBzdHJ1Y3QgZG9tYWluICpkLA0KPiA+ICsgICAgdW5zaWdu
ZWQgbG9uZyBuciwNCj4gPiAgICAgIHN0cnVjdCBwYWdlX2luZm8gKnBnLA0KPiA+IC0gICAgdW5z
aWduZWQgaW50IG9yZGVyLA0KPiA+ICAgICAgdW5zaWduZWQgaW50IG1lbWZsYWdzKQ0KPiA+ICB7
DQo+IA0KPiBJJ20gYWZyYWlkIEkgY29uc2lkZXIgcHV0dGluZyAibnIiIGFoZWFkIG9mICJwZyIg
dW51c3VhbCAoY29uc2lkZXJpbmcgdGhlIHJlc3Qgb2YNCj4gb3VyIGNvZGUgYmFzZSkuIEhvdyBh
Ym91dA0KPiANCg0KPiBpbnQgYXNzaWduX3BhZ2VzKA0KPiAgICAgc3RydWN0IHBhZ2VfaW5mbyAq
cGcsDQo+ICAgICB1bnNpZ25lZCBsb25nIG5yLA0KPiAgICAgc3RydWN0IGRvbWFpbiAqZCwNCj4g
ICAgIHVuc2lnbmVkIGludCBtZW1mbGFncykNCj4gew0KPiANCj4gPw0KPiANCg0KU3VyZS4gVGh4
IGZvciByZWNvbnN0cnVjdGluZy4NCg0KPiA+IEBAIC0yMzU0LDYgKzIzNTQsMTEgQEAgaW50IGFz
c2lnbl9wYWdlcygNCj4gPiAgICAgIHJldHVybiByYzsNCj4gPiAgfQ0KPiA+DQo+ID4gK2ludCBh
c3NpZ25fcGFnZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcGFnZV9pbmZvICpwZywgdW5zaWdu
ZWQgaW50IG9yZGVyLA0KPiA+ICsgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG1lbWZsYWdz
KSB7DQo+ID4gKyAgICByZXR1cm4gYXNzaWduX3BhZ2VzKGQsICgxVUwgPDwgb3JkZXIpLCBwZywg
bWVtZmxhZ3MpOw0KPiANCj4gTWF5IEkgYXNrIHRoYXQgeW91IG9taXQgdGhlIHVubmVjZXNzYXJ5
IHBhcmVudGhlc2VzPw0KPiANCg0KT2gsIHNvcnJ5LiBJJ2xsIHJlbW92ZSBpdCwgbG9vcHkgaGVh
ZCBzb21ldGltZXMuLi4NCg0KPiBKYW4NCg0KQ2hlZXJzDQpQZW5ueQ0KDQo=

