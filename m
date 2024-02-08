Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9892384E441
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 16:47:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678290.1055393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY6bq-000323-Mc; Thu, 08 Feb 2024 15:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678290.1055393; Thu, 08 Feb 2024 15:46:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY6bq-000306-Jk; Thu, 08 Feb 2024 15:46:42 +0000
Received: by outflank-mailman (input) for mailman id 678290;
 Thu, 08 Feb 2024 15:46:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/4LT=JR=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rY6bp-000300-Mb
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 15:46:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2611::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e85d4da-c699-11ee-8a4a-1f161083a0e0;
 Thu, 08 Feb 2024 16:46:39 +0100 (CET)
Received: from AS9P250CA0021.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::19)
 by PAVPR08MB8821.eurprd08.prod.outlook.com (2603:10a6:102:2fc::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.24; Thu, 8 Feb
 2024 15:46:35 +0000
Received: from AMS0EPF0000019E.eurprd05.prod.outlook.com
 (2603:10a6:20b:532:cafe::2a) by AS9P250CA0021.outlook.office365.com
 (2603:10a6:20b:532::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.41 via Frontend
 Transport; Thu, 8 Feb 2024 15:46:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019E.mail.protection.outlook.com (10.167.16.250) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Thu, 8 Feb 2024 15:46:35 +0000
Received: ("Tessian outbound a064b9944658:v228");
 Thu, 08 Feb 2024 15:46:35 +0000
Received: from 5a5bff2f51c2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 420708D1-174A-4415-965C-B9F6B18E3072.1; 
 Thu, 08 Feb 2024 15:46:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5a5bff2f51c2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Feb 2024 15:46:28 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB9955.eurprd08.prod.outlook.com (2603:10a6:20b:639::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.37; Thu, 8 Feb
 2024 15:46:27 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::99ee:f28d:84bc:97cb]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::99ee:f28d:84bc:97cb%7]) with mapi id 15.20.7270.024; Thu, 8 Feb 2024
 15:46:27 +0000
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
X-Inumbo-ID: 3e85d4da-c699-11ee-8a4a-1f161083a0e0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=T9LhVzujfGoS9ln9vKlaGwPJZeYtlEPkuFFuRJXAXURo+Zc/qPye/Ptm2MowMTFsRxfvHtkB1R1wAc9HRqblO0pl+4JO9NufGw6I/jgoKfDENU6vsZDSloSGcUmYiPXKEYjs/iFkHQb2gJJLQC/gHH0ARtZvcxScfmsbb0lzwplVLLw/loOrU169Ssvmfkamw+Na8tRPeZbCRYtb0XIr+zmV5SzAuj6/hrDxt7wr65R9KSU4IvIq8QK5fMHZmSVdAfR/bKAlf9kSPrj1XvzWnw2Bl5HxBq9IgDgeIPT7ldwVz01mD6Be0Law3B2i6dJZeI3scOKmqtZ4a/0TKuwXcA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lO6Y5pvQLyttuGrsUemOR6FlRAT4hv6Onm3HApcA1A0=;
 b=El9edqR9FmFZWz5wf2zUHPLrKUCqTRMGgbQJGzavVDR2l4sMa7nr/6oNOBup0Zimkq5u8BqvRlSkD0bQH5kPxD7ekWOmTQ3J3Wh2EZiGRs5I+0WPvOw+9f1ZzKCihvV7T65xLl697Zpg3TMaKWe3u7dvIJvsH/q8ZPu+gWfb3IBPTH3+eBhKXZmOP/zW9JxIcsS1VczvA5s1lkm1Hkw2bCg+0JqI44fUJdb+EIxqyb1/UVTSKgo52E98eUz4bx63XcxWkgWLCd+ngjyjdUJ6Xo1+mN2V3XJan68EfcmulIcszub6eNEJA0dOSlo7eGGjNbYK12TY6w3ZZ4jpTN90+w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lO6Y5pvQLyttuGrsUemOR6FlRAT4hv6Onm3HApcA1A0=;
 b=YruQUpTIC4pXaEq7UtqKnqNE85F5JNrhTV34VkvRoxNf7sheiAgp33XW8hKdCpHvUG4QWMZ0T0UF/xAPRlQGSF4+2ZUklJMb1b9xZUj4UPgCEnB6fTOU0Lt9WDUjaoWF9/mINpnNb6AoxmqqLLUsp1W14gAak9LYGSn6rFS0tg4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 742a23b4b9cd856b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MV0m1tItlbt30wn1YWPgzpwZMJo9tr2W3kpW45mBIoCB3p44aMoc3tliMhCiCIzR0tsHTMXfK+s4lPiQAJOBWBSDuEyilVm816IfCor9myj3ccryIlY3ZFZcibJUuMGBfHBs90ifF5W48U/REGKhw2VpfxzNoFEK937Yz0sJ9MxAFt/gwKxHntxSy5Fpp7iB/sVe/vyGt3RMYxpfRuHRGnv54XRxdTDokcHJKc/CbunOwzAjNfNOZ1WIvBeDB04JRpXeCoYCCDQs9pRFt4VLkNe2t0LQBiJJfrefenuGfBK+85wQ/Gkz+0KBzjXQYjFrnM+pryJ6+ALn4f1Up+tqzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lO6Y5pvQLyttuGrsUemOR6FlRAT4hv6Onm3HApcA1A0=;
 b=nNEVzUMzK6JZUReeQxpkeixeJYJgAhr/npz40xJH/zUGA9d/6ZCjP+aeO5yu4U7vzQCacYa8AYbbuu1rsa/vxfqK4eSs7ymNk1xBrBzcdXppfLTnUIRVSgLhb2MlGS+B/RIAsSqxxPLEs3/VN/RECOhMcPi72Yv3JzlWdy/w0SwuCyi9AgE3GBLitEGO0dcXWxfAmb57dctAzreGryJl0q32roh+JU1je21U212JK4cfU+JSRrjtDqTyk8SaklG4c8Bl/WBfPrh3yG4ezIeHgX8jPTB1FYesr6p5kjmbCf4oqJK9vG74+u3XgWnssfxoQCMv6LdTurPIcpvZoTKBgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lO6Y5pvQLyttuGrsUemOR6FlRAT4hv6Onm3HApcA1A0=;
 b=YruQUpTIC4pXaEq7UtqKnqNE85F5JNrhTV34VkvRoxNf7sheiAgp33XW8hKdCpHvUG4QWMZ0T0UF/xAPRlQGSF4+2ZUklJMb1b9xZUj4UPgCEnB6fTOU0Lt9WDUjaoWF9/mINpnNb6AoxmqqLLUsp1W14gAak9LYGSn6rFS0tg4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Fix UBSAN failure in start_xen()
