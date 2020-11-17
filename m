Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4984B2B5C2E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 10:50:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28845.57990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kexcZ-0005un-SP; Tue, 17 Nov 2020 09:49:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28845.57990; Tue, 17 Nov 2020 09:49:55 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kexcZ-0005uO-OX; Tue, 17 Nov 2020 09:49:55 +0000
Received: by outflank-mailman (input) for mailman id 28845;
 Tue, 17 Nov 2020 09:49:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ssn=EX=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kexcX-0005uJ-TD
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 09:49:54 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.64]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eccc1b2a-12e1-4b2b-a405-e3a2242b12eb;
 Tue, 17 Nov 2020 09:49:50 +0000 (UTC)
Received: from AM5PR0701CA0019.eurprd07.prod.outlook.com
 (2603:10a6:203:51::29) by AM6PR08MB4519.eurprd08.prod.outlook.com
 (2603:10a6:20b:74::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 09:49:47 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::67) by AM5PR0701CA0019.outlook.office365.com
 (2603:10a6:203:51::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.15 via Frontend
 Transport; Tue, 17 Nov 2020 09:49:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Tue, 17 Nov 2020 09:49:47 +0000
Received: ("Tessian outbound 13ed5f5344c0:v71");
 Tue, 17 Nov 2020 09:49:46 +0000
Received: from 024e3840942f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FE529277-0409-413B-8FBD-D759ADECB8C4.1; 
 Tue, 17 Nov 2020 09:49:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 024e3840942f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Nov 2020 09:49:30 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB6PR0801MB1992.eurprd08.prod.outlook.com (2603:10a6:4:76::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Tue, 17 Nov
 2020 09:49:28 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28%6]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 09:49:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/ssn=EX=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kexcX-0005uJ-TD
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 09:49:54 +0000
X-Inumbo-ID: eccc1b2a-12e1-4b2b-a405-e3a2242b12eb
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown [40.107.6.64])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id eccc1b2a-12e1-4b2b-a405-e3a2242b12eb;
	Tue, 17 Nov 2020 09:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZGC6pHTsP477l9M581r6eVumdLkpOQUid+cz7DYd88=;
 b=rOSbHIfuBteKzMdypW40ZqWRpgo2rPE77eNH2uQT0NySwwAQypDH1ZyQh1j+dA8/2KjaiXIk7HohyTWMesW5OeFSYFJbBNQ8TvuPpBJdzL2mO25pMy66A0BCi8lWEOnEBepeR0qBC6Qrh+hL1U9QSDReucJYkyPy0t5OmJ7WaLA=
