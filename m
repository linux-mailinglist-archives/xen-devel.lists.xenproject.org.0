Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DADC04B8FBF
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 18:56:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274355.469801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKOXC-0000QR-15; Wed, 16 Feb 2022 17:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274355.469801; Wed, 16 Feb 2022 17:56:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKOXB-0000N2-U5; Wed, 16 Feb 2022 17:56:09 +0000
Received: by outflank-mailman (input) for mailman id 274355;
 Wed, 16 Feb 2022 17:56:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bXi8=S7=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nKOXA-0000Mw-ES
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 17:56:08 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b644cfbf-8f51-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 18:56:06 +0100 (CET)
Received: from AM6P191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::29)
 by DB9PR08MB7099.eurprd08.prod.outlook.com (2603:10a6:10:2c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Wed, 16 Feb
 2022 17:55:48 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::e1) by AM6P191CA0016.outlook.office365.com
 (2603:10a6:209:8b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15 via Frontend
 Transport; Wed, 16 Feb 2022 17:55:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 17:55:48 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Wed, 16 Feb 2022 17:55:48 +0000
Received: from 460c3ec08cdf.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3052AB91-B80B-4260-9818-332FA2752896.1; 
 Wed, 16 Feb 2022 17:55:40 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 460c3ec08cdf.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Feb 2022 17:55:40 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR0801MB1744.eurprd08.prod.outlook.com (2603:10a6:800:5c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Wed, 16 Feb
 2022 17:55:36 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6%5]) with mapi id 15.20.4995.014; Wed, 16 Feb 2022
 17:55:35 +0000
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
X-Inumbo-ID: b644cfbf-8f51-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJ3QIv3gyXxNBpKX4V2oQnb7NclhrJCVNS4iz/AKMdc=;
 b=OePr038BdQvkdV3KzKqOrHDOHKUctu9uXV8GO4w7oeSd2XU2gpayA6qFvzVrEd9HrEykaaczBHcNy/NeGzww//cVLZcw5lZAI4UsPAMmXgXyOdwHu9gSaSOpikbCPoAJw3hw+4K5TdLELyccQieZ3ClyrXe9c9Vvj4fQWgJu8OU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7a0bf511ab750d67
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XiEdZw7RJNppa75g0ZklvWe+tqwh4iDu+240N5iTmlWpMKTrCx3PKiMsmoyCiwKjXFG6p6iBexs9dj2ixd1pzA2k6cKEj0o9v+VameXU/PJlUl8RKoRrV1QLrqmUlIxo2iKq6YPGMCAJmsE+NmYBanCX9XteVlV9vjKkxewKx9qutLAtBeNtX4yvzMcJsyAgnxyfLEEJB5ciXiwhqXz4zgaTefMxKfF6Cyu8OxDDvdFVDiQ9LgLadFz670lO6hOaqWWoP2G/FfdZZsEvA/Y+4fqtVEh3NHfttoGNUCOVQuYOIHnsG6BYUc5sl5iWcZHYC04SqqZxa0M0gAs62fFWzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJ3QIv3gyXxNBpKX4V2oQnb7NclhrJCVNS4iz/AKMdc=;
 b=Wx4jyt9y8AAN1Obn8UzpTXA++MhtX628/vdL1QXYFcC2HkQNLZIaJCTA40OD6vFtVs9q4EBWzMSD2gCIg0ZGY3Fk3zmXfbisvoq1HHPOU+Hwu+rKRUedxiNg4OjTy1z7PH2I39DXefUOxbil/OY1/ZGwPuabru3LYhu2odEYO1tn38qbBRrLxZ7cmvH06t5FKBvmzZnbBWuumk39y+ZCrUQegatt2/wNIRzf+uOoLMd8UEnXrFYS6JQxAm96b3jcQkSYBhBEiub0zXSvb4IIV9VP4EIkG0jgkfKwWfwbEqc3kRUmTKQsxMMkOjVFZ1cCR8Gkimbe+dg6lOpSJESsxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJ3QIv3gyXxNBpKX4V2oQnb7NclhrJCVNS4iz/AKMdc=;
 b=OePr038BdQvkdV3KzKqOrHDOHKUctu9uXV8GO4w7oeSd2XU2gpayA6qFvzVrEd9HrEykaaczBHcNy/NeGzww//cVLZcw5lZAI4UsPAMmXgXyOdwHu9gSaSOpikbCPoAJw3hw+4K5TdLELyccQieZ3ClyrXe9c9Vvj4fQWgJu8OU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, George Dunlap
	<George.Dunlap@citrix.com>
