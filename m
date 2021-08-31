Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A04123FC889
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 15:44:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175760.320079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL43K-00071j-W0; Tue, 31 Aug 2021 13:43:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175760.320079; Tue, 31 Aug 2021 13:43:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL43K-0006yw-Sl; Tue, 31 Aug 2021 13:43:50 +0000
Received: by outflank-mailman (input) for mailman id 175760;
 Tue, 31 Aug 2021 13:43:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=06Zp=NW=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mL43J-0006yq-8v
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 13:43:49 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.53]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77270d14-0a61-11ec-ad40-12813bfff9fa;
 Tue, 31 Aug 2021 13:43:47 +0000 (UTC)
Received: from AS9PR06CA0096.eurprd06.prod.outlook.com (2603:10a6:20b:465::25)
 by AM5PR0802MB2500.eurprd08.prod.outlook.com (2603:10a6:203:a0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Tue, 31 Aug
 2021 13:43:45 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::5f) by AS9PR06CA0096.outlook.office365.com
 (2603:10a6:20b:465::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24 via Frontend
 Transport; Tue, 31 Aug 2021 13:43:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Tue, 31 Aug 2021 13:43:44 +0000
Received: ("Tessian outbound 19a632698c93:v103");
 Tue, 31 Aug 2021 13:43:43 +0000
Received: from d8760ee41da6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DD7036A5-AFC0-45C5-894E-83B799B401EE.1; 
 Tue, 31 Aug 2021 13:43:33 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d8760ee41da6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 31 Aug 2021 13:43:33 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB9PR08MB6958.eurprd08.prod.outlook.com (2603:10a6:10:2be::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Tue, 31 Aug
 2021 13:43:29 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%7]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 13:43:29 +0000
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
X-Inumbo-ID: 77270d14-0a61-11ec-ad40-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDc6XDhcgwqufSrt4vRDMbNAi7QmKZkRLPZ4JuvlPIE=;
 b=5Xoz32GFvTzfaURDpBFckjt4mJpVSA1AlO8u5ZUuKHhL5zutUjVJoTPmv6JQy6BCXc8ncPdZLl2M5RVS1/n1bMQPORHMzP4SlSbOM68WGKYSMDeGq1U4K2hYS3hQmuktuu0SHnc94GTu+SYjd0rDtza/Hj1/mdrPZY2CNXlLot8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnmS/xsga11TsBz+qtX0ZDB23FkfZ9A4ZXnsPlmgU8HAMrjPw3IjA2fANXyeXUojqI8/qwDHHuTA5IYzUNevD86nXOFJdB8Z7MkPWQ1S2qv6kfkeaRROlIHgUsbXyqv7yWWHXVMsU1gz/h2KJ3YpEyxNndYs/FIIevvZ35P2ZdRORbISIDNZ0J0twPI9w3ktBbD0Yazf01Bey/M8KR2ZaCAva3KlQ69XsfrAVNJ/jIdvt/j8HmuZnRUhhH37tBlzjYi/VfXZUsOyZyPx9ZjAuIrQA2qXuohxM1dXegBXi/e3V1sZXb5+X3mXgfhXZ/N1wttKcsRqbF0568IH6c/tEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDc6XDhcgwqufSrt4vRDMbNAi7QmKZkRLPZ4JuvlPIE=;
 b=gdthfebzuUt5vKSXY44lAGUA8M0zu147/fWqURQ4AFo+UL95MkueccYtSjMgJsnOY29OawrNn7OH6N5JG5b4R1H0/umTTEKnd0znFwTH8Re0I5zguC3hvqRUBfcWcKBuIFY8xtzBkw/dRh4YSHxu84G/pUA9Dh+qw1noe/M5A1au5qi6Pm2sv5Pz60Q8metQIASqQ4foDR2xLZjmNj7Hr75wdbBuDSwOokufGbk0fCnZ0sVfZQKIZaSAK6ZSKdfaLxblTnXBkny1wIyrRwb72lQ95SewJNgL6luyA8fI/Jal4a8VbI/pfjmb09xLaogkLuqCm9Ks8XjowE1Fs3pOZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDc6XDhcgwqufSrt4vRDMbNAi7QmKZkRLPZ4JuvlPIE=;
 b=5Xoz32GFvTzfaURDpBFckjt4mJpVSA1AlO8u5ZUuKHhL5zutUjVJoTPmv6JQy6BCXc8ncPdZLl2M5RVS1/n1bMQPORHMzP4SlSbOM68WGKYSMDeGq1U4K2hYS3hQmuktuu0SHnc94GTu+SYjd0rDtza/Hj1/mdrPZY2CNXlLot8=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 31/40] xen/x86: move nodes_cover_memory to common