Received: from AM5PR0701CA0019.eurprd07.prod.outlook.com
 (2603:10a6:203:51::29) by AM6PR08MB4519.eurprd08.prod.outlook.com
 (2603:10a6:20b:74::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 09:49:47 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::67) by AM5PR0701CA0019.outlook.office365.com
 (2603:10a6:203:51::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.15 via Frontend
 Transport; Tue, 17 Nov 2020 09:49:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Tue, 17 Nov 2020 09:49:47 +0000
Received: ("Tessian outbound 13ed5f5344c0:v71"); Tue, 17 Nov 2020 09:49:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e8290b2b7b294f7a
X-CR-MTA-TID: 64aa7808
Received: from 024e3840942f.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FE529277-0409-413B-8FBD-D759ADECB8C4.1;
	Tue, 17 Nov 2020 09:49:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 024e3840942f.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 17 Nov 2020 09:49:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MILSIrcf7tpB2PoFtfguyeRmqZnyCYVr8SS8VrLbgImjp28kFny3tfApv4uK4YV1356Tb464WUSRwI9VL94GGTxPZZQgCXqoRPbKF7caBlILnf9hOrWeyNm/VErGG9r9zeSH47KlPl7eIPnWIrWZeXqhUGjRYxcOCM8MR66jGZ1mJ48w/GfaGghgbIgMvyN0I0ijIz5tW9LzLjtXaRmgo/DflRGYQX4+F385yn/PLUO7zEjVmUrndk/ZjwWnv3QPAjinNd7vc/Pvley6x6qQ5AbBw7CXFKv7fGASI7XjWSPTFUAM5+RDKP4J0XOaJocFpRlLYAqZkG01p30tDc3HCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZGC6pHTsP477l9M581r6eVumdLkpOQUid+cz7DYd88=;
 b=mMoHzrWkgyKJd0O9A67AIofNactBW4E35E0B4m6UbqZu/y3hqgXxDuIzlV1zFQpu8Ehk/ZqmoxdapGs/9b+DQ1ZHVQyaM17T6tOPv2r/XMFahXDCtjd7sU09Mv9zcuBcyQ/KsoWWwN9F0pnB6BrF9VjUpsaklt0CGKdjymk8Wwib0r661LD1zBylqci75F+w2x1kXWfpGuCxytRVUw+SelyRAMg8FTuybpnqOgxjVOu8rrV/J8g7OTrEeZ+NEUxXS9J8gMxJN2vAF4ojDgv0iPxwqbBG8XbUVGVdVnuoM8z464vQXA08ew27D59OIZdB8PNu2Tc2DKUijc/osKpCzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZGC6pHTsP477l9M581r6eVumdLkpOQUid+cz7DYd88=;
 b=rOSbHIfuBteKzMdypW40ZqWRpgo2rPE77eNH2uQT0NySwwAQypDH1ZyQh1j+dA8/2KjaiXIk7HohyTWMesW5OeFSYFJbBNQ8TvuPpBJdzL2mO25pMy66A0BCi8lWEOnEBepeR0qBC6Qrh+hL1U9QSDReucJYkyPy0t5OmJ7WaLA=
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB6PR0801MB1992.eurprd08.prod.outlook.com (2603:10a6:4:76::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Tue, 17 Nov
 2020 09:49:28 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28%6]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 09:49:28 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 2/3] xen/pci: Move x86 specific code to x86 directory.
Thread-Topic: [PATCH v3 2/3] xen/pci: Move x86 specific code to x86 directory.
Thread-Index: AQHWvBPDynVNQDWjWUaLWbo/nKPcx6nLh3iAgACOQIA=
Date: Tue, 17 Nov 2020 09:49:28 +0000
Message-ID: <85965899-870B-4D50-BB62-BDB3EB17F76B@arm.com>
References: <cover.1605527997.git.rahul.singh@arm.com>
 <a84005e5aa6733043e043b015cde4983719c8535.1605527997.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2011161719300.20906@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2011161719300.20906@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 13e42912-3235-43e8-89e5-08d88ade1e9a