Subject: Re: [PATCH v2] lib: extend ASSERT()
Thread-Topic: [PATCH v2] lib: extend ASSERT()
Thread-Index:
 AQHYE4sUwaOwwc8tCU249z99fRIDqqyVNw0AgADQBoCAAAHjAIAAIjuAgAACWYCAAAt3gIAAGi0AgAABjYCAAAkmAIAAAikAgAA1qgA=
Date: Wed, 16 Feb 2022 17:55:35 +0000
Message-ID: <289509F3-D0FA-43EA-89B4-8B4BDBA903FA@arm.com>
References: <75125344-b0e1-9663-4c1a-84bb35870fef@suse.com>
 <35d82770-66cf-e030-5bcc-3c030e4463d7@xen.org>
 <3F58400B-5151-42F2-8F39-109DDF50EE1E@arm.com>
 <a89223c8-f59a-24cc-96a7-e40feb28813f@suse.com>
 <DB014136-7797-4A61-9681-33A7D85403AA@citrix.com>
 <732e8e39-36c4-1651-61f3-9b55caf29fe8@suse.com>
 <46408EAE-5EA4-4B22-B685-BA6D313B5D3A@citrix.com>
 <FEF187A8-0A09-4D50-A0E5-F46E014DB3E1@arm.com>
 <63811bb5-cce4-d542-461e-a24926f01b34@suse.com>
 <0BF64A25-F218-404A-8547-4896FCB27E2C@arm.com>
 <99ffa08c-8482-12d2-0ca9-eccde97ecac3@suse.com>
In-Reply-To: <99ffa08c-8482-12d2-0ca9-eccde97ecac3@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b1955e32-d29b-4cae-2973-08d9f1759061
x-ms-traffictypediagnostic:
	VI1PR0801MB1744:EE_|AM5EUR03FT046:EE_|DB9PR08MB7099:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB7099FA31B3C5856FE8912C9D9D359@DB9PR08MB7099.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Sm67f6ASxFdJpMSvD8QEtg6K22uzglOY+bwU3MleXaiXTjmFWhumTkFgVB08C+Pvasa0WklD0T5P+BKSo7UCZ/+i435FtoxxLHN4+3pY0/Sli6CwjZoHBvFl9DqxbEo0GdT0dqgdrZDvd/0arXk6LTyuwtWjCSsHffNzAbtGX1p+ypAysndlOyjn+fttvar2AG8SMcMNQha8CEBKbrjbore84qR9LJjcIIFkUwJ+fnLUYBBrAgXkOIC5/UW3X5T7/sqdGFsfx/V6r2v0v3GjPp9ZDHqHDw8CYs3U4SZcM8PDsqQC4zPNFD4t667XNsQdjmFmZhekEtV7+DMkfNK9J2rvu5aramirwRNLrbNm3+06tmAEIpcWFHT70koUhl3cOcOWOh8iW5avZfdKTwIQh//hhmO5Jv52JIAwhrSghxn94ptG7IX0BjDSnZc8mA8dRBhR9HUsMq3cwm+bTX5n0X5fDH21equLqTYQgwouQuCmgo/FCzz4/puKZzUAiZ2mp71vN91iUNfSelAuuBxnyFEf4cDaH5Dkx9DJAZwMlWhyZ9nhIMJp5ofvTY4MK5EWJHIa80UtSw8AGu6Hb6QNb3x33mvRF14ZIEJU7LAw7YprODGZiKpGN7RFPt06wJfBnTLSpQnC6LYYA7EIzX+lx2Rpi1QmwLuTBVyru8dDoGHTs0rHQPL1AxxK566HOJ2tiLZ/RJtKhkWbVU+O7vjaSfJThS51FH+vhHZ4JuKIocjSCfqCnLPXCdkdc/xqhNeJ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(122000001)(38100700002)(38070700005)(66446008)(6512007)(6486002)(76116006)(508600001)(53546011)(6916009)(6506007)(71200400001)(2906002)(54906003)(186003)(36756003)(64756008)(91956017)(26005)(8676002)(4326008)(8936002)(316002)(66556008)(66476007)(66946007)(33656002)(86362001)(5660300002)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <52652C1124590C47914D83BC0C4E0769@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1744
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5e0d36ab-7110-4b8a-b05b-08d9f17588ba
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lYChbeW/7bC24iauCafXXenZD3XyVMKJwuo+T9t/E9V/XiOZRpcj4B88jKS6E96OdvKEFJfqYZGpnm2ZGPt+MSpo0WcE8u03VrU0iZGD74s564aFSAv4s++OI7Ej5f/MxSnaMfFAjMAdE8FtFBhRG/eHi50RQhrHNYYWtkVvAoVLgxgOv8WVxvZMUN3kAgM6VyA69al1maApyaJtSVoAtFB9HBzEGU0VHYhP0zQqOWC6ji/kX97tEO9Mh7vJ7GvyKI++brJfDhjtgSYpa4gGTilSXRa9NpTI2MmMPaM+GqX1c7jWZzyJ5C4VMsM9p/7ctDLnYMDv4oelClu7fElzg+vMteZudHN/B+JpXUERD2SLQUfOVsJE+UzPzHJZjBWHmdJwW/UhrKIuHFjTD/MumstTkExd92QFM1VmUp/ofjJdAy2KH7XrAdnN4NchDJteFTezNWy1SUD35gnxYe18bX841HrVVS76CJTRC+bSvLiQbB3o5DECtLqZwxveW1WrxeEf9DBy/wIKYBxU0T80bIV8oWwlCds1DsMnN1jpLDKbt0RjE1e/uHOOOyDeljNheyCMChy4tkZMn+r02XU66TuzXJja5o9GppS/B3nf3DCKOqI9nU0ngD0BXIcQmG8iWrL1GjIIgkvgXOB+Zc+/mlGtblt8u6nRN6xhRKPvLUKy6vXo2xUJfCD72Vrc/dUi
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(86362001)(70586007)(40460700003)(70206006)(6486002)(36756003)(8936002)(4326008)(36860700001)(6862004)(8676002)(356005)(508600001)(47076005)(81166007)(5660300002)(186003)(336012)(33656002)(26005)(2906002)(53546011)(54906003)(82310400004)(2616005)(316002)(83380400001)(107886003)(6512007)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 17:55:48.4608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1955e32-d29b-4cae-2973-08d9f1759061
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7099

