Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CA035704F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 17:30:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106768.204153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUA7w-0005gL-6m; Wed, 07 Apr 2021 15:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106768.204153; Wed, 07 Apr 2021 15:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUA7w-0005fq-1t; Wed, 07 Apr 2021 15:29:56 +0000
Received: by outflank-mailman (input) for mailman id 106768;
 Wed, 07 Apr 2021 15:29:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IknL=JE=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lUA7u-0005fl-6t
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 15:29:54 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.74]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b62855ac-a803-4f27-ba26-089d5f53d6c4;
 Wed, 07 Apr 2021 15:29:52 +0000 (UTC)
Received: from AM5PR0301CA0028.eurprd03.prod.outlook.com
 (2603:10a6:206:14::41) by VE1PR08MB5696.eurprd08.prod.outlook.com
 (2603:10a6:800:1ae::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Wed, 7 Apr
 2021 15:29:39 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::5f) by AM5PR0301CA0028.outlook.office365.com
 (2603:10a6:206:14::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Wed, 7 Apr 2021 15:29:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 15:29:39 +0000
Received: ("Tessian outbound 4ee49f77c636:v90");
 Wed, 07 Apr 2021 15:29:39 +0000
Received: from 476d4ea07fd6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9E77EC68-FFD0-4DEB-967B-73C9D9F300B8.1; 
 Wed, 07 Apr 2021 15:29:32 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 476d4ea07fd6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Apr 2021 15:29:32 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB2925.eurprd08.prod.outlook.com (2603:10a6:802:19::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Wed, 7 Apr
 2021 15:29:31 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.3999.032; Wed, 7 Apr 2021
 15:29:31 +0000
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
X-Inumbo-ID: b62855ac-a803-4f27-ba26-089d5f53d6c4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTcgAXVwCqNox34jIT4HgM+H69u0P79QsDwUG8MPVjE=;
 b=jEaa2gDHv9z/TMBVAUowRvX0rzRjgTPhEEw3Y9TGwoqUe624EGA6On+dmqRYKDR7B5Wvhhqbqo1toYXrjjCwkpNK0WgkZo+RXHrMbxA23wu9DLQkDvAjIA7DamEtvfFg13l8n1pOk7V38KChmLJdVX9tOZXaxouyji7S2SLFcgs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 79db823bd05d77ab
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWSANXiyIVWUca7L4eTcL3mKwuNRwZRIxy119OYgYnbBAiv5NqBzVup3gh7tC/gGdzSptunQImBdV9RD58gzPP5/QEw/PQB3geMTP1dR9dKe2qGjUKwVivnvasnJZtmtZ98661+0g/tca4C1Yfx9lvjpT8S67Ys3BEkXMbraaO0mMlPGY32enbaI0jd3OOo6kKxsUWexCsnFbQnU+cGhVy19090YECqu7feZ8Xwpk6W3rDOGdQYgU46R4NXNuZr8oTAgEbv52A+KHXJK3rBPOyFeDzWmnWAsJhZXyCP4/NJLuozi8qgfRC6gx9wsq+V9WsUJ04nQyMsXPg/AYaE2tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTcgAXVwCqNox34jIT4HgM+H69u0P79QsDwUG8MPVjE=;
 b=K1KkOkGlGMq2t7PGOz3X1CEiy9oUdxeUOK09Bu5T/9t0lPPPHBae0VGVU2ibA1wOuduUWeK/n5rh2+o9bWqGBkOWRQB6Vc6p4hPNc97ZeXGCn/lWWWZVi9HsGpPLIgDavNQBpG+lmDLB1qaUGXSeFo2tbzJ00xZh5ZZOW717EpfBgRH+2ti52Wx72x6VoD0+RhT0+sEQCqOzoPrimuKfp0G+FTZQNt7M5vS9w2tuYI8rnPCa/Q1OlybGcpkWRT+BHW5kNasPZkJrkxmubgGdpKPAZDX40gpxn1R1rCrnf3obIVi4FtcW/GZUXjWWnA4SpmPLcIRK9KkBfD6HwPHQPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTcgAXVwCqNox34jIT4HgM+H69u0P79QsDwUG8MPVjE=;
 b=jEaa2gDHv9z/TMBVAUowRvX0rzRjgTPhEEw3Y9TGwoqUe624EGA6On+dmqRYKDR7B5Wvhhqbqo1toYXrjjCwkpNK0WgkZo+RXHrMbxA23wu9DLQkDvAjIA7DamEtvfFg13l8n1pOk7V38KChmLJdVX9tOZXaxouyji7S2SLFcgs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ian Jackson <iwj@xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Chen
	<Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/3] docs/doxygen: doxygen documentation for grant_table.h
Thread-Topic: [PATCH 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
Thread-Index: AQHXKtDW6d1uIaHDNEirYTRFGCHHX6qpCgoAgAABvgCAACFYgIAAAteA
Date: Wed, 7 Apr 2021 15:29:30 +0000
Message-ID: <03084EF9-F130-41F7-9D8D-9AF86A87717F@arm.com>
References: <20210406103603.8530-1-luca.fancellu@arm.com>
 <20210406103603.8530-4-luca.fancellu@arm.com>
 <7f143615-acdf-5a97-5e07-57cab49031d6@xen.org>
 <0F20064C-418C-4A4F-9883-4452A726B038@arm.com>
 <24685.52599.234444.705703@mariner.uk.xensource.com>
In-Reply-To: <24685.52599.234444.705703@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: xenproject.org; dkim=none (message not
 signed) header.d=none;xenproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [212.20.154.75]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 0706f152-cef3-4cb9-f530-08d8f9d9f57c
x-ms-traffictypediagnostic: VI1PR08MB2925:|VE1PR08MB5696:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB56967B084EAB21B26F4457C89D759@VE1PR08MB5696.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xnuHuMGq8lhPuq6yGY7Oz1GBlhD+0s+aRni4KstbMjZrUT+dXmuXQBRYGl+nkpec3xfcMm0OBjC9mKRiQu+Gety/Xd4o+Ov0x9vckp/AI4mMxExyhexWy2i8dVDgg2nH/6m4icnDXFxCmIASrRG1GzrCfoo6KptIzPQP9BOBrt+h1b0ogWLOrQU24IBioUABGXzbGr9spVW8t6QMCFydSGotaJIc/JXfxqp5WxAMjgI4uua3h7dRWEuKs7y1EPkbTl6n7VFWrAGW253WRkkB2DLDAb5Zr4LI5ua78Xul0Zbsh4YCtWUukTJNdx4kE3NIuf4O93P79Tb57dxBVPLZdt5u3zN/Lpn+kLOj3pK50ix70TPeN4yswPNStK9hPdbuxJNhBlcwnb+ug6L16iCogl50cnkTrVsDNiETW4EGCMsLAUaacfgv13ZciDfocMulLoq248xxUZBs3+41a/1NNRbFdKGg+YJB2Brk0EardHOxlI3/Nb1bMZq98LUbfyvOHBzTLN7V9J8TlzCypP2vOIuiFF0XQHgxWWw4RrZmYzhM4VtCed7WLJWEXZOZmRCaXPXqtnBt92JPk+KpHUh3i9LuwA6JZ/+DQ1ZPvLeoZVCpnPtqlK8KVKOn2w25gKtN0W5evDigMXJAzalR3pOmOdbV7GtWGFC5wkR7S8ESSPIbOy8+09MWIaENrSDL9Sub
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(4326008)(53546011)(478600001)(4744005)(316002)(6486002)(26005)(5660300002)(86362001)(186003)(6916009)(54906003)(8676002)(71200400001)(2616005)(8936002)(83380400001)(66946007)(66446008)(64756008)(66556008)(66476007)(91956017)(76116006)(38100700001)(33656002)(36756003)(2906002)(6506007)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?bmdPRDdxbzEyNDdYZTJLZi9tVnlvUjRBeXhaYTY3VUdhZWNXQW5Pc2dPMVND?=
 =?utf-8?B?dlAwV1V6eHFrM1JRZmVuL2p0Vktrc3ZYMHErV1JCa1NRb0ppTDc2ZEpNN3JV?=
 =?utf-8?B?ZGhUQkx3YVhqWHpsMnRhaFVhQzFxelhjbEVpajRtTGZMWWRGVlVrakNCNndX?=
 =?utf-8?B?VkFuejMzaUpYOUtPbEgvaWNDbzI0SUNlenZick54SEJDMjVkVE9FbzR3T3Mw?=
 =?utf-8?B?cHlVOGxJdHpRbmhxZFdDdGUvYzZoUTFCQ1g1Z1dZSVJlWmxZSXpWRm8yckdK?=
 =?utf-8?B?ejRxNS9GTmRtbEd5Zk04YzdOQ05NZlpFYnVlRUNkek1BU09US2N3S2VCZlRU?=
 =?utf-8?B?K05wYStkVHJ1VWFuTDBSUm5kWlgra3ZBRTBzdmViNHZWNGp6YXpKN0R2UitZ?=
 =?utf-8?B?bS82bnh5eGQ0VzFKbG0zMmxhSWtmRlg4VVg5TVlTUHU0czhTdjljL3R5UHIy?=
 =?utf-8?B?M1VNbWQ3MXFxeHBOTVQ0dFhWQUEzVkxKeldvYWY0amFKdjFXdnBXcVB5Mi81?=
 =?utf-8?B?UGp3VENzOS9PL2RXUllKa0tXVUtRT0hBWC9aYVFNVTBzZFhVbHRnRUMvQU1q?=
 =?utf-8?B?d1d5K0FZTjVLZEdER0M2alJ6YVpmNEhSWUNUVGV6cTQ4ZmpOS09kaG9xMjc3?=
 =?utf-8?B?Nk56S2hoL0lYT1hwTXVOeHBvS25MZm9kWWtrWlM4S0xSeHRiY1RVdHZ4aGRo?=
 =?utf-8?B?ZHNvRk9qSDJmSjNGUmFJbG9idEt4Q3RGa3MxeVN5T2ZsME5Xc3ZIa0xGNWJ3?=
 =?utf-8?B?QU1LU1ZpQjZ0MkQ0Rm1ERGJSV1FDL2hIU1VMV0thdGM4SWU0SGgzTTN4eFlO?=
 =?utf-8?B?MUZRQmltMEtCVXlXTFU3QUNjTHVyYlRXTXBxclFZWWVQTjlka2JjNkxTSnNJ?=
 =?utf-8?B?YVBCV050dXM1aFdROVFoSHc4K1dTcU83eExTV2VDTXRhSlR0cm84Zk9mS3JV?=
 =?utf-8?B?WjFuUExDK28xRURVRUJHTjhBVkFGZ3d5cnBnL3JIMWgxTXpjSUN2RHBnR09S?=
 =?utf-8?B?WkNxa1Y2ZzNHWDBsanp5YVpwNlBRWHp6elNBM0hsUGY5SkhXa0E2Ym96OUVC?=
 =?utf-8?B?MVhuRW82Lzd0dndWSkcyWFpjTjV4dFBla09sazhpVC9sVktVQi80dWtuUnpZ?=
 =?utf-8?B?WXJObmlvTE5YWVFxZitVVFBOZFBQR0Z2K1FZNWRPQ2ZNL0tXOXpUNm0xUU4v?=
 =?utf-8?B?Lzd2TFJiTEpoMUE5akhhQkFsY1hJZW94ekpBWXJTY0wyNk5IRG54V04zR2Qx?=
 =?utf-8?B?djJkb3ZqUVQyUmh2bkppdGcvT3liNldnZFZxeURaeXpETDJ2M1c4OGVRSGJh?=
 =?utf-8?B?YmxIZVA4bjdKY09IY21mRndtVGNFZTVsaVNmYTNHaW9MY3h4VHFta3QwM0hx?=
 =?utf-8?B?dUZHQ204NEtmUXVvaXdFNG91UWpSaXBZdXFGWDdPOEZYbk5TWnZUQzUxaTF1?=
 =?utf-8?B?TkxxR3EvR2o3UHFSc0k1U29hbFRvNFN5RStCNlJ2N29vaTUza3djWXVIdyt2?=
 =?utf-8?B?NVRRRklmdDJNRWtzZGRJSlhFU21QS2xuNGYram1zWGp4LzMyWGpZZ0JqRUhF?=
 =?utf-8?B?QnVPblArT2lVemdpYVR2VjBHUDNRcGdJajVwZXNDaEJnOFBaaXE1eG1DR1ZZ?=
 =?utf-8?B?d0V0cDRuTzRkNDRENVpKMFhkMEdjWDI0SlZaeWJ2a2lGN09pd3NWVXRqcTZV?=
 =?utf-8?B?RGZVclcrMzR5YWZoWDIybFkrMFRJeW9SZHkwQWpGbDhFRnJpaEdWRVJzZUtn?=
 =?utf-8?Q?nMMecoSiJnu6y/FlW7t3ot2gtnavpWJCiEYQiwe?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F868E03A48CF8340B9BA39A85BD430E5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2925
Original-Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ec68a325-584b-4a73-0d8f-08d8f9d9f07c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6oxuA2Uo+0RG6wDmSpa/3B9F1bb1xQGfQC/O4eOgolrHPBxTJUgdY7mvAgp5LSekXMOAC/5FZ+Eb1YAd9eCihEnYzJuRnX730E+0ZSFp+nKAWB89JvwUbWd/dCRdVcgk4CZZFAFX9vndF9mfyOb1hoBkku/A9vIfiDhO6yam3RZSwe1+UqBgeBbAynz2fG/sThi7jP5b5mAwFht9hVRfCv7G3APCgew2JaJRbxmYrgb6V4f+DrnJ54Ecskdif5zUvh/wnd0ROhWRbvczlNhAsm5kpReRD3VLe4A+tIDitHmwTpbbtAd752D+OBy60Q1vih9JMg+XDwb4knKtmf9RFYrLTgMDMkrLZL6MAgqZAyO9ZvVklmSgfyaajPUNECS1vo8pD9hqVb5LZ1ImPqVYQAmDa5uy/R4hNcnRwyWpzVtcxiiv1xYL0zG/RgQL847OS5TX3YpU7C1ykUK8y2uIORsYZIfY2F8KQr3y+c2xhUjO9jl0qSDfxiklt92ZjUcsXTuJhIHPWdQQsLedxoZu8ESXN0q5u8IMX4U+ah25G+k4/PII1YHsBD9vxzjx9qAYpvk/oNKqA5sexetor/yDICn2f7ufQ2LHbEfuSRiOAdGVMI1MgLmOHhi1CfFqs9m+7nzYKlvNeZjD5Z4KUa+UXARN9tizuB5pVjwynG5r1Tk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(36840700001)(46966006)(2616005)(47076005)(6506007)(82310400003)(6512007)(356005)(8676002)(336012)(82740400003)(53546011)(70206006)(86362001)(36860700001)(8936002)(81166007)(54906003)(6862004)(33656002)(478600001)(316002)(186003)(5660300002)(83380400001)(26005)(2906002)(36756003)(6486002)(4744005)(70586007)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 15:29:39.4192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0706f152-cef3-4cb9-f530-08d8f9d9f57c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5696

SGkgSWFuLA0KDQo+IE9uIDcgQXByIDIwMjEsIGF0IDE2OjE5LCBJYW4gSmFja3NvbiA8aXdqQHhl
bnByb2plY3Qub3JnPiB3cm90ZToNCj4gDQo+IEx1Y2EgRmFuY2VsbHUgd3JpdGVzICgiUmU6IFtQ
QVRDSCAzLzNdIGRvY3MvZG94eWdlbjogZG94eWdlbiBkb2N1bWVudGF0aW9uIGZvciBncmFudF90
YWJsZS5oIik6DQo+PiBUaGUgcHJvYmxlbSBpcyB0aGF0IERveHlnZW4gY2Fu4oCZdCBnZW5lcmF0
ZSBwcm9wZXIgZG9jdW1lbnRhdGlvbiBmb3IgYW5vbnltb3VzIHVuaW9uL3N0cnVjdHVyZSwgaXQg
ZW5kcyB1cCB3aXRoIHdhcm5pbmcgYW5kL29yIHByb2R1Y2luZyB3cm9uZyBkb2N1bWVudGF0aW9u
IGxpa2UNCj4+IGNoYW5naW5nIG5hbWVzIG9yIGdpdmluZyBmaWVsZCBkZXNjcmlwdGlvbiB0byB0
aGUgd3JvbmcgZmllbGQuDQo+IA0KPiBUaGlzIGRvZXMgbm90IHNlZW0gbGlrZSBpdCB3b3VsZCBi
ZSBhbiBpbXBvc3NpYmx5IGhhcmQgZmVhdHVyZSB0byBhZGQNCj4gdG8gZG94eWdlbi4NCg0KTW9k
aWZ5aW5nIGRveHlnZW4gaXMgbm90IHJlYWxseSBpbiBvdXIgcGxhbm5lZCBlZmZvcnRzIGFuZCBp
ZiBzb21lb25lIGRvZXMgaXQgdGhhdCB3b3VsZCBwdXQgYW4gaGFyZCBjb25zdHJhaW50IG9uIHRo
ZSB2ZXJzaW9uIG9mIGRveHlnZW4gcG9zc2libGUgdG8gdXNlLg0KDQpCdXQgaXMgYWRkaW5nIG5h
bWVzIHRvIGFub255bW91cyBlbGVtZW50cyByZWFsbHkgYW4gaXNzdWUgaGVyZSA/DQoNCklmIHdl
IGFncmVlIG9uIG5hbWVzIG9yIG9uIGEgY29udmVudGlvbiBmb3IgbmFtZSB0aGUgcmVzdWx0IHdp
bGwgbm90IGltcGFjdCB0aGUgY29kZSBvciBiYWNrd2FyZCBjb21wYXRpYmlsaXR5Lg0KDQpSZWdh
cmRzDQpCZXJ0cmFuZA0KDQo+IA0KPiBJYW4uDQoNCg==