Thread-Topic: [XEN RFC PATCH 31/40] xen/x86: move nodes_cover_memory to common
Thread-Index: AQHXjptKZECAg9VCjEW42dN79DG/FauM7oIAgADJbwA=
Date: Tue, 31 Aug 2021 13:43:29 +0000
Message-ID:
 <DB9PR08MB6857E2B07418C47668211F369ECC9@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-32-wei.chen@arm.com>
 <alpine.DEB.2.21.2108301813320.17851@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2108301813320.17851@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 7739CF973BBB8946892DA1D47914E157.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 53caca9e-eefe-45c4-b257-08d96c855a0a
x-ms-traffictypediagnostic: DB9PR08MB6958:|AM5PR0802MB2500:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM5PR0802MB250038BBF540279AAD97E8009ECC9@AM5PR0802MB2500.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2hgW1nMjisNFW5qFwOyT7LNR4tGEBdCN8ym9KQVrQ24itXiigXyZ0ygY3A6uMhznnsHBxrkJ7EsdgxtrSoarP9CgSEPaFUsgVQQpiA0B8gOt6h0BHxnb5MFpsKbuMWYdmKNZIKk+ynSNXlgeHD3AcAusG/nFN/SZmEnyOt7ZDJQZUl3s+ToL7w6RifoxOZiX3/LTM1+JS5MKICwMJ6XVns2ggHJoLltjuJ6OEweNCwP/yzhlIgtwOr/GUGB9PvAAbVmybSfPmfLs4wxf6z1T23iSTgwsIh++xb5vlXyC5vhyV2bzPGex2iLDu+FtebpvHXqhuxWRukRZZu5cvnHfCFU5Ddj8T4j/ozlUBAcbbHzsghUY8yyfw1QlVjfr5X+Sqe6SbSfQWjGUkqXy2c4mK/C7UV5XZb2opSJJ2vlW0j3bhgepdCC05iTdCJOoDjCeI2KEqcw5As5CTD6SVLXlWm3/SeV1tn+98tc7fJ3sRNdujO9jCa/7euobOqYfPpKo/qD4iVZsXUP6Rayyg2LXCFFgG4/KPzpngP0h5rqH7J7xq/gzUMtJp+UbBk2EtfrsBeR2O6QQ4dbB1A108W6Lea1PnvvALDIgwrfXgwZLLT3sgPiicJoFKiFtO5Vjr1Jrm+XwQg4/xiOUFYV0vpQ4i2aZ9Fl9QUXPFM5wfJkYehDnsMkTXTq5LgpvxGCXR+sBvYb+9oYGjI5qDvQF1ntYmQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39850400004)(55016002)(478600001)(86362001)(122000001)(53546011)(8676002)(9686003)(38100700002)(4326008)(6916009)(66946007)(76116006)(66446008)(66476007)(66556008)(64756008)(5660300002)(33656002)(38070700005)(54906003)(52536014)(26005)(7696005)(83380400001)(2906002)(186003)(71200400001)(6506007)(8936002)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?a21TSlI0MTRWNXRxdy9oY1lwL0lrbm9LRERZdUpucThyWVNzZ25yT2k5bU16?=
 =?gb2312?B?TXhFcjlHWitJV0k0REJ3YzZtMHU1MjJlSjhMKzB4bU51aDZsaUdCcHZOUzJu?=
 =?gb2312?B?TWNxOWRDOXlvRjNCaG05cmhtQzN4Qk5OVEovS1h3MktsWHZGVkFNVExKWmt3?=
 =?gb2312?B?eHJxSFkrVkJpQ0NUNE93VFprcDBWRHJnUGVnOEJMOEh5TmVPcGFTQ2FNOHMw?=
 =?gb2312?B?aG5UbEV0bkxCVDJNaGZ1L2pjS1NUMkRrSTBIKzdBZXZiVWN1dFBWTUZQaWd4?=
 =?gb2312?B?TmJRcTBqUURQMERmMXdYN3o3ZUg2ak53a3FJSTVUVVZINWtnN1BpVCs0OEdJ?=
 =?gb2312?B?R1RFN3R3QkVUTDlaODZnNmRXam05Z2FKV2NWclIzT2JpOHhUVUlRN25hOUtz?=
 =?gb2312?B?Q25xaWVLOXhKbnhNMDdSYUNFejdLYUhjcVo2QTh1L1V3VmhCcy9LT1Nod0Fr?=
 =?gb2312?B?ZmxKamZjbTc4djhGbVZpdWcrYmZ3UkVkam9hWktOZ0dmaUFDSG5CSnJEajNs?=
 =?gb2312?B?UFNxckpUZ3FOT1lWM3drcDBHL0JPcnlGWHhiSmlWYXZoSm5ycGlRcW16cFFI?=
 =?gb2312?B?akNRZnhjaURjWjJ1V3BRc2N4NVRWeFhZcnV4VFFGZU5Ea1ozTTJDZ3N6Uzdj?=
 =?gb2312?B?Zi9scVg4d3pGWmVwalhvNkR1OE9wMWpmL3NQbm51cHF4Q1luQTI5TDFtZy9N?=
 =?gb2312?B?bE4xSUxsTE8xSGlrY01qVENFTzlVSlpHM21GTzczWkdOdDVncE1JdjNNWUZq?=
 =?gb2312?B?RGptcERRUm1reDlxbTR5aEhCQ2hocXNCK1JuMUNVMmxMUVBpbDRIdGtIQkEr?=
 =?gb2312?B?OGpYdGx0RzBabFI5ZStPelhVOWZjQU0xN1BuaHBpcm81SVMyV0RwUDZKWlZp?=
 =?gb2312?B?WHJXZ3Jvby9UQVJacHhTOHJFcnIvbWZyUjFVd2xPNHF2eDVpTUV4djBJQ3BN?=
 =?gb2312?B?TFpUMWJ1eDdTS2NYUTcrT2xUTlZIa2RBdW13RmRtMW5sYmt1dFczZG9pVVRX?=
 =?gb2312?B?NEVzdWVLamMrMmpnOVNubzFacGNGaEIzTkl6ZnFvUUg3MVYyWnZtN0UrUFoz?=
 =?gb2312?B?V2VpblpZTUdaK29pNzd6STM4RXdkb1ZVb1krays3RTBlTkpMOWd0c2s5aGRj?=
 =?gb2312?B?RzRubXRNS21DZTVjNE1DenY1TVJFWkZ4cVBUYkdOOThaN0l4NzhMZEFHMStL?=
 =?gb2312?B?VzJveEV5Qjkrd2VDWDh0eURrT0RDYktaK2VqZnlSRlVWL3hhdXRNQmFxbFMx?=
 =?gb2312?B?Y1dyMThFVTlCcEJOTzkwQkk0ci9rUnNmbnkrd1dmbnpVcytJaXRPV3A0Tmc0?=
 =?gb2312?B?djlaQW1nN2lVNjh0RjVKR0J2RitMaG9mK0hRRU9vTWlPSzRlM2Rwa2p5anRr?=
 =?gb2312?B?YnBOeWQvTU5aeG16M3ZDZDZPUVdRb0NiOUpBS1dCdUZVTXNLdzZjbEhDVnpU?=
 =?gb2312?B?b0hHTEpya2RwVVJNbjI4SmhnMWdjS1FCR1lpZWtBM2JDWHg0NFU5cTNNNkVk?=
 =?gb2312?B?Rmw0SDhSUGk2TVNqMWpsR2VwNUxBYVAyTnRIWUQyOU9BbEwrZ29CMXZXUVlG?=
 =?gb2312?B?bU5keTRUa3RpQWpzaE1XOHV5NHNmZEN2NFVVNTVJY3dsSHp3N2trOGZsQlVQ?=
 =?gb2312?B?dUhYTXJnTktYNnBadmJaQjNjYzRydXhOWUs1ZHZHUGp1Y3cwMFdKVS9nekVh?=
 =?gb2312?B?RjYwcmQ2NW1iWk1xODdqY1NzNWVJZlQvR3lQZnl3NHJIYWlWTjBVSUNQNXhr?=
 =?gb2312?Q?kh2EjWxIIQYPWuj3VCwbSAO6JlMLU/nlZGeK/vP?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6958
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e7e9645d-3f98-4ecd-6049-08d96c855145
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MVp1U9WPCR3is/899NJ9I0uIo8TjHZ4H62X9O+qjsvfLa8JMxOC0s6jAPzAYHr5sPupEkUygz6RI2FyrtKQQmEbuZI8GylCmiT+SZpWYEeDz4shsQ65KshTgIF9jbAqkDLuhm7tFFLefv1rN1CnPb72WHkfuxxGXcAMlx913EUIJUL2fYY19RL/zeK/CznhvMqZvgUFzP5EgwWq1rs9ahU/0sVjtCNyReJeVjoLPRMKP8pwdeEazggWCsHBa9uKtWZ0MfHqvCkm1mp/Lh6rSpZzQiLJKxlBdJ2Ho1oPHcdw7mVgf+1thdg6b43wJgukCoZjQiAY8pI8vX0CgaXuU2dLT62B9B/QZoJdBw7E/z7p0zsCxAZF6CbTMunAEkKycuOjBl1ZvEn2O3SG56soNqCPYQVjyzMbPls3nRKVUxplNVMIrHhqASm5yI6Ble+GFkYbxCxtp7452rcvxBa+QHTOWpx8k13vXqYTk8mg6b2M4lBv/irvoKSCR27BxRCN7FCPQ9mnZwmXlcpW48L7CxEphDRyKfcDFJE/7us/2MF6Y6jWCevIjuN6EzY0/mKxZFJHUCyXWDhJhB8PUiibzwEsB7xjIuqHHz0cclu2t2Ba0THYp1AOIewotAtsF28Kq7/m868zB4b9sy3pRJSKJ58dTkOdc0G3g+k2+7LLntOS6Z971pD70XsyjrwoUVlnbIhbqJTSoThvNvNzhmiilBw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(8676002)(54906003)(2906002)(47076005)(356005)(70206006)(6862004)(86362001)(70586007)(186003)(33656002)(9686003)(55016002)(82310400003)(7696005)(83380400001)(8936002)(6506007)(53546011)(52536014)(336012)(508600001)(5660300002)(81166007)(4326008)(316002)(26005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 13:43:44.6026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53caca9e-eefe-45c4-b257-08d96c855a0a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2500

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHE6jjU
wjMxyNUgOToxNw0KPiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGll
bkB4ZW4ub3JnOw0KPiBqYmV1bGljaEBzdXNlLmNvbTsgQmVydHJhbmQgTWFycXVpcyA8QmVydHJh
bmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMzEvNDBd
IHhlbi94ODY6IG1vdmUgbm9kZXNfY292ZXJfbWVtb3J5IHRvDQo+IGNvbW1vbg0KPiANCj4gT24g
V2VkLCAxMSBBdWcgMjAyMSwgV2VpIENoZW4gd3JvdGU6DQo+ID4gTm90IG9ubHkgQUNQVSBOVU1B
LCBidXQgYWxzbyBBcm0gZGV2aWNlIHRyZWUgYmFzZWQgTlVNQQ0KPiA+IHdpbGwgdXNlIG5vZGVz
X2NvdmVyX21lbW9yeSB0byBkbyBzYW5pdHkgY2hlY2suIFNvIHdlIG1vdmUNCj4gPiB0aGlzIGZ1
bmN0aW9uIGZyb20gYXJjaC94ODYgdG8gY29tbW9uLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
V2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+ID4gLS0tDQo+ID4gIHhlbi9hcmNoL3g4Ni9z
cmF0LmMgICAgfCA0MCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+
ID4gIHhlbi9jb21tb24vbnVtYS5jICAgICAgfCA0MCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrDQo+ID4gIHhlbi9pbmNsdWRlL3hlbi9udW1hLmggfCAgMSArDQo+ID4g
IDMgZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NyYXQuYyBiL3hlbi9hcmNoL3g4Ni9zcmF0
LmMNCj4gPiBpbmRleCBkZDNhYTMwODQzLi5kY2ViYzdhZGVjIDEwMDY0NA0KPiA+IC0tLSBhL3hl
bi9hcmNoL3g4Ni9zcmF0LmMNCj4gPiArKysgYi94ZW4vYXJjaC94ODYvc3JhdC5jDQo+ID4gQEAg
LTMwOCw0NiArMzA4LDYgQEAgYWNwaV9udW1hX21lbW9yeV9hZmZpbml0eV9pbml0KGNvbnN0IHN0
cnVjdA0KPiBhY3BpX3NyYXRfbWVtX2FmZmluaXR5ICptYSkNCj4gPiAgCW51bV9ub2RlX21lbWJs
a3MrKzsNCj4gPiAgfQ0KPiA+DQo+ID4gLS8qIFNhbml0eSBjaGVjayB0byBjYXRjaCBtb3JlIGJh
ZCBTUkFUcyAodGhleSBhcmUgYW1hemluZ2x5IGNvbW1vbikuDQo+ID4gLSAgIE1ha2Ugc3VyZSB0
aGUgUFhNcyBjb3ZlciBhbGwgbWVtb3J5LiAqLw0KPiA+IC1zdGF0aWMgaW50IF9faW5pdCBub2Rl
c19jb3Zlcl9tZW1vcnkodm9pZCkNCj4gPiAtew0KPiA+IC0JaW50IGk7DQo+ID4gLQl1aW50MzJf
dCBucl9iYW5rcyA9IGFyY2hfbWVtaW5mb19nZXRfbnJfYmFuaygpOw0KPiA+IC0NCj4gPiAtCWZv
ciAoaSA9IDA7IGkgPCBucl9iYW5rczsgaSsrKSB7DQo+ID4gLQkJaW50IGosIGZvdW5kOw0KPiA+
IC0JCXVuc2lnbmVkIGxvbmcgbG9uZyBzdGFydCwgZW5kOw0KPiA+IC0NCj4gPiAtCQlpZiAoYXJj
aF9tZW1pbmZvX2dldF9yYW1fYmFua19yYW5nZShpLCAmc3RhcnQsICZlbmQpKSB7DQo+ID4gLQkJ
CWNvbnRpbnVlOw0KPiA+IC0JCX0NCj4gPiAtDQo+ID4gLQkJZG8gew0KPiA+IC0JCQlmb3VuZCA9
IDA7DQo+ID4gLQkJCWZvcl9lYWNoX25vZGVfbWFzayhqLCBtZW1vcnlfbm9kZXNfcGFyc2VkKQ0K
PiA+IC0JCQkJaWYgKHN0YXJ0IDwgbm9kZXNbal0uZW5kDQo+ID4gLQkJCQkgICAgJiYgZW5kID4g
bm9kZXNbal0uc3RhcnQpIHsNCj4gPiAtCQkJCQlpZiAoc3RhcnQgPj0gbm9kZXNbal0uc3RhcnQp
IHsNCj4gPiAtCQkJCQkJc3RhcnQgPSBub2Rlc1tqXS5lbmQ7DQo+ID4gLQkJCQkJCWZvdW5kID0g
MTsNCj4gPiAtCQkJCQl9DQo+ID4gLQkJCQkJaWYgKGVuZCA8PSBub2Rlc1tqXS5lbmQpIHsNCj4g
PiAtCQkJCQkJZW5kID0gbm9kZXNbal0uc3RhcnQ7DQo+ID4gLQkJCQkJCWZvdW5kID0gMTsNCj4g
PiAtCQkJCQl9DQo+ID4gLQkJCQl9DQo+ID4gLQkJfSB3aGlsZSAoZm91bmQgJiYgc3RhcnQgPCBl
bmQpOw0KPiA+IC0NCj4gPiAtCQlpZiAoc3RhcnQgPCBlbmQpIHsNCj4gPiAtCQkJcHJpbnRrKEtF
Uk5fRVJSICJTUkFUOiBObyBQWE0gZm9yIGU4MjAgcmFuZ2U6ICINCj4gPiAtCQkJCSIlMDE2THgg
LSAlMDE2THhcbiIsIHN0YXJ0LCBlbmQpOw0KPiA+IC0JCQlyZXR1cm4gMDsNCj4gPiAtCQl9DQo+
ID4gLQl9DQo+ID4gLQlyZXR1cm4gMTsNCj4gPiAtfQ0KPiA+IC0NCj4gPiAgdm9pZCBfX2luaXQg
YWNwaV9udW1hX2FyY2hfZml4dXAodm9pZCkge30NCj4gPg0KPiA+ICBzdGF0aWMgdWludDY0X3Qg
X19pbml0ZGF0YSBzcmF0X3JlZ2lvbl9tYXNrOw0KPiA+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9u
L251bWEuYyBiL3hlbi9jb21tb24vbnVtYS5jDQo+ID4gaW5kZXggNzlhYjI1MDU0My4uNzQ5NjA4
ODVhNiAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vY29tbW9uL251bWEuYw0KPiA+ICsrKyBiL3hlbi9j
b21tb24vbnVtYS5jDQo+ID4gQEAgLTE5Myw2ICsxOTMsNDYgQEAgdm9pZCBfX2luaXQgY3V0b2Zm
X25vZGUoaW50IGksIHU2NCBzdGFydCwgdTY0IGVuZCkNCj4gPiAgCX0NCj4gPiAgfQ0KPiA+DQo+
ID4gKy8qIFNhbml0eSBjaGVjayB0byBjYXRjaCBtb3JlIGJhZCBTUkFUcyAodGhleSBhcmUgYW1h
emluZ2x5IGNvbW1vbikuDQo+ID4gKyAgIE1ha2Ugc3VyZSB0aGUgUFhNcyBjb3ZlciBhbGwgbWVt
b3J5LiAqLw0KPiA+ICtpbnQgX19pbml0IG5vZGVzX2NvdmVyX21lbW9yeSh2b2lkKQ0KPiA+ICt7
DQo+ID4gKwlpbnQgaTsNCj4gPiArCXVpbnQzMl90IG5yX2JhbmtzID0gYXJjaF9tZW1pbmZvX2dl
dF9ucl9iYW5rKCk7DQo+ID4gKw0KPiA+ICsJZm9yIChpID0gMDsgaSA8IG5yX2JhbmtzOyBpKysp
IHsNCj4gPiArCQlpbnQgaiwgZm91bmQ7DQo+ID4gKwkJdW5zaWduZWQgbG9uZyBsb25nIHN0YXJ0
LCBlbmQ7DQo+ID4gKw0KPiA+ICsJCWlmIChhcmNoX21lbWluZm9fZ2V0X3JhbV9iYW5rX3Jhbmdl
KGksICZzdGFydCwgJmVuZCkpIHsNCj4gPiArCQkJY29udGludWU7DQo+ID4gKwkJfQ0KPiA+ICsN
Cj4gPiArCQlkbyB7DQo+ID4gKwkJCWZvdW5kID0gMDsNCj4gPiArCQkJZm9yX2VhY2hfbm9kZV9t
YXNrKGosIG1lbW9yeV9ub2Rlc19wYXJzZWQpDQo+ID4gKwkJCQlpZiAoc3RhcnQgPCBub2Rlc1tq
XS5lbmQNCj4gPiArCQkJCSAgICAmJiBlbmQgPiBub2Rlc1tqXS5zdGFydCkgew0KPiA+ICsJCQkJ
CWlmIChzdGFydCA+PSBub2Rlc1tqXS5zdGFydCkgew0KPiA+ICsJCQkJCQlzdGFydCA9IG5vZGVz
W2pdLmVuZDsNCj4gPiArCQkJCQkJZm91bmQgPSAxOw0KPiA+ICsJCQkJCX0NCj4gPiArCQkJCQlp
ZiAoZW5kIDw9IG5vZGVzW2pdLmVuZCkgew0KPiA+ICsJCQkJCQllbmQgPSBub2Rlc1tqXS5zdGFy
dDsNCj4gPiArCQkJCQkJZm91bmQgPSAxOw0KPiA+ICsJCQkJCX0NCj4gPiArCQkJCX0NCj4gPiAr
CQl9IHdoaWxlIChmb3VuZCAmJiBzdGFydCA8IGVuZCk7DQo+ID4gKw0KPiA+ICsJCWlmIChzdGFy
dCA8IGVuZCkgew0KPiA+ICsJCQlwcmludGsoS0VSTl9FUlIgIlNSQVQ6IE5vIFBYTSBmb3IgZTgy
MCByYW5nZTogIg0KPiA+ICsJCQkJIiUwMTZMeCAtICUwMTZMeFxuIiwgc3RhcnQsIGVuZCk7DQo+
IA0KPiBJIGRvbid0IGtub3cgaWYgeW91IGFyZSBhbHJlYWR5IGRvaW5nIHRoaXMgaW4gYSBsYXRl
ciBwYXRjaCBidXQgdGhlDQo+IG1lc3NhZ2Ugc2hvdWxkbid0IHNheSBlODIwIGFzIGl0IGRvZXNu
J3QgZXhpc3Qgb24gYWxsIGFyY2hpdGVjdHVyZS4NCj4gTWF5YmUgImZvciBhZGRyZXNzIHJhbmdl
IiBvciAiZm9yIG1lbW9yeSByYW5nZSIgd291bGQgc3VmZmljZS4NCj4gDQo+IE5vcm1hbGx5IHdl
IGRvbid0IGRvIGNoYW5nZSB0b2dldGhlciB3aXRoIGNvZGUgbW92ZW1lbnQgYnV0IGluIHRoaXMg
Y2FzZQ0KPiBJIHRoaW5rIGl0IHdvdWxkIGJlIE9LLg0KDQpPSywgSSB3aWxsIGRvIGl0IGluIG5l
eHQgdmVyc2lvbi4NCg==