Thread-Topic: [PATCH] xen/arm: Fix UBSAN failure in start_xen()
Thread-Index: AQHaWnvkg1O7hpIgTUmeZhL+Ri6ivrEAlu4A
Date: Thu, 8 Feb 2024 15:46:27 +0000
Message-ID: <990CAEEA-B5CC-42B4-8350-71FCC8A16242@arm.com>
References: <20240208104339.37826-1-michal.orzel@amd.com>
In-Reply-To: <20240208104339.37826-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB9955:EE_|AMS0EPF0000019E:EE_|PAVPR08MB8821:EE_
X-MS-Office365-Filtering-Correlation-Id: 7044a7ec-43b5-4e21-b421-08dc28bd2168
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Ne3jK/RWDCqaX1NkngyfzDR8FzLDil8ogGZLSDPhXXYU+2OusW8L0su/ntJXuYsYzpU/VxiDE2v8PpSr4pE3npu49szNYndnDfEJbkbK+V3Uk2EFlyLsp9PuwkwAwVRalGkDmudtukljU1ZAQJQVdjFDNupD+/TuqOACLZc0sqKC+97ST6kN5PsHJaOdC0fZuls+/QGMz4yiW4c+OQQ2mceiDJktlLSYV2l8D2CJx4laqAEES9WrYN9TiqwmIZ7Xvuiz7nCBkTYUiC37Vc359cOYHeinw5vct/HKKklWxIGm4oNhy+s8g+dCfHr7NE3oK1EKm10NVDTzdttLGgFpJMC+zSyeim9/A6qsJG7uxLs6LgX09tAaDCbk/MlJcx6L10uNCUe3yIUHpW+hgFon/AsL71kidmL46RJM/zx/mI/fgmlq5pLcoMA4jC5VA8bHZ5etchk+44JnF4vM578q+9GP7818NgEgv1dbRAflyYSoOZWQxU+WRzJhxZxRobLUDnszjG4+uSuG5RA/e9CB4C7eFTE8QqJEUE8xSQimp+6yno4IvUaGg3BAQTNZwcbhzc9tyKYZAuZ466yIezSCVGULE2QEPJTFAI0b4/ElwmWPeeyb7E5DTMrq98eBaaxH
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(83380400001)(41300700001)(122000001)(66946007)(66476007)(6486002)(71200400001)(36756003)(76116006)(6506007)(64756008)(6916009)(53546011)(54906003)(478600001)(33656002)(66446008)(8936002)(8676002)(316002)(38070700009)(6512007)(4326008)(86362001)(66556008)(26005)(2616005)(38100700002)(2906002)(5660300002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <39F8B1AB92BE2F4FB41AC3F3F8E7C9DB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9955
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	57bc7306-2010-4734-01f1-08dc28bd1c83
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z+lM3os1haec8ICiyTOhVPpfoWIDN7okxUq7/2eyrNNduNdWUKCfjLiRPsa73hyquAoHOyCaKdOdPIXaOsSvwblUy4FjlzOjRttMq7o5XvD913U6StBHkbjOfWGlQBS5+3jFTRtr96mJr1mzmlU2VwArszmltbYLiKesuBrorILnS2thmo/5e+oaic7X3vfFZe1LBX4824X6M5Wn3HvPjc6TB+7LB7CdMjYaKm2TrfZiDJGiNkbiIwgibCPH0e/T/i1o5Tvhi3EJY4MkcuPkqtqHqD7q6tNiQhsMP58UAIwS51zoTbohtj4lKJjNigrtLLSeSVaSs+pwIkIEjAaiNZHUcRLB4ME4bMVhl0Hhf2luw4A1DvU3BJnno6bsYVETkOPcZve9Wz4Ky7jUalPjj5cg1vtqdv0MdJfKnbRRdvawcJwQwNrQTwFe992EeesNq51+0bxu7rHUuZCkHbDml7TMTPZKzWCRAKD2q32aXGP23k0YtyA+sWUODy3X1tcSWs/X2n3v4beTLehzw1J3lNcPP27yy9ovudlB3P17JXlAslZxWuCEUEu/sMCRdEeWjRRJomliNVTfr/62FNVRvAyHnmRYICB3MmlhUtRYfX0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(396003)(39860400002)(230922051799003)(64100799003)(82310400011)(1800799012)(186009)(451199024)(46966006)(40470700004)(36840700001)(2906002)(54906003)(5660300002)(316002)(6862004)(41300700001)(70586007)(70206006)(6512007)(6486002)(478600001)(6506007)(53546011)(8676002)(8936002)(4326008)(2616005)(107886003)(83380400001)(86362001)(82740400003)(36756003)(336012)(26005)(356005)(81166007)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 15:46:35.3582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7044a7ec-43b5-4e21-b421-08dc28bd2168
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8821

DQoNCj4gT24gOCBGZWIgMjAyNCwgYXQgMTA6NDMsIE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVs
QGFtZC5jb20+IHdyb3RlOg0KPiANCj4gV2hlbiBydW5uaW5nIFhlbiBvbiBhcm0zMiwgaW4gc2Nl
bmFyaW8gd2hlcmUgWGVuIGlzIGxvYWRlZCBhdCBhbiBhZGRyZXNzDQo+IHN1Y2ggYXMgYm9vdF9w
aHlzX29mZnNldCA+PSAyR0IsIFVCU0FOIHJlcG9ydHMgdGhlIGZvbGxvd2luZzoNCj4gDQo+IChY
RU4pIFVCU0FOOiBVbmRlZmluZWQgYmVoYXZpb3VyIGluIGFyY2gvYXJtL3NldHVwLmM6NzM5OjU4
DQo+IChYRU4pIHBvaW50ZXIgb3BlcmF0aW9uIHVuZGVyZmxvd2VkIDAwMjAwMDAwIHRvIDg2ODAw
MDAwDQo+IChYRU4pIFhlbiBXQVJOIGF0IGNvbW1vbi91YnNhbi91YnNhbi5jOjE3Mg0KPiAoWEVO
KSAtLS0tWyBYZW4tNC4xOS11bnN0YWJsZSAgYXJtMzIgIGRlYnVnPXkgdWJzYW49eSAgTm90IHRh
aW50ZWQgXS0tLS0NCj4gLi4uDQo+IChYRU4pIFhlbiBjYWxsIHRyYWNlOg0KPiAoWEVOKSAgICBb
PDAwMzFiNGMwPl0gdWJzYW4uYyN1YnNhbl9lcGlsb2d1ZSsweDE4LzB4ZjAgKFBDKQ0KPiAoWEVO
KSAgICBbPDAwMzFkMTM0Pl0gX191YnNhbl9oYW5kbGVfcG9pbnRlcl9vdmVyZmxvdysweGI4LzB4
ZDQgKExSKQ0KPiAoWEVOKSAgICBbPDAwMzFkMTM0Pl0gX191YnNhbl9oYW5kbGVfcG9pbnRlcl9v
dmVyZmxvdysweGI4LzB4ZDQNCj4gKFhFTikgICAgWzwwMDRkMTVhOD5dIHN0YXJ0X3hlbisweGUw
LzB4YmUwDQo+IChYRU4pICAgIFs8MDAyMDAwN2M+XSBoZWFkLm8jcHJpbWFyeV9zd2l0Y2hlZCsw
eDQvMHgzMA0KPiANCj4gVGhlIGZhaWx1cmUgaXMgcmVwb3J0ZWQgZm9yIHRoZSBmb2xsb3dpbmcg
bGluZToNCj4gKHBhZGRyX3QpKHVpbnRwdHJfdCkoX3N0YXJ0ICsgYm9vdF9waHlzX29mZnNldCkN
Cj4gDQo+IFRoaXMgb2NjdXJzIGJlY2F1c2UgdGhlIGNvbXBpbGVyIHRyZWF0cyAocHRyICsgc2l6
ZSkgd2l0aCBzaXplIGJpZ2dlciB0aGFuDQo+IFBUUkRJRkZfTUFYIGFzIHVuZGVmaW5lZCBiZWhh
dmlvci4gVG8gYWRkcmVzcyB0aGlzLCBzd2l0Y2ggdG8gbWFjcm8NCj4gdmlydF90b19tYWRkcigp
LCBnaXZlbiB0aGUgZnV0dXJlIHBsYW5zIHRvIGVsaW1pbmF0ZSBib290X3BoeXNfb2Zmc2V0Lg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4N
Cj4gLS0tDQoNCkhpIE1pY2hhbCwNCg0KSeKAmXZlIHRlc3RlZCB0aGlzIGNoYW5nZSB3aXRoIHFl
bXUgZm9yIGFybTMyIGFuZCBhcm02NCwgbG9va3MgZ29vZCB0byBtZToNCg0KUmV2aWV3ZWQtYnk6
IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NClRlc3RlZC1ieTogTHVjYSBG
YW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KDQoNCg==

