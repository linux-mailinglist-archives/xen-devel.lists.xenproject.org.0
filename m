Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2666E21C4
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 13:08:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521105.809415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnHHg-0002ue-R1; Fri, 14 Apr 2023 11:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521105.809415; Fri, 14 Apr 2023 11:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnHHg-0002sW-O6; Fri, 14 Apr 2023 11:08:04 +0000
Received: by outflank-mailman (input) for mailman id 521105;
 Fri, 14 Apr 2023 11:08:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Krav=AF=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pnHHf-0002sQ-3F
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 11:08:03 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2041.outbound.protection.outlook.com [40.107.7.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ed8037b-dab4-11ed-b21e-6b7b168915f2;
 Fri, 14 Apr 2023 13:08:01 +0200 (CEST)
Received: from DB6PR07CA0023.eurprd07.prod.outlook.com (2603:10a6:6:2d::33) by
 AS8PR08MB7765.eurprd08.prod.outlook.com (2603:10a6:20b:521::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.42; Fri, 14 Apr 2023 11:07:32 +0000
Received: from DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::73) by DB6PR07CA0023.outlook.office365.com
 (2603:10a6:6:2d::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.7 via Frontend
 Transport; Fri, 14 Apr 2023 11:07:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT034.mail.protection.outlook.com (100.127.142.97) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.31 via Frontend Transport; Fri, 14 Apr 2023 11:07:31 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Fri, 14 Apr 2023 11:07:31 +0000
Received: from 2b4ff116f851.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 01951991-24EA-43A3-8784-E1D77A91B09B.1; 
 Fri, 14 Apr 2023 11:07:20 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2b4ff116f851.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Apr 2023 11:07:20 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB9PR08MB7770.eurprd08.prod.outlook.com (2603:10a6:10:396::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Fri, 14 Apr
 2023 11:07:18 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91%5]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 11:07:18 +0000
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
X-Inumbo-ID: 9ed8037b-dab4-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WScqcNgRrzzsOLc1vEtHNgMNFwLihiXJagzJYyK7NLA=;
 b=PcPjDIHCB987af/f/Yhg9lzEjikRzYuITys71LzKxUWq/Bl7M3XsAFVavHv5WwqspZJrCOvQRVZOLC2Q/NoT4iRxaLOuFEY0/VV9VQymRtay6BNMuprIItNP9+APs23y0gJo3dPRn0+OFgyD/DJZlWbMsLp8jYhqp65CX52WxTM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 031b3a79c22b1b86
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3Tkzh2c1ZoGUpdkqNfalDpCAQj5r8ZcfQtHZiiw4I1Lm3Zag77qZm7IwCU5d+aap+9Hk+Wf3dhB0zqUDiowFh4t2kQTw0wChqBhoGpP73N/NRgxxD/3HwIPTrQolDdhipV3ZvTdNxPrs7ZOgoCDGTBLCyNegYy9iFhcuMS8P0C/7B1OusSJ51pcvGzfYB8LjztoCI1NMrQsmUS4WEdTnAGmQt8/kTgA5CILv+EXqyYPUHx0rsnRy5O1NgWBBSdZdLamxS4olXcoG9DXKNOudz9OltafLPWSjzaTAAmPfx+JNiEunWlgUOVqu/UcFBAL3MYZC20N6x+Iatojw/9CBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WScqcNgRrzzsOLc1vEtHNgMNFwLihiXJagzJYyK7NLA=;
 b=hksip9xfv+E+ETEdGvORtIZqAS6FQAZGhXysC5wXdp65WijFPXUVbfP0zTNi+HRkARfpXD0qz2+XadL5KoM8msPC90spHH0juCl9z0M0tjjxfRkiGl+DLlYX1VP3Lxv/TrunHzM66CZFd5jDPUP0LzID/WA6HHsDJvACdjUAQ1pYs+eVP55t7VQaH/OilprOiclAwzEIciXFI7Za82TxXKGM5xvyORFVsPrfHlXPm2AX5b3Q7drKezoH0mgcNPX+wLpkS0vJXde+ywefFz0fAToXcjUP7K4Kwes2ktj5+NmC3nILf6nLynp0sRG53a/j315ZUtqnZAKX8w1+N3LmVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WScqcNgRrzzsOLc1vEtHNgMNFwLihiXJagzJYyK7NLA=;
 b=PcPjDIHCB987af/f/Yhg9lzEjikRzYuITys71LzKxUWq/Bl7M3XsAFVavHv5WwqspZJrCOvQRVZOLC2Q/NoT4iRxaLOuFEY0/VV9VQymRtay6BNMuprIItNP9+APs23y0gJo3dPRn0+OFgyD/DJZlWbMsLp8jYhqp65CX52WxTM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v5 02/12] xen/arm: add SVE vector length field to the
 domain
Thread-Topic: [PATCH v5 02/12] xen/arm: add SVE vector length field to the
 domain
Thread-Index:
 AQHZbSQ9GJqCFHqaX0uCiT+EC9U7s68pNK+AgAAHnICAAAGIAIAACdqAgABhBICAAP+IAA==
Date: Fri, 14 Apr 2023 11:07:18 +0000
Message-ID: <D32A74F6-8BBB-4965-A720-B3133ECC77BA@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-3-luca.fancellu@arm.com>
 <72f38b2b-a391-fb7c-f8c0-cf3561470875@xen.org>
 <B3A82639-6D61-4DA2-B918-A92A421C75D3@arm.com>
 <e8075849-8bd5-7fd4-efaa-81e48c867635@xen.org>
 <4F5DC5EC-F538-42CE-A93F-2B5E3FAC13BB@arm.com>
 <03cc0c98-c5ef-16f1-ed24-6a39320b08e5@xen.org>
In-Reply-To: <03cc0c98-c5ef-16f1-ed24-6a39320b08e5@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB9PR08MB7770:EE_|DBAEUR03FT034:EE_|AS8PR08MB7765:EE_
X-MS-Office365-Filtering-Correlation-Id: a4ca2cf1-cf8b-42ef-748f-08db3cd8711f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mSe6OrypJYJnEph5zQI2X3OHzF9a0NXN9O9G4hfYRd5rRAVSOGiKAb3FV3tiwO6k00mYRNt5IdYuTKEBBMjHHjsqjsqfTXLc0cVnpEUsQgDCoG5E7fQObDNmg/bn33YELRMtaR2ixbR439cwj5Sao+JvtVH0sJIeBIcElPoJMYbH0yioTVHuhiNS6Qvu/rZPdmDP30W6lwyGep7fA/MsBWK2dhYzacIGRcOIIWgX0rOIQjFdUgbL9CsJzm6K9zJfAikY1fAywd0JDtfgK3AHnXTEDaVQtIW+NcvLTBlI0YmBjsaQtWDkK8RE0BfOolHMEV9vEPyf1Xn3n/5+c9G0vm6w3qgvv4podrXruwc26/vJhr00zfMCqAdVIPq9S1tIODD6seUJQTPKYrgL+RemwcKHIYBuE1GeBGZCZ20qaq9WWdaB8D3Q1YUYwzH8zV/vg62e/YmQnvMeIp/jTma9o+u6bDQsJ1n155w0OUuTEeQmEsA/yXjFUgrjNKpJepz+xcT/0bBxBdcrn2OhlH0XftNWbMDJVcwPzAJw1zf6/56HULkfl6wLRF7UzKoznHD/veZ0s7IdvZpqN7FdqnV0+qjA+tLGWJhHRYt+e3YbMB7M0jj8zKON4gDlOTBj1rFhR/hZkX5V53sZ30YalShHVQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(451199021)(36756003)(86362001)(6486002)(6916009)(71200400001)(4326008)(41300700001)(66946007)(66446008)(54906003)(64756008)(66556008)(478600001)(8676002)(66476007)(76116006)(316002)(91956017)(33656002)(2616005)(6506007)(83380400001)(6512007)(26005)(53546011)(122000001)(2906002)(5660300002)(38070700005)(8936002)(38100700002)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <340B0A6ADBD74547904684AB28BF4388@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7770
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6faa8a5a-b9cb-4700-bfc5-08db3cd8698d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l4KUBLgGKnDLkrg14ugKGOZERDVV59FENl9xpawH1Fvphjd+qbi5cEpLtaQY1W7N1EhXN7vv2f3zBpHg1vUkhlQO5h6LGE7wHkPb1Br4gOk57Pb+A2tv/RhKmOQ0N5AqJ6A0tPrlQbMUO5FXZd6ENXQyw1Rp/IFOGgVAvsi5000Ph6xuqqT4HO0rguoYUvwABeujVQy6UJpwHtZrrcln1NfGBuyW7KAJICk+QEH77ayD36uqeT0H76w61GLRCj61y8PR9RLKNfohdrjBNxkS233C59GM5Gw0l3hqKRLoum1uWIHbLgHzrB/29Dnm2GDXsWy9SppKY7FzN5xHbnLv/gLqp7KsEAOW5LAkATMluO+e3Jfbflq52lC1XSEjy9VeRmgT6AN+bKsf6CwGxolk1iR11Mg3OSz09OVMwZp1cB9vfR0g4TZaEF7Ob5xQRTgcvAl2NlcEuvQ5PaijwWVE1k+LsoFor96k6ZxaXzVczYaGGLvfCMlP5te+zpj3X1HeLhnJ/cOStV7qbfDOgc5N0/B/Kl4Yegrsr4ArAyr9UtXkIMPWFK0oslbqPs3euYhwJJ0C27SxCpCc375IDRNNW4Gw5BA9zoJHBNGWLkny4FdT6guUksIWW1JCYTP5joGDZA6jAC4BcDvpHDFPmn6xZ0kDixuuvOMwO7U8VlOG2foQLi5t1ntTpDYtfZihlL5cd0kRQih7+gUDbHNFuO6G4A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199021)(36840700001)(40470700004)(46966006)(316002)(83380400001)(41300700001)(54906003)(82310400005)(33656002)(86362001)(36860700001)(336012)(478600001)(2616005)(70206006)(81166007)(8676002)(4326008)(70586007)(36756003)(6486002)(82740400003)(47076005)(356005)(2906002)(6862004)(8936002)(186003)(40460700003)(6506007)(6512007)(26005)(53546011)(5660300002)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 11:07:31.1546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ca2cf1-cf8b-42ef-748f-08db3cd8711f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7765

