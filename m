Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F31FC7F3783
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 21:34:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638232.994572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5XRc-0005qK-LA; Tue, 21 Nov 2023 20:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638232.994572; Tue, 21 Nov 2023 20:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5XRc-0005nT-I4; Tue, 21 Nov 2023 20:34:04 +0000
Received: by outflank-mailman (input) for mailman id 638232;
 Tue, 21 Nov 2023 20:34:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U+4w=HC=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r5XRa-0005nN-Jt
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 20:34:02 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d8789c6-88ad-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 21:34:00 +0100 (CET)
Received: from AM5PR0101CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::23) by PAXPR08MB6464.eurprd08.prod.outlook.com
 (2603:10a6:102:df::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 20:33:51 +0000
Received: from AMS0EPF000001A9.eurprd05.prod.outlook.com
 (2603:10a6:206:16:cafe::81) by AM5PR0101CA0010.outlook.office365.com
 (2603:10a6:206:16::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28 via Frontend
 Transport; Tue, 21 Nov 2023 20:33:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A9.mail.protection.outlook.com (10.167.16.149) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.12 via Frontend Transport; Tue, 21 Nov 2023 20:33:51 +0000
Received: ("Tessian outbound 20615a7e7970:v228");
 Tue, 21 Nov 2023 20:33:51 +0000
Received: from 262eecaef7c5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F92F95B9-060D-4D8E-8130-8A2AA46699DD.1; 
 Tue, 21 Nov 2023 20:33:45 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 262eecaef7c5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 21 Nov 2023 20:33:45 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS4PR08MB7556.eurprd08.prod.outlook.com (2603:10a6:20b:4fe::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Tue, 21 Nov
 2023 20:33:43 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838%7]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 20:33:36 +0000
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
X-Inumbo-ID: 4d8789c6-88ad-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bNvpE3p7q7tiBwjZKVK4HjqhYeI/44gh1x3txNMCmCGyu0rhnmubZyWOgacJXFzLV8OAoToMHIkU+fkLn24sGaevCQ+UR8dwNfZIzEMtjI5i79TzOg1Py7U4BhdiQ6iak990DO4hREveV3nnIl3R0J96N98mumRa1r/C3BC9mdS2gm0RU49dql9LI+vrfgXzDhFxrogf8a/v9cP23pg3mnQd6hGafAqrn4bj4+0vfcEOOis0/Cu86chY7LvHIyuUGKy1zPmReMsyxlKUb2j9cKe2So1q3iREOH71mzyp5U7tCoOCBit3gMVbbxvs4DxP3zq6CoSaldcTgUJ9c3ebbQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/o9OzXkc3QTL7NZ2EPElr5LfwbIjZamn9aUs9pNXPk=;
 b=MTNATq+Ju6GdSJhTaBr1UBjK+WGJqVBr7zTEKYYqfg0WuZGf49Y87gbNprEm9sXLGVBHw+B8clLDRPe3LEdsmdJcC2YYlQSJRdUdy6zuEOVAjB8O5xfpqGWJjCkgKzrLL7bE+SimugdG0NCCWDDnRZ89Wcj3Gvr0PFgjCng/nzfPTmf0BRNyKvgulmtpCu/U/jUmI9TfDfh4OfJx0rOdquMVIofLPcgOyHrs2NqkLpZNplQ+x2whiblQBwC8ySk+R3Fjgj8Z9xWe5/UML85E03Q7EWgB7qcTQu9vhgXGeh4Lzguv0wgQ3kt0r2kIJRUZKHFegYHE59bjIsoBIlaudw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/o9OzXkc3QTL7NZ2EPElr5LfwbIjZamn9aUs9pNXPk=;
 b=9rRhPknQ6FjMPBILVQg3IUqo4kIUUB/PMSv42TPmTyXmseteu0sID2bN14mpuP83m2CMbwCHdYrpUHUB4Yvnc8a1L7jVvo0tuDmQ/3vUqeXWks3Z5mem3LfWQYPCQBbPX9bsTLi+VQWVCbVHK2KkBaYuZiccZpOacMAaQCR387A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 39663df1bffdc560
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXSWlxBjUa2vKPrVilrAaMNUsmsCIWVfv4jOCtFpopg72v+A0FiOSYxrxiOekuexfz/ohI0nNyxd8oQGDdaodXRdCPqforVikHXyIR2HgBQkO+T00U9sMi8qMiqPrY2wDMk4POIrttDfcSyTf1KX6I6pAJ3vrKGY9G4JHNx3gAljqqS18jECzULA5Bh2lULCURSwRR3oNaPO5fnNYBsDbuzctI3IoYcxvhk0upJ9TAq8/YfOsQ2GX79Mxzh4qkD90C8+u0RAs+6Rd4hFiJ8fIcAXxB4/S9H2cDYzVxNakwqrYHJMZ/bQg0uErMRR/uLOHOJ4F8FUVwCs6uBEEeFfoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/o9OzXkc3QTL7NZ2EPElr5LfwbIjZamn9aUs9pNXPk=;
 b=UbDG0yIbKnvTtUyYT4Ho29UjEwR7Nr0ovI6RajAk3lIUKQ9WEa+eXBNTU79+FIthP0DtGBOTk10Fu4wvDOu1YwMTyjM+d+1Ic79XgfECxw4KFhlt9+shZOWOok6gJh2iCitJfBzJY8uoG90GcRm2dJaXe0dKGXYBKSe7rXRAUG+X4X5o7xsyCv9qzJO+6iZgIz84A0Fr7QJVMPiWBHkFDSS6Q6s8g5+MktNgxX7vl6KMRY8GlPMDNkDJrr8Wz6Vixvc2AT4YLRubXbel+M2C5taaPkfuLkeKhdngUc4nuzLjYFNwFqoqi+oN/3PTtMCksaZywCUyRqbEwUE8edwLkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/o9OzXkc3QTL7NZ2EPElr5LfwbIjZamn9aUs9pNXPk=;
 b=9rRhPknQ6FjMPBILVQg3IUqo4kIUUB/PMSv42TPmTyXmseteu0sID2bN14mpuP83m2CMbwCHdYrpUHUB4Yvnc8a1L7jVvo0tuDmQ/3vUqeXWks3Z5mem3LfWQYPCQBbPX9bsTLi+VQWVCbVHK2KkBaYuZiccZpOacMAaQCR387A=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v2 4/5] arm/efi: Simplify efi_arch_handle_cmdline()
Thread-Topic: [PATCH v2 4/5] arm/efi: Simplify efi_arch_handle_cmdline()
Thread-Index: AQHaHLkYgzDzOjzraUK+7wQZW0TenrCFOoGA
Date: Tue, 21 Nov 2023 20:33:36 +0000
Message-ID: <379DF4D1-8DB9-46AF-9586-861ED78DFF38@arm.com>
References: <20231121201540.1528161-1-andrew.cooper3@citrix.com>
 <20231121201540.1528161-5-andrew.cooper3@citrix.com>
In-Reply-To: <20231121201540.1528161-5-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS4PR08MB7556:EE_|AMS0EPF000001A9:EE_|PAXPR08MB6464:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d25295f-e297-4dae-dc08-08dbead12c6b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +yw3biNZua7JG70Aejrk17yYGNkscMlD/v3mWLjWi2n39WM8JTPDhMliR3BK6iwGDp9ECnSgsIowJY2Mt0mDwShrnzPlc1VCUrZ/5M6rHAd6QCkcByIdfX/7ccRVjiccPEmGIAR3IWfV+0cnw+OLQFx281ksmDtspuEijBM47IJ0EOuGaAlT13ahfjpUlmFY62bpFQLJoRiMu4fMBJeI8fjg44IAxCCBq6Dd24OB4bx+MVL0Rg8qN+gUWWwfb81pIFrdkwNjbFk6q6iKVBaw9I0vgQ9f1xHpdPnqQOadku10fe1fthO2SB6HZIABcoIR29soJvltdI98+K18zM15wE3NAOZ/YvfFcbKCEc7rDOFkRXZ5JGt4UftOKAm4rfdDIGzrYRNi2DJsUWc/P6VYMxX/PiHfYM1SEqvpm5VturEUZWugidgKrVv7SUZ3q5xkMbXmvGkNHzCw1XdAbzhyfe3ymGuvzKzfXuII+jqFXOn9dXI8DlvzyAzQZBTHyk/tD0aVWKH2/f9nHYm6kKwQ0gEDsElP7o62z5ji/1o8KSB6xnZzH8zv5vOiV3dDYPGOXZnSrkv6JJKf+2WSopdvgJTcGnV6ONEcRXnAxwO9SGl6zAZafaXCCUrAIshvP0TM/GK3LFfTkUY9EjYLCoRU0w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(136003)(366004)(376002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(41300700001)(36756003)(7416002)(2906002)(5660300002)(86362001)(33656002)(38070700009)(26005)(6512007)(53546011)(6506007)(2616005)(83380400001)(6486002)(478600001)(122000001)(71200400001)(38100700002)(91956017)(4326008)(66946007)(66556008)(76116006)(66476007)(8676002)(316002)(6916009)(8936002)(66446008)(54906003)(64756008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9F2C4C04CA5974BAE866F05C6725DB5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7556
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7d0ddc4c-e3ab-4487-ceed-08dbead12352
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DyJm+eMQVnRursTHmAl36byslUP26bZ6kl34SuebaVjD68a1OGdAv8TyK39yFUiN6HeLg8vOC7o3W7WntFx2F0Uybm5JDRM4wIeV3pjYWylY5Dlr0SIYPkQQkN1mdZzTTdwOw8onABFrEiF7uTbPJeIiba42tW1X5KWGCv0YNmF1bqiiCL4EorZrJ175a04Ur4zDjLcvCMKWEHoNJ/IaayKcGhXNDHxMyToGVmSfAnwbvNYclSuX8wj3Jochb0uhIHYazYSXN28soJDTR2d470hxkG0zXqJRVANKpc8V1gCujVMD8o2Vp++9CO3a/HG3TgQnevPDCnQsEUm/LV5OP5GLM9lI4CHTo3onTgGfaUcMqrUtPICt2/ETBBl4dC5JdE93/Fac7v1GJ03IAVJJQbK0tigG9w9JyJhi4stYs/oCOgAnh4lmFBcsjhRNg3GtJZAN8wFQlBU6AGN3xuKms/R2gMKy2Yagjng7iKeCiAaTgsqmNxebJfL2WeUSD38u23c+eXldHebtwQG7qOGtNBUojE1qxqrfqMTpaVgPIJM5BOFjRwjSct/UvXuWVHhThoHOfKKD4SXpMVO9n8X3D+OzIg7tSt1LLummeLHbN5+m4GVjY+fJOOtmgve/+TzhcPAmVwDwPJjLs/esA7ZcbK37Q3bqP7485MuDurHx7q7XKqb/Ozchzpo0AWKyKtLW3qM2ERisn+4K/GBVnU43/ZerZ6P+Pw+8IiWOdHXsetCUmRhDs2idjoyIWDwD3x3Y
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(39860400002)(136003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(82310400011)(40470700004)(46966006)(36840700001)(356005)(41300700001)(81166007)(82740400003)(36860700001)(6512007)(2906002)(86362001)(5660300002)(47076005)(36756003)(478600001)(33656002)(6486002)(8936002)(8676002)(4326008)(6862004)(53546011)(2616005)(40480700001)(6506007)(54906003)(316002)(70586007)(83380400001)(26005)(40460700003)(70206006)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 20:33:51.6762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d25295f-e297-4dae-dc08-08dbead12c6b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6464

KyBDQyBoZW5yeQ0KDQo+IE9uIDIxIE5vdiAyMDIzLCBhdCAyMDoxNSwgQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiAtV3dyaXRlLXN0cmluZ3Mg
aXMgdW5oYXBweSB3aXRoIGFzc2lnbmluZyAieGVuIiB0byBhIG11dGFibGUgcG9pbnRlciwgYnV0
IHRoaXMNCj4gbG9naWMgbG9va3MgaW5jb3JyZWN0LiAgSXQgd2FzIGluaGVyaXRlZCBmcm9tIHRo
ZSB4ODYgc2lkZSwgd2hlcmUgdGhlIGxvZ2ljDQo+IHdhcyByZWR1bmRhbnQgYW5kIGhhcyBub3cg
YmVlbiByZW1vdmVkLg0KPiANCj4gSW4gdGhlIEFSTSBjYXNlIGl0IGluc2VydHMgdGhlIGltYWdl
IG5hbWUgaW50byAieGVuLHhlbi1ib290YXJncyIgYW5kIHRoZXJlIGlzDQo+IG5vIGxvZ2ljIGF0
IGFsbCB0byBzdHJpcCB0aGlzIGJlZm9yZSBwYXJzaW5nIGl0IGFzIHRoZSBjb21tYW5kIGxpbmUu
DQo+IA0KPiBUaGUgYWJzZW5jZSBvZiBhbnkgbG9naWMgdG8gc3RyaXAgYW4gaW1hZ2UgbmFtZSBz
dWdnZXN0cyB0aGF0IGl0IHNob3VsZG4ndA0KPiBleGlzdCB0aGVyZSwgb3IgaGF2aW5nIGEgWGVu
IGltYWdlIG5hbWVkIGUuZy4gImhtcC11bnNhZmUiIGluIHRoZSBmaWxlc3lzdGVtDQo+IGlzIGdv
aW5nIHRvIGxlYWQgdG8gc29tZSB1bmV4cGVjdGVkIGJlaGF2aW91ciBvbiBib290Lg0KPiANCj4g
Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiAtLS0NCj4gQ0M6IEphbiBCZXVsaWNoIDxK
QmV1bGljaEBzdXNlLmNvbT4NCj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPg0KPiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gQ0M6IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVu
QHhlbi5vcmc+DQo+IENDOiBWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBh
bS5jb20+DQo+IENDOiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+
DQo+IENDOiBSb2JlcnRvIEJhZ25hcmEgPHJvYmVydG8uYmFnbmFyYUBidWdzZW5nLmNvbT4NCj4g
Q0M6IE5pY29sYSBWZXRyaW5pIDxuaWNvbGEudmV0cmluaUBidWdzZW5nLmNvbT4NCj4gDQo+IHYy
Og0KPiAqIE5ldy4NCj4gDQo+IEknbSBhZnJhaWQgdGhhdCBhbGwgb2YgdGhpcyByZWFzb25pbmcg
aXMgYmFzZWQgb24gcmVhZGluZyB0aGUgc291cmNlIGNvZGUuICBJDQo+IGRvbid0IGhhdmUgYW55
IHdheSB0byB0cnkgdGhpcyBvdXQgaW4gYSByZWFsIEFSTSBVRUZJIGVudmlyb25tZW50Lg0KDQpJ
IHdpbGwgdGVzdCB0aGlzIG9uZSB0b21vcnJvdyBvbiBhbiBhcm0gYm9hcmQNCg0KDQoNCg==