x-ms-traffictypediagnostic: DB6PR0801MB1992:|AM6PR08MB4519:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB451968777ADDE9D0126FDA55FCE20@AM6PR08MB4519.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bRnG+omTswVBYUcOCE8IzBWA9ukTZDgvlTSsSlv5BU8NjfmWEQiWCm6kJ8I5J/UVF3tf9Vb4+vcpZJxi7yyWKdrLWFVAUwamD+ra/LHg35Ej2ecbyfC4tT0Xhj8PuD2vTobbjUYBgJlPh6k0Yg1IIQ54jYsIerE62a1+QJ98LeXP8kVYoHQI6/vcuMJKFTQP9hWL97s2T4dqghqdluVd0fObQLE7ZO0JaKJ+WkJrJq4BMSpc5DkmFcNk8GBhtPjVhBKCb83XfF3olkTphfm+nZmo9kkerisup5GX+f+NFrfN8YsH3ZXvzTwZJV2OP/n6ydDoixbXdLVovSQKvBbk4p5CjZNFYAONceNiD1joBMkd5Z+/8rESIL/xBrVCcHDuZ530K8OxOIjDwSANdMW9VQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(396003)(376002)(136003)(71200400001)(8676002)(91956017)(478600001)(53546011)(64756008)(66446008)(66476007)(76116006)(6486002)(186003)(26005)(6506007)(66946007)(66556008)(36756003)(2616005)(86362001)(83380400001)(316002)(33656002)(4326008)(6916009)(54906003)(6512007)(8936002)(5660300002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 Ilj/jJ03WV6f8UD8SAtEtV7Wbd08MGfLHdal9DT5wZQOFvaLMvo+P+8b3xQz02WXk4rx42z7AVP4A2Ha87eg92LZQnuE3J5nl7yNUXnXi3Sp8b9pfhiYzx0mfYTJHMhntDTwvNlqv5Rh12C+K2+1h5iFDJ6mPVGHr1lzoidRzsT69S7VemAfWFEO4E6ddT1SFnlaX1naGATjc8pCY2ERk3Fblg16t377tNMnLHgGwU1KLpD6jDi1BKNpQ1BRWIBWLi4r7bhceuzJHFbox9/gcM5Oc/zggCjgumfa4XWyXZtoUTiyZAXpoJ6mwJf2ovEanLWs9G1+iIRi2UYpgHs9083XajoVfT4QQrN7kY0Y8HKELi/XdUwz8I0H6G8QzPIfEW6ekagYNV6/IHo7s5Ae0DYknAnP3VMTsC9+EZQFQ4K3P4bfqUVjRLDKYmV6cTiBv1c/723e/7u1+XvnF4xa5S8QGQr7sPimSvQJEmABPkRzeiJnKfQN1pbBYjiB+HV12n7CyFPKbWWBOg1/zy9tsm7WoXQx1cjXo1zpywNz6pZ2lHxLXMQcv9AwCRXu1mvx1LuBmLrxmKRiOhieGmgVPP/hNrCsDAv6NFiRip581JpWgLjacDNRp2E3k4izeWAY20c5TdRQmd6IbDfv6bQOD0/kgM8S/PkwTzfsWaxkKmpwZe1RZcsiMVOSH6qveOgF9s0VeOIc+yJ2I7eLgsGBjV2ZKtX4RHjOIs3CVVlF4il3cwG5iWV/5XDd0cxGFY7pqAii1ALYly2q98beip38r83xr81dyx06a5ZPa34VGe20/YgNymovfhn/tqdRqZnTb1BNbeZfrOf5TcweR0MihTAXD+A5Qxyy4fQ5sQ1LKvUzFECjiBLrPJez0Fxw4ysLAN78OBKX5wkr5bvK3s+CRQ==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D4B5312B999B0D4D9B19EC0522D23C34@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1992
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	09545fac-955c-4ab5-c8d7-08d88ade1395
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	idn7svn+tjCe74NI0uLkIpDpmqBwdzyHrVooWS03EVI1y6ZWAbsV48cC3YmQHK00JQ2mBQklBg/U07FwD9CLd5ymYDYkadzWZkOU4S8hLjpvIlOjuTMhUEk+vQLYba5osPjmQiBG58gXHWFneiPhmytpxZCkgsyPLlpTEGz70Tq5jft+n52Fw71I73Xe8d+hM+N89QaYJfY1lERw/IeXkOooXEejtcVHaGx8LdtuYmU2tktMEHfsBposXsvM7DxD9HOGNScHkZoGvaXQ1JkYX691H9i2b5Kfc1G9eBtYDJQZiAAUzVqXciA5AOLr2gmRMLHGum4x/KXSm9p1+MwRctrgI9tvQjSEPKPCG85PMpfJveabB4ULNNwXYZbhgB5O5Ua3iVAVkYVDQKyIz31rN3VsuCp9+oWhmWXBxQ20BS0+Y/nEOgDthArR4C5rOklehUC7uXDPq7QaJQYLsLWB67wEduzwSVBRrWumXj5Q+Cw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(46966005)(26005)(4326008)(336012)(2616005)(8676002)(70586007)(2906002)(478600001)(53546011)(54906003)(8936002)(316002)(6506007)(36906005)(6862004)(6512007)(186003)(86362001)(70206006)(36756003)(5660300002)(33656002)(47076004)(82310400003)(81166007)(6486002)(82740400003)(356005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 09:49:47.1973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e42912-3235-43e8-89e5-08d88ade1e9a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4519

Hello Stefano,

> On 17 Nov 2020, at 1:20 am, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>=20
> On Mon, 16 Nov 2020, Rahul Singh wrote:
>> passthrough/pci.c file is common for all architecture, but there is x86
>> specific code in this file.
>>=20
>> Move x86 specific code to the drivers/passthrough/io.c file to avoid
>> compilation error for other architecture.
>>=20
>> As drivers/passthrough/io.c is compiled only for x86 move it to
>> x86 directory and rename it to hvm.c.
>>=20
>> No functional change.
>>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>=20
> This patch breaks the x86 build if you disable CONFIG_HVM:
>=20
> prelink-efi.o: In function `pci_release_devices':
> /local/repos/xen-upstream/xen/drivers/passthrough/pci.c:900: undefined re=
ference to `arch_pci_clean_pirqs'
> Makefile:209: recipe for target '/local/repos/xen-upstream/xen/xen.efi' f=
ailed
>=20
>=20

Thanks for reviewing the code.
I will fix the build and will send the v3 patch.

Regards,
Rahul

>=20
>> ---
>>=20
>> Changes in v3:
>> - fixed typo
>> - As per suggestion move the code to the file io.c and move that file to
>>  x86 directory and rename it hvm.c
>>=20
>> ---
>> xen/drivers/passthrough/Makefile            |  3 -
>> xen/drivers/passthrough/pci.c               | 78 +--------------------
>> xen/drivers/passthrough/x86/Makefile        |  1 +
>> xen/drivers/passthrough/{io.c =3D> x86/hvm.c} | 66 +++++++++++++++++
>> xen/drivers/passthrough/x86/iommu.c         |  7 ++
>> xen/include/xen/pci.h                       |  2 +
>> 6 files changed, 77 insertions(+), 80 deletions(-)
>> rename xen/drivers/passthrough/{io.c =3D> x86/hvm.c} (95%)
>>=20
>> diff --git a/xen/drivers/passthrough/Makefile b/xen/drivers/passthrough/=
Makefile
>> index e973e16c74..cc646612c7 100644
>> --- a/xen/drivers/passthrough/Makefile
>> +++ b/xen/drivers/passthrough/Makefile
>> @@ -6,6 +6,3 @@ obj-$(CONFIG_ARM) +=3D arm/
>> obj-y +=3D iommu.o
>> obj-$(CONFIG_HAS_PCI) +=3D pci.o
>> obj-$(CONFIG_HAS_DEVICE_TREE) +=3D device_tree.o
>> -
>> -x86-$(CONFIG_HVM) :=3D io.o
>> -obj-$(CONFIG_X86) +=3D $(x86-y)
>> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci=
.c
>> index 51e584127e..e8a28df126 100644
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -14,9 +14,6 @@
>>  * this program; If not, see <http://www.gnu.org/licenses/>.
>>  */
>>=20
>> -#include <xen/sched.h>
>> -#include <xen/pci.h>
>> -#include <xen/pci_regs.h>
>> #include <xen/pci_ids.h>
>> #include <xen/list.h>
>> #include <xen/prefetch.h>
>> @@ -24,7 +21,6 @@
>> #include <xen/irq.h>
>> #include <xen/param.h>
>> #include <xen/vm_event.h>
>> -#include <asm/hvm/irq.h>
>> #include <xen/delay.h>
>> #include <xen/keyhandler.h>
>> #include <xen/event.h>
>> @@ -842,71 +838,6 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>>     return ret;
>> }
>>=20
>> -static int pci_clean_dpci_irq(struct domain *d,
>> -                              struct hvm_pirq_dpci *pirq_dpci, void *ar=
g)
>> -{
>> -    struct dev_intx_gsi_link *digl, *tmp;
>> -
>> -    pirq_guest_unbind(d, dpci_pirq(pirq_dpci));
>> -
>> -    if ( pt_irq_need_timer(pirq_dpci->flags) )
>> -        kill_timer(&pirq_dpci->timer);
>> -
>> -    list_for_each_entry_safe ( digl, tmp, &pirq_dpci->digl_list, list )
>> -    {
>> -        list_del(&digl->list);
>> -        xfree(digl);
>> -    }
>> -
>> -    radix_tree_delete(&d->pirq_tree, dpci_pirq(pirq_dpci)->pirq);
>> -
>> -    if ( !pt_pirq_softirq_active(pirq_dpci) )
>> -        return 0;
>> -
>> -    domain_get_irq_dpci(d)->pending_pirq_dpci =3D pirq_dpci;
>> -
>> -    return -ERESTART;
>> -}
>> -
>> -static int pci_clean_dpci_irqs(struct domain *d)
>> -{
>> -    struct hvm_irq_dpci *hvm_irq_dpci =3D NULL;
>> -
>> -    if ( !is_iommu_enabled(d) )
>> -        return 0;
>> -
>> -    if ( !is_hvm_domain(d) )
>> -        return 0;
>> -
>> -    spin_lock(&d->event_lock);
>> -    hvm_irq_dpci =3D domain_get_irq_dpci(d);
>> -    if ( hvm_irq_dpci !=3D NULL )
>> -    {
>> -        int ret =3D 0;
>> -
>> -        if ( hvm_irq_dpci->pending_pirq_dpci )
>> -        {
>> -            if ( pt_pirq_softirq_active(hvm_irq_dpci->pending_pirq_dpci=
) )
>> -                 ret =3D -ERESTART;
>> -            else
>> -                 hvm_irq_dpci->pending_pirq_dpci =3D NULL;
>> -        }
>> -
>> -        if ( !ret )
>> -            ret =3D pt_pirq_iterate(d, pci_clean_dpci_irq, NULL);
>> -        if ( ret )
>> -        {
>> -            spin_unlock(&d->event_lock);
>> -            return ret;
>> -        }
>> -
>> -        hvm_domain_irq(d)->dpci =3D NULL;
>> -        free_hvm_irq_dpci(hvm_irq_dpci);
>> -    }
>> -    spin_unlock(&d->event_lock);
>> -    return 0;
>> -}
>> -
>> /* Caller should hold the pcidevs_lock */
>> static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>>                            uint8_t devfn)
>> @@ -966,7 +897,7 @@ int pci_release_devices(struct domain *d)
>>     int ret;
>>=20
>>     pcidevs_lock();
>> -    ret =3D pci_clean_dpci_irqs(d);
>> +    ret =3D arch_pci_clean_pirqs(d);
>>     if ( ret )
>>     {
>>         pcidevs_unlock();
>> @@ -1370,13 +1301,6 @@ static int __init setup_dump_pcidevs(void)
>> }
>> __initcall(setup_dump_pcidevs);
>>=20
>> -int iommu_update_ire_from_msi(
>> -    struct msi_desc *msi_desc, struct msi_msg *msg)
>> -{
>> -    return iommu_intremap
>> -           ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg)=
 : 0;