DQoNCj4gT24gMTMgQXByIDIwMjMsIGF0IDIwOjUyLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBPbiAxMy8wNC8yMDIzIDE1OjA1LCBM
dWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+IE9uIDEzIEFwciAyMDIzLCBhdCAxNDozMCwgSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gDQo+Pj4gDQo+Pj4gT24g
MTMvMDQvMjAyMyAxNDoyNCwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+Pj4gSGkgSnVsaWVuLA0K
Pj4+IA0KPj4+IEhpIEx1Y2EsDQo+Pj4gDQo+Pj4+Pj4gIEBAIC01OTQsNiArNTk3LDcgQEAgaW50
IGFyY2hfc2FuaXRpc2VfZG9tYWluX2NvbmZpZyhzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21h
aW4gKmNvbmZpZykNCj4+Pj4+PiAgICAgIHVuc2lnbmVkIGludCBtYXhfdmNwdXM7DQo+Pj4+Pj4g
ICAgICB1bnNpZ25lZCBpbnQgZmxhZ3NfcmVxdWlyZWQgPSAoWEVOX0RPTUNUTF9DREZfaHZtIHwg
WEVOX0RPTUNUTF9DREZfaGFwKTsNCj4+Pj4+PiAgICAgIHVuc2lnbmVkIGludCBmbGFnc19vcHRp
b25hbCA9IChYRU5fRE9NQ1RMX0NERl9pb21tdSB8IFhFTl9ET01DVExfQ0RGX3ZwbXUpOw0KPj4+
Pj4+ICsgICAgdW5zaWduZWQgaW50IHN2ZV92bF9iaXRzID0gc3ZlX2RlY29kZV92bChjb25maWct
PmFyY2guc3ZlX3ZsKTsNCj4+Pj4+PiAgICAgICAgaWYgKCAoY29uZmlnLT5mbGFncyAmIH5mbGFn
c19vcHRpb25hbCkgIT0gZmxhZ3NfcmVxdWlyZWQgKQ0KPj4+Pj4+ICAgICAgew0KPj4+Pj4+IEBA
IC02MDIsNiArNjA2LDI2IEBAIGludCBhcmNoX3Nhbml0aXNlX2RvbWFpbl9jb25maWcoc3RydWN0
IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluICpjb25maWcpDQo+Pj4+Pj4gICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7DQo+Pj4+Pj4gICAgICB9DQo+Pj4+Pj4gICsgICAgLyogQ2hlY2sgZmVhdHVyZSBm
bGFncyAqLw0KPj4+Pj4+ICsgICAgaWYgKCBzdmVfdmxfYml0cyA+IDAgKQ0KPj4+Pj4+ICsgICAg
ew0KPj4+Pj4+ICsgICAgICAgIHVuc2lnbmVkIGludCB6Y3JfbWF4X2JpdHMgPSBnZXRfc3lzX3Zs
X2xlbigpOw0KPj4+Pj4+ICsNCj4+Pj4+PiArICAgICAgICBpZiAoICF6Y3JfbWF4X2JpdHMgKQ0K
Pj4+Pj4+ICsgICAgICAgIHsNCj4+Pj4+PiArICAgICAgICAgICAgZHByaW50ayhYRU5MT0dfSU5G
TywgIlNWRSBpcyB1bnN1cHBvcnRlZCBvbiB0aGlzIG1hY2hpbmUuXG4iKTsNCj4+Pj4+PiArICAg
ICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+Pj4+Pj4gKyAgICAgICAgfQ0KPj4+Pj4+ICsNCj4+
Pj4+PiArICAgICAgICBpZiAoIHN2ZV92bF9iaXRzID4gemNyX21heF9iaXRzICkNCj4+Pj4+PiAr
ICAgICAgICB7DQo+Pj4+Pj4gKyAgICAgICAgICAgIGRwcmludGsoWEVOTE9HX0lORk8sDQo+Pj4+
Pj4gKyAgICAgICAgICAgICAgICAgICAgIlJlcXVlc3RlZCBTVkUgdmVjdG9yIGxlbmd0aCAoJXUp
ID4gc3VwcG9ydGVkIGxlbmd0aCAoJXUpXG4iLA0KPj4+Pj4+ICsgICAgICAgICAgICAgICAgICAg
IHN2ZV92bF9iaXRzLCB6Y3JfbWF4X2JpdHMpOw0KPj4+Pj4+ICsgICAgICAgICAgICByZXR1cm4g
LUVJTlZBTDsNCj4+Pj4+PiArICAgICAgICB9DQo+Pj4+PiANCj4+Pj4+IElzIFNWRSBzdXBwb3J0
ZWQgZm9yIDMyLWJpdCBndWVzdD8gSWYgbm90LCB0aGVuIHlvdSBzaG91bGQgaGFkIGEgY2hlY2sg
aGVyZSB0byBwcmV2ZW50IHRoZSBjcmVhdGlvbiBvZiB0aGUgZG9tYWluIGlmIHN2ZV92bF9iaXRz
IGlzIHNldC4NCj4+Pj4gTm8gU1ZFIGlzIG5vdCBzdXBwb3J0ZWQgZm9yIDMyIGJpdCBndWVzdHMs
IGhlcmUgSSB0aGluayB3ZSB3aWxsIGdldCDigJxTVkUgaXMgdW5zdXBwb3J0ZWQgb24gdGhpcyBt
YWNoaW5l4oCdIGJlY2F1c2UgZ2V0X3N5c192bF9sZW4oKSB3aWxsIHJldHVybiAwLg0KPj4+IA0K
Pj4+IEZyb20gbXkgdW5kZXJzdGFuZGluZywgZ2V0X3N5c192bF9sZW4oKSB3aWxsIHJldHVybiB0
aGUgbGVuIHN1cHBvcnRlZCBieSB0aGUgaG9zdHMuIFNvIGlmIHlvdSBydW4gYSAzMi1iaXQgZ3Vl
c3Qgb24gdG9wIG9mIGEgNjQtYml0IGhvc3RzLCB0aGVuIEkgYmVsaWV2ZSBnZXRfc3lzX3ZsX2xl
bigpIHdpbGwgYmUgbm9uLXplcm8uDQo+PiBZZXMgeW91IGFyZSByaWdodCwgSSByZWFsaXNlIHRo
YXQgSSBuZWVkIHRoZSBkb21haW4gdHlwZSBpbmZvcm1hdGlvbiBhbmQgSSBjYW7igJl0IGhhdmUg
aXQgaW4gYXJjaF9zYW5pdGlzZV9kb21haW5fY29uZmlnLCBob3dldmVyIHRoZXkgbWlnaHQgaGF2
ZSBzZW5zZSB0aGVyZSwgYW5kIEkgY2FuIGRvIGEgY2hlY2sNCj4+IGxpa2UgdGhpcyBhZnRlcndh
cmRzOg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9h
cmNoL2FybS9kb21haW5fYnVpbGQuYw0KPj4gaW5kZXggYzFmMGQxZDc4NDMxLi5jZTEyMzVjMjU3
NjkgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+ICsrKyBi
L3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPj4gQEAgLTM2OTQsNiArMzY5NCwxMiBAQCBz
dGF0aWMgaW50IF9faW5pdCBjb25zdHJ1Y3RfZG9tYWluKHN0cnVjdCBkb21haW4gKmQsIHN0cnVj
dCBrZXJuZWxfaW5mbyAqa2luZm8pDQo+PiAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+ICAg
ICAgfQ0KPj4gICsgICAgaWYgKCBkLT5hcmNoLnN2ZV92bCAmJiAoa2luZm8tPnR5cGUgPT0gRE9N
QUlOXzMyQklUKSApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHByaW50aygiU1ZFIGlzIG5vdCBh
dmFpbGFibGUgZm9yIDMyLWJpdCBkb21haW5cbiIpOw0KPj4gKyAgICAgICAgcmV0dXJuIC1FSU5W
QUw7DQo+PiArICAgIH0NCj4+ICsNCj4+ICAgICAgaWYgKCBpc182NGJpdF9kb21haW4oZCkgKQ0K
Pj4gICAgICAgICAgdmNwdV9zd2l0Y2hfdG9fYWFyY2g2NF9tb2RlKHYpOw0KPj4gV291bGQgaXQg
YmUgb2sgZm9yIHlvdT8NCj4gDQo+IGNvbnN0cnVjdF9kb21haW4oKSBpcyBvbmx5IGdvaW5nIHRv
IGJlIHVzZWQgZm9yIGRvbWFpbnMgY3JlYXRlZCBieSBYZW4uIFlvdSB3b3VsZCBuZWVkIHRoZSBz
YW1lIGNoZWNrIGZvciB0aGUgb25lcyBjcmVhdGVkIGJ5IHRoZSB0b29sc3RhY2suDQo+IA0KPiBE
byB5b3UgbmVlZCB0byBrbm93IHRoZSBTVkUgbGVuZ3RoIHdoZW4gdGhlIGRvbWFpbiBpcyBjcmVh
dGVkPyBJZiBub3QsIHRoZW4gSSB3b3VsZCBzdWdnZXN0IHRvIGNyZWF0ZSBhIG5ldyBkb21jdGwg
dGhhdCB3b3VsZCBiZSBjYWxsZWQgYWZ0ZXIgd2Ugc3dpdGNoIHRoZSBkb21haW4gdG8gMzItYml0
Lg0KDQpIaSBKdWxpZW4sDQoNClllcyB0aGF04oCZcyB0cnVlLCB3ZSB3b3VsZCBsaWtlIHRvIHBy
ZXZlbnQgd2hvIGlzIHVzaW5nIGh5cGVyIGNhbGxzIHRvIGhhdmUgZ3Vlc3RzIHdpdGggU1ZFIGJ1
dCAzMiBiaXRzLCBJIHRoaW5rIHRoYXQgd2l0aCB0aGlzIGNoZWNrIGl04oCZcyBwb3NzaWJsZSB0
byBhdm9pZCB0aGVtOg0KDQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2RvbWN0bC5j
IGIveGVuL2FyY2gvYXJtL2FybTY0L2RvbWN0bC5jDQppbmRleCAwZGU4OWI0MmM0NDguLmI3MTg5
ZThkYmJiNSAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9kb21jdGwuYw0KKysrIGIv
eGVuL2FyY2gvYXJtL2FybTY0L2RvbWN0bC5jDQpAQCAtNDMsNiArNDMsOSBAQCBsb25nIHN1YmFy
Y2hfZG9fZG9tY3RsKHN0cnVjdCB4ZW5fZG9tY3RsICpkb21jdGwsIHN0cnVjdCBkb21haW4gKmQs
DQogICAgICAgICBjYXNlIDMyOg0KICAgICAgICAgICAgIGlmICggIWNwdV9oYXNfZWwxXzMyICkN
CiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQorICAgICAgICAgICAgLyogU1ZFIGlz
IG5vdCBzdXBwb3J0ZWQgZm9yIDMyIGJpdCBkb21haW4gKi8NCisgICAgICAgICAgICBpZiAoIGlz
X3N2ZV9kb21haW4oZCkgKQ0KKyAgICAgICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7DQog
ICAgICAgICAgICAgcmV0dXJuIHN3aXRjaF9tb2RlKGQsIERPTUFJTl8zMkJJVCk7DQogICAgICAg
ICBjYXNlIDY0Og0KICAgICAgICAgICAgIHJldHVybiBzd2l0Y2hfbW9kZShkLCBET01BSU5fNjRC
SVQpOw0KDQpJdOKAmXMgYSBiaXQgbGF0ZSBpbiB0aGUgZ3Vlc3QgY3JlYXRpb24sIGJ1dCB3ZSBk
b27igJl0IGhhdmUgdGhlIGRvbWFpbiB0eXBlIGluZm9ybWF0aW9uIGJlZm9yZSwgdGhpcyBjaGVj
ayB0b2dldGhlciB3aXRoIHRoZSBjaGVjayBhYm92ZSBpbiBjb25zdHJ1Y3RfZG9tYWluIHdvdWxk
DQpiZSBlbm91Z2guDQoNCldoYXQgZG8geW91IHRoaW5rPw0KDQo+IA0KPiBDaGVlcnMsDQo+IA0K
PiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg0K