SGkgSmFuLA0KDQo+IE9uIDE2IEZlYiAyMDIyLCBhdCAxNDo0MywgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDE2LjAyLjIwMjIgMTU6MzUsIEJlcnRyYW5k
IE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBKYW4sDQo+PiANCj4+PiBPbiAxNiBGZWIgMjAyMiwgYXQg
MTQ6MDMsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4g
T24gMTYuMDIuMjAyMiAxNDo1NywgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+IE9uIDE2
IEZlYiAyMDIyLCBhdCAxMjoyMywgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRyaXgu
Y29tPiB3cm90ZToNCj4+Pj4+PiBPbiBGZWIgMTYsIDIwMjIsIGF0IDExOjQyIEFNLCBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4+Pj4+IE9uIDE2LjAyLjIwMjIgMTI6
MzQsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+Pj4+Pj4+IEkgYW0gb3Bwb3NlZCB0byBvdmVybG9h
ZGluZyDigJxBU1NFUlTigJ0gZm9yIHRoaXMgbmV3IGtpbmQgb2YgbWFjcm87IEkgdGhpbmsgaXQg
d291bGQgbm90IG9ubHkgYmUgdW5uZWNlc3NhcmlseSBjb25mdXNpbmcgdG8gcGVvcGxlIG5vdCBm
YW1pbGlhciB3aXRoIG91ciBjb2RlYmFzZSwgYnV0IGl0IHdvdWxkIGJlIHRvbyBlYXN5IGZvciBw
ZW9wbGUgdG8gZmFpbCB0byBub3RpY2Ugd2hpY2ggbWFjcm8gd2FzIGJlaW5nIHVzZWQuDQo+Pj4+
Pj4+IA0KPj4+Pj4+PiBBU1NFUlRfQUNUSU9OKGNvbmRpdGlvbiwgY29kZSkgKG9yIGV2ZW4gQVNT
RVJUX09SX0FDVElPTigpKSB3b3VsZCBiZSBhIGJhcmUgbWluaW11bSBmb3IgbWUuDQo+Pj4+Pj4+
IA0KPj4+Pj4+PiBCdXQgSSBjYW7igJl0IGltYWdpbmUgdGhhdCB0aGVyZSBhcmUgbW9yZSB0aGFu
IGEgaGFuZGZ1bCBvZiBhY3Rpb25zIHdlIG1pZ2h0IHdhbnQgdG8gdGFrZSwgc28gZGVmaW5pbmcg
YSBtYWNybyBmb3IgZWFjaCBvbmUgc2hvdWxkbuKAmXQgYmUgdG9vIGJ1cmRlbnNvbWUuDQo+Pj4+
Pj4+IA0KPj4+Pj4+PiBGdXJ0aGVybW9yZSwgdGhlIHZlcnkgZmxleGliaWxpdHkgc2VlbXMgZGFu
Z2Vyb3VzOyB5b3XigJlyZSBub3Qgc2VlaW5nIHdoYXQgYWN0dWFsIGNvZGUgaXMgZ2VuZXJhdGVk
LCBzbyBpdOKAmXMgdG8gZWFzeSB0byBiZSDigJxjbGV2ZXLigJ0sIGFuZC9vciB3cml0ZSBjb2Rl
IHRoYXQgZW5kcyB1cCBkb2luZyBzb21ldGhpbmcgZGlmZmVyZW50IHRoYW4geW91IGV4cGVjdC4N
Cj4+Pj4+Pj4gDQo+Pj4+Pj4+IEF0IHRoZSBtb21lbnQgSSB0aGluayBBU1NFUlRfT1JfUkVUVVJO
KGNvbmRpdGlvbiwgY29kZSksIHBsdXMgb3RoZXIgbmV3IG1hY3JvcyBmb3IgdGhlIG90aGVyIGJl
aGF2aW9yIGlzIG5lZWRlZCwgd291bGQgYmUgYmV0dGVyLg0KPj4+Pj4+IA0KPj4+Pj4+IEhtbSwg
d2hpbGUgSSBzZWUgeW91ciBwb2ludCBvZiB0aGluZ3MgcG9zc2libHkgbG9va2luZyBjb25mdXNp
bmcgb3INCj4+Pj4+PiB1bmV4cGVjdGVkLCBzb21ldGhpbmcgbGlrZSBBU1NFUlRfT1JfUkVUVVJO
KCkgKHNob3VsZG4ndCBpdCBiZQ0KPj4+Pj4+IEFTU0VSVF9BTkRfUkVUVVJOKCk/KSBpcyBpbW8g
bGVzcyByZWFkYWJsZS4gSW4gcGFydGljdWxhciBJIGRpc2xpa2UNCj4+Pj4+PiB0aGUgbGFyZ2Vy
IGFtb3VudCBvZiB1cHBlcmNhc2UgdGV4dC4gQnV0IHllcywgSSBjb3VsZCBhY2NlcHQgdGhpcw0K
Pj4+Pj4+IGFzIGEgY29tcHJvbWlzZSBhcyBpdCBzdGlsbCBzZWVtcyBiZXR0ZXIgdG8gbWUgdGhh
biB0aGUgbXVsdGktbGluZQ0KPj4+Pj4+IGNvbnN0cnVjdHMgd2UgY3VycmVudGx5IHVzZS4NCj4+
Pj4+IA0KPj4+Pj4gSSBzZWUgd2hhdCB5b3XigJlyZSBzYXlpbmcgd2l0aCBBTkQvT1I7IEkgcGVy
c29uYWxseSBzdGlsbCBwcmVmZXIgT1IgYnV0IHdvdWxkbuKAmXQgYXJndWUgdG8gaGFyZCBhZ2Fp
bnN0IEFORCBpZiBvdGhlcnMgcHJlZmVycmVkIGl0Lg0KPj4+Pj4gDQo+Pj4+PiBBcyBmYXIgYXMg
SeKAmW0gY29uY2VybmVkLCB0aGUgZmFjdCB0aGF0IHdl4oCZcmUgcmVkdWNpbmcgbGluZXMgb2Yg
Y29kZSBpc27igJl0IGEgcmVhc29uIHRvIHVzZSB0aGlzIGF0IGFsbC4gIEFzIG91ciBDT0RJTkdf
U1RZTEUgc2F5cywgQVNTRVJUKCkgaXMganVzdCBhIGxvdWRlciBwcmludGsuICBXZSB3b3VsZCBu
ZXZlciBjb25zaWRlciB3cml0aW5nIFBSSU5US19BTkRfUkVUVVJOKCksIGFuZCB3ZSB3b3VsZCBu
ZXZlciBjb25zaWRlciB3cml0aW5nIGEgbWFjcm8gbGlrZSBDT05EUkVUKGNvbmRpdGlvbiwgcmV0
dmFsKSB0byByZXBsYWNlDQo+Pj4+PiANCj4+Pj4+IGlmIChjb25kaXRpb24pDQo+Pj4+PiAgcmV0
dXJuIHJldHZhbDsNCj4+Pj4+IA0KPj4+Pj4gVGhlIG9ubHkganVzdGlmaWNhdGlvbiBmb3IgdGhp
cyBraW5kIG9mIG1hY3JvLCBpbiBteSBvcGluaW9uLCBpcyB0byBhdm9pZCBkdXBsaWNhdGlvbiBl
cnJvcnM7IGkuZS4gcmVwbGFjaW5nIHlvdXIgY29kZSBzZWdtZW50IHdpdGggdGhlIGZvbGxvd2lu
ZzoNCj4+Pj4+IA0KPj4+Pj4gaWYgKGNvbmRpdGlvbikgew0KPj4+Pj4gIEFTU0VSVCghY29uZGl0
aW9uKTsNCj4+Pj4+ICByZXR1cm4gZm9vOw0KPj4+Pj4gfQ0KPj4+Pj4gDQo+Pj4+PiBpcyB1bmRl
c2lyYWJsZSBiZWNhdXNlIHRoZXJl4oCZcyB0b28gbXVjaCByaXNrIHRoYXQgdGhlIGNvbmRpdGlv
bnMgd2lsbCBkcmlmdCBvciBiZSBpbnZlcnRlZCBpbmNvcnJlY3RseS4gQnV0IGhhdmluZyBjb250
cm9sIHN0YXRlbWVudHMgbGlrZSDigJhyZXR1cm7igJkgYW5kIOKAmGNvbnRpbnVl4oCZIGluIGEg
bWFjcm8gaXMgYWxzbyB1bmRlc2lyYWJsZSBpbiBteSBvcGluaW9uOyBJ4oCZbSBwZXJzb25hbGx5
IG5vdCBzdXJlIHdoaWNoIEkgZmluZCBtb3N0IHVuZGVzaXJhYmxlLg0KPj4+Pj4gDQo+Pj4+PiBJ
IGd1ZXNzIG9uZSBhZHZhbnRhZ2Ugb2Ygc29tZXRoaW5nIGxpa2UgQVNTRVJUX09SKGNvbmRpdGlv
biwgcmV0dXJuIGZvbyk7IG9yIEFTU0VSVF9PUihjb25kaXRpb24sIGNvbnRpbnVlKTsgaXMgdGhh
dCBzZWFyY2hpbmcgZm9yIOKAnHJldHVybuKAnSBvciDigJxjb250aW51ZeKAnSB3aWxsIGNvbWUg
dXAgZXZlbiBpZiB5b3XigJlyZSBkb2luZyBhIGNhc2Utc2Vuc2l0aXZlIHNlYXJjaC4gIEJ1dCBJ
4oCZbSBzdGlsbCB3YXJ5IG9mIHVuaW50ZW5kZWQgc2lkZSBlZmZlY3RzLg0KPj4+Pj4gDQo+Pj4+
PiBCZXJ0cmFuZCAvIEp1bGllbiwgYW55IG1vcmUgdGhvdWdodHM/DQo+Pj4+IA0KPj4+PiBJIHRo
aW5rIHRoYXQgaGF2aW5nIG1hY3JvcyB3aGljaCBhcmUgbWFnaWMgbGlrZSB0aGF0IG9uZSB3aGlj
aCBpbmNsdWRlcyBhIHBvc3NpYmxlIHJldHVybiBhbmQgdGhlIGZhY3QgdGhhdCB0aGUgbWFjcm8g
aXMgdGFraW5nIGNvZGUgYXMgYXJndW1lbnQgaXMgbWFraW5nIHRoZSBjb2RlIHJlYWxseSBoYXJk
IHRvIHJlYWQgYW5kIHVuZGVyc3RhbmQgZm9yIHNvbWVvbmUgbm90IGtub3dpbmcgdGhpcy4NCj4+
Pj4gRXZlbiB0aGUgY29kZSBpcyBsb25nZXIgcmlnaHQgbm93LCBpdCBpcyBtb3JlIHJlYWRhYmxl
IGFuZCBlYXN5IHRvIHVuZGVyc3RhbmQgd2hpY2ggbWVhbnMgbGVzcyBjaGFuY2UgZm9yIGVycm9y
cyBzbyBJIGRvIG5vdCB0aGluayB0aGUgbWFjcm8gd2lsbCBhdm9pZCBlcnJvcnMgYnV0IG1pZ2h0
IGluIGZhY3QgaW50cm9kdWNlIHNvbWUgaW4gdGhlIGZ1dHVyZS4NCj4+Pj4gDQo+Pj4+IFNvIEkg
YW0gdm90aW5nIHRvIGtlZXAgdGhlIGN1cnJlbnQgbWFjcm8gYXMgaXQgaXMuDQo+Pj4gDQo+Pj4g
QnV0IHlvdSByZWNhbGwgdGhhdCB0aGVyZSB3ZXJlIHR3byBhc3BlY3RzIHRvIG1lIHdhbnRpbmcg
dGhlIHN3aXRjaD8NCj4+PiAoU291cmNlKSBjb2RlIHNpemUgd2FzIG9ubHkgb25lLiBUaGUgb3Ro
ZXIgd2FzIHRoYXQgQVNTRVJUX1VOUkVBQ0hBQkxFKCkNCj4+PiBkb2Vzbid0IHNob3cgdGhlIG9y
aWdpbmFsIGV4cHJlc3Npb24gd2hpY2ggaGFzIHRyaWdnZXJlZCB0aGUgZmFpbHVyZSwNCj4+PiB1
bmxpa2UgQVNTRVJUKCkgZG9lcy4NCj4+IA0KPj4gU29ycnkgSSBmb2N1c2VkIG9uIHRoZSBtYWNy
byBwYXJ0IGFmdGVyIEp1bGllbiBhc2tlZCBtZSB0byBjb21tZW50IGZyb20gdGhlIEZ1c2EgcG9p
bnQgb2Ygdmlldy4NCj4+IA0KPj4gVGhlIHVzdWFsIGV4cGVjdGF0aW9uIGlzIHRoYXQgYW4gQVNT
RVJUIHNob3VsZCBuZXZlciBvY2N1ciBhbmQgaXMgYW4gaGVscCBmb3IgdGhlIHByb2dyYW1tZXIg
dG8gZGV0ZWN0IHByb2dyYW1taW5nIGVycm9ycy4gVXN1YWxseSBhbiBhc3NlcnQgaXMgY3Jhc2hp
bmcgdGhlIGFwcGxpY2F0aW9uIHdpdGggYW4gaW5mb3JtYXRpb24gb2Ygd2hlcmUgYW4gYXNzZXJ0
IHdhcyB0cmlnZ2VyZWQuDQo+PiBJbiB0aGUgY3VycmVudCBjYXNlLCB0aGUgYXNzZXJ0IGlzIHVz
ZWQgYXMgZGVidWcgcHJpbnQgYW5kIGluIHByb2R1Y3Rpb24gbW9kZSBhbiBlcnJvciBpcyByZXR1
cm5lZCBpZiB0aGlzIGlzIGhhcHBlbmluZyB3aXRob3V0IGFueSBwcmludC4gSXNu4oCZdCB0aGlz
IGEgZGVidWcgcHJpbnQgY2FzZSBpbnN0ZWFkIG9mIGFuIGFzc2VydCA/DQo+IA0KPiBEZXBlbmRz
IG9uIHRoZSB0ZXJtaW5vbG9neSB5b3Ugd2FudCB0byB1c2U6IE91ciBBU1NFUlQoKSBpcyBpbiBu
byB3YXkNCj4gZGlmZmVyZW50IGluIHRoaXMgcmVnYXJkIGZyb20gdGhlIEMgc3RhbmRhcmQncyBh
c3NlcnQoKS4gVGhlIG1lc3NhZ2UNCj4gbG9nZ2VkIGlzIG9mIGNvdXJzZSB0byBhaWQgdGhlIGRl
dmVsb3BlcnMuIEJ1dCBwZXJzb25hbGx5IEknZCBjYWxsIGl0DQo+IG1vcmUgdGhhbiBqdXN0IGEg
ImRlYnVnIHByaW50Ii4NCg0KQnV0IGl0IHdpbGwgYmUgaWYgd2UgY2hhbmdlIGl0LiBCdXQgSSBh
Z3JlZSB3aXRoIHlvdSBpdCBpcyBtb3JlIHRoYW4gYSBkZWJ1ZyBwcmludC4NCg0KQmVydHJhbmQN
Cg0KPiANCj4gSmFuDQoNCg==