>> -}
>> -
>> static int iommu_add_device(struct pci_dev *pdev)
>> {
>>     const struct domain_iommu *hd;
>> diff --git a/xen/drivers/passthrough/x86/Makefile b/xen/drivers/passthro=
ugh/x86/Makefile
>> index a70cf9460d..69284a5d19 100644
>> --- a/xen/drivers/passthrough/x86/Makefile
>> +++ b/xen/drivers/passthrough/x86/Makefile
>> @@ -1,2 +1,3 @@
>> obj-y +=3D ats.o
>> obj-y +=3D iommu.o
>> +obj-$(CONFIG_HVM) +=3D hvm.o
>> diff --git a/xen/drivers/passthrough/io.c b/xen/drivers/passthrough/x86/=
hvm.c
>> similarity index 95%
>> rename from xen/drivers/passthrough/io.c
>> rename to xen/drivers/passthrough/x86/hvm.c
>> index 6b1305a3e5..41cfa2e200 100644
>> --- a/xen/drivers/passthrough/io.c
>> +++ b/xen/drivers/passthrough/x86/hvm.c
>> @@ -1036,6 +1036,72 @@ unlock:
>>     spin_unlock(&d->event_lock);
>> }
>>=20
>> +static int pci_clean_dpci_irq(struct domain *d,
>> +                              struct hvm_pirq_dpci *pirq_dpci, void *ar=
g)
>> +{
>> +    struct dev_intx_gsi_link *digl, *tmp;
>> +
>> +    pirq_guest_unbind(d, dpci_pirq(pirq_dpci));
>> +
>> +    if ( pt_irq_need_timer(pirq_dpci->flags) )
>> +        kill_timer(&pirq_dpci->timer);
>> +
>> +    list_for_each_entry_safe ( digl, tmp, &pirq_dpci->digl_list, list )
>> +    {
>> +        list_del(&digl->list);
>> +        xfree(digl);
>> +    }
>> +
>> +    radix_tree_delete(&d->pirq_tree, dpci_pirq(pirq_dpci)->pirq);
>> +
>> +    if ( !pt_pirq_softirq_active(pirq_dpci) )
>> +        return 0;
>> +
>> +    domain_get_irq_dpci(d)->pending_pirq_dpci =3D pirq_dpci;
>> +
>> +    return -ERESTART;
>> +}
>> +
>> +int arch_pci_clean_pirqs(struct domain *d)
>> +{
>> +    struct hvm_irq_dpci *hvm_irq_dpci =3D NULL;
>> +
>> +    if ( !is_iommu_enabled(d) )
>> +        return 0;
>> +
>> +    if ( !is_hvm_domain(d) )
>> +        return 0;
>> +
>> +    spin_lock(&d->event_lock);
>> +    hvm_irq_dpci =3D domain_get_irq_dpci(d);
>> +    if ( hvm_irq_dpci !=3D NULL )
>> +    {
>> +        int ret =3D 0;
>> +
>> +        if ( hvm_irq_dpci->pending_pirq_dpci )
>> +        {
>> +            if ( pt_pirq_softirq_active(hvm_irq_dpci->pending_pirq_dpci=
) )
>> +                 ret =3D -ERESTART;
>> +            else
>> +                 hvm_irq_dpci->pending_pirq_dpci =3D NULL;
>> +        }
>> +
>> +        if ( !ret )
>> +            ret =3D pt_pirq_iterate(d, pci_clean_dpci_irq, NULL);
>> +        if ( ret )
>> +        {
>> +            spin_unlock(&d->event_lock);
>> +            return ret;
>> +        }
>> +
>> +        hvm_domain_irq(d)->dpci =3D NULL;
>> +        free_hvm_irq_dpci(hvm_irq_dpci);
>> +    }
>> +    spin_unlock(&d->event_lock);
>> +
>> +    return 0;
>> +}
>> +
>> /*
>>  * Note: 'pt_pirq_softirq_reset' can clear the STATE_SCHED before we get=
 to
>>  * doing it. If that is the case we let 'pt_pirq_softirq_reset' do ref-c=
ounting.
>> diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrou=
gh/x86/iommu.c
>> index f17b1820f4..875e67b53b 100644
>> --- a/xen/drivers/passthrough/x86/iommu.c
>> +++ b/xen/drivers/passthrough/x86/iommu.c
>> @@ -308,6 +308,13 @@ struct page_info *iommu_alloc_pgtable(struct domain=
 *d)
>>     return pg;
>> }
>>=20
>> +int iommu_update_ire_from_msi(
>> +    struct msi_desc *msi_desc, struct msi_msg *msg)
>> +{
>> +    return iommu_intremap
>> +           ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg)=
 : 0;
>> +}
>> +
>> /*
>>  * Local variables:
>>  * mode: C
>> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
>> index 20a54a5bb4..78d83afe64 100644
>> --- a/xen/include/xen/pci.h
>> +++ b/xen/include/xen/pci.h
>> @@ -208,4 +208,6 @@ int msixtbl_pt_register(struct domain *, struct pirq=
 *, uint64_t gtable);
>> void msixtbl_pt_unregister(struct domain *, struct pirq *);
>> void msixtbl_pt_cleanup(struct domain *d);
>>=20
>> +int arch_pci_clean_pirqs(struct domain *d);
>> +
>> #endif /* __XEN_PCI_H__ */
>> --=20
>> 2.17.1
>>=20


