Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA29512F51
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 11:09:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316314.535200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk09G-00062N-E3; Thu, 28 Apr 2022 09:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316314.535200; Thu, 28 Apr 2022 09:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk09G-00060Y-AX; Thu, 28 Apr 2022 09:09:18 +0000
Received: by outflank-mailman (input) for mailman id 316314;
 Thu, 28 Apr 2022 09:09:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0mdi=VG=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nk09E-00060S-Ea
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 09:09:16 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe02::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dea3f131-c6d2-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 11:09:13 +0200 (CEST)
Received: from AS9PR06CA0147.eurprd06.prod.outlook.com (2603:10a6:20b:467::19)
 by AM0PR08MB5299.eurprd08.prod.outlook.com (2603:10a6:208:18d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 28 Apr
 2022 09:09:10 +0000
Received: from VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:467:cafe::fa) by AS9PR06CA0147.outlook.office365.com
 (2603:10a6:20b:467::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12 via Frontend
 Transport; Thu, 28 Apr 2022 09:09:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT056.mail.protection.outlook.com (10.152.19.28) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Thu, 28 Apr 2022 09:09:10 +0000
Received: ("Tessian outbound ac9bb5dd84f6:v118");
 Thu, 28 Apr 2022 09:09:09 +0000
Received: from 6385f8487a9e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 06759B73-D107-4AFC-AEAF-13142CFFF3A0.1; 
 Thu, 28 Apr 2022 09:09:02 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6385f8487a9e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 28 Apr 2022 09:09:02 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB4177.eurprd08.prod.outlook.com (2603:10a6:208:132::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 28 Apr
 2022 09:09:00 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5186.021; Thu, 28 Apr 2022
 09:09:00 +0000
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
X-Inumbo-ID: dea3f131-c6d2-11ec-8fc3-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hnXm77gFIcRR72cR1zBQzaj8L/yIX04bbSIb2IVpVHECdipG8s+jGIKVQvaBKWGxCIUd1m5x68/2NbIgYlu4SQViOlm0NU49uze7GkR6+OpWExs0gjb3CbaNITY3zuHdcHfBgVTqikGgDIgqsl2o7cY2augIEBRhDln2io/P0Wom0YhZ9eLrS/FWlWCioZ/79ewfdzd+TV/aNhCZWsbjB9Qq1/TRJcl52SkLy+6muXiZeIC3NMBul9RXXX9xosr/mMEGiY+SOmo3C96uBD2s+yZ+8LebAStWFW7UVvFsVpj03FS4Czt5HAiuMe479kjILoBukLuDZBEKinDTCoCZKg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LxXuvm4zJHuHXb7mdtjidzZHZTaVj7hHHBohfoKEBg=;
 b=LFuBlIdpYlLNZ6MdZmtClZ3vvGGuhxzO8n/sL4BQZpT8NyfAqGHnamO03IE+hWaUXYOMckAy1llTisMxCkRs/nhxNQWQAee97lY/uWjOm2GDfurHoAiBkA+CyjLoQ+0Yla0hBLx1bqXHlNnATzL+luiLQKGrgWqicmxw67qnArpT2Ili4fS6HQ8tmdeh5llHYNIvO9ZyNPdeNrYdYzIuPuYoUZeXLlDXfL3avHibCmA0PLFIy/cMkH50Z2jRWEbznIdHjlxtfCry4Y9lR/FOOg3lLMJHual0d87fPt3fibApodw+KPR+nducCLQ8CzFRbL9p04NqjG4mO5qKJGR+nA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LxXuvm4zJHuHXb7mdtjidzZHZTaVj7hHHBohfoKEBg=;
 b=TYvOnZR2j5EamKIzrAFquQbFtrEUt4x0c3OtcNTFfwrSMze8pUSE/y4Bo+tvxeeulN84T2k49dPaN7bBsSXOLR3xvDu2So0ezXrcvINKDAGexiYE2nVSdArKbDsdWhNlfmojYQSYmeVktgGL91M4nQlJjPW+1VSZsxPTWAxZtMg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7cc576c64a7b302e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfmnG4u3YynRiGgEjpaTDCwn05ou59hnYlXPXEaEFeH+tICl4XJT9bZQCIp9SVmZXSjoxHkeu+Njjw/b16qLKa+V5CC04za/l+SIngCYPsenbjySy2yV+LflVfUA+5K9LnhY2tqjMbBLdI3u82TAA1H0AsjVwoHAESIj68vpUXSgivvL0eHRVBNjW/hwxbxtU+a4+Jfkjjt9GvGsrMgPPbJKgFYGZJ9oj/1Hq4RkqKqQaTw8AcjhgM9A/NA6vLCjebX+dyk76/N59KVxSAl4O8HdMYKpctPzWgvJ8WIzW3Kl7l2BCGL5wFeQbCi9lBKG3SRQiO7fLBwA6xhH8elhfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LxXuvm4zJHuHXb7mdtjidzZHZTaVj7hHHBohfoKEBg=;
 b=WnhbBUCgN+SGnbk/KE4S7shqWYAUPCap2diizUM+xqxDTpIYTPuSEM/fQTD48rSF4yu0yGOLomXSFyL1+4pfg0/Nmmj7aW8sFaCSsszrq3VVDUkDUX8LNq+Tygn2RBn01JbM6V6SCFp720TNLqNZ5B5aW+z/YRoknzrFWPHoWBRJVnMT3mO0dzBnCsh5/hL4kcvJGO9KfapeR3krMCBJJlqV8U12NISVFeUk5/HEM5IdSdAPKh/rQKKLJOmJG+MZUsIVID8IeKu306uGuQ2o4Yypt6jGMN+yKlco3XJQ1XtPig7MvR8kKMcnw8TxT7cRunmeWCgk2Sv0lVVOtcxotw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LxXuvm4zJHuHXb7mdtjidzZHZTaVj7hHHBohfoKEBg=;
 b=TYvOnZR2j5EamKIzrAFquQbFtrEUt4x0c3OtcNTFfwrSMze8pUSE/y4Bo+tvxeeulN84T2k49dPaN7bBsSXOLR3xvDu2So0ezXrcvINKDAGexiYE2nVSdArKbDsdWhNlfmojYQSYmeVktgGL91M4nQlJjPW+1VSZsxPTWAxZtMg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin
 Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v2 1/2] PCI: replace stray uses of PCI_{DEVFN,BDF}2()
Thread-Topic: [PATCH v2 1/2] PCI: replace stray uses of PCI_{DEVFN,BDF}2()
Thread-Index: AQHYVYvat6E8kIbOXkmbFmJIRAA5Ka0FFBoA
Date: Thu, 28 Apr 2022 09:09:00 +0000
Message-ID: <EDF88376-47C1-426E-A6ED-A3A6365EFC8E@arm.com>
References: <9a471a5f-497b-1015-8554-68117863f48a@suse.com>
 <6dd6719f-a05d-3f90-95b5-0ce9b5b0a2da@suse.com>
In-Reply-To: <6dd6719f-a05d-3f90-95b5-0ce9b5b0a2da@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 16cc3d9d-9cea-4fcd-7177-08da28f6c1a4
x-ms-traffictypediagnostic:
	AM0PR08MB4177:EE_|VE1EUR03FT056:EE_|AM0PR08MB5299:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB5299DB4DEBD191C8AB95422D9DFD9@AM0PR08MB5299.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nxXpXofU+m83izspC8tSW7QmK+rnNtfVoIErD0K/LAuRXCDaHoMr6X+G+GlBkqGMPN5p5u1oG/Ro00l+8m1/UhgwBIx/WZHIMyuwTdQQU2NEls295oWAgRA4aIKs0JlfMtgmi+aHc1+Gt0ZTVqJyTyoqz2YTfxo/YUnzdDAbMLptA6L0finIyZ8mboaCIv9h/VUhcDcV3P+pWhMQOicyOTyoiNvwjLZKPvNcaDgoY0dTrnpRk8RzOkCadYLBMu5UhZjz2fnv7Wq1KKlBs/FLaYQY1TgraWDdjTUP2xszdMpCf8wElAD+Rz3O7P5GbjzuLnFqqmHqHJtF49UHvZS/wSdiE4OtSf115eINdoAcxvVobGMz58KKsYYrloLRJ7n5+93B+7SS14ud7lm6VwdQYQe/2kbky1Y8wawmCyj8cNK6bSfHhgcNduEeAtWt6/TCcL3/X/QeLsxxkSZng4ov8oljKppO9Y91Mo9ZrvmAeIRcW1rkmEALMK1TEl9Lkywg7Xg0Zg090oNCQekjtID92OEgHpcC2hazv3p3qRMNBEJg/2t+LlZTOGqvRpWT0FwYv211KvApfQ8QsV/z917ZB7vs2yxtdSIvyGKq7FHSxq3UoHFw+5XcuiXvy+Z5ihSJ5+ZyJGciUeY8zo0us+yx31EUjJgmAk4V0fwIjvX1Wyh1rvnEp8X6U+XIdPgFSJsnVIJHRv/8AvbZ4QdqqQQ9D7j/TS1mwD/KJ3coi5lLjCmMIZZ2ffA2c1oCV59y4kvQ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(33656002)(8676002)(8936002)(76116006)(7416002)(4326008)(64756008)(91956017)(66476007)(66556008)(6486002)(66946007)(122000001)(5660300002)(508600001)(38100700002)(2616005)(66446008)(71200400001)(54906003)(316002)(26005)(6506007)(6512007)(186003)(6916009)(38070700005)(2906002)(86362001)(53546011)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7C639B44D8DC04EB11E3DF67B1D9A77@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4177
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	18a9cdd3-8e4e-4ae9-95ed-08da28f6bbe4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Nnxkr/mT/iPxFl+RrujWLXLFRPjRv9YE9wsdF5ImdgDOHRuixciaZg762EyDEaAlqAY+Vf0lEQrjp57+GnXxZo+jLsY+zBTtlNt/3XdP4D9qNEomWCsLU68YjXeRBj7igL3EM7WPiTHf6kiEBLIl7RDjp9oX4VnA5rKDU4a6cGF7BsiVQSPhXcAEle6yO3ARTZf03fj92T7qLyQarcrHdYMLoNw89avQvsocUvmk8aQxO2K8drlJxQwHXr7V2jPLD812HqYGoLeAj5ZuMV8cAX2RugZUwAAskaw94sXOjFWOpdVbd+pJd/Rp525VwhDYlA0ykNmmPuK09wLyVEsU5zwgP6NUJDqlFI6vrl2b7kR/ZZGWUUP3tSgs0+py+RbrRomfZWPIHQo+5nYb9c16Z6t3yE7Yd4JifrWQooqWb4+QB4D0hhJYru0Kg9nierMT1yOR1iBAGRSLuJVj4zOoyGe5qeJPYW7jn4mgbJMsppQeYaEi9yi+EwW1Dd/FkU6Wzsos2uuhpvwr9sumI02GU2du4qcIXkvt5bedPDJTV27N/X/GxN9/1DSLCIb+4WIUnVVe04rEBUaosk5znoI17Y37DPXyyyKJ0DO9p5w6vNJ6ESZUyYttR/YiY6OzKiSON7Zn13E6cHnPyelV1yFMQZa/iUWGJ3pHlqAI8qoc41YDf6AQllwX6bdKluZvaakN
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(82310400005)(2906002)(81166007)(54906003)(70206006)(70586007)(356005)(8676002)(316002)(508600001)(4326008)(6862004)(40460700003)(5660300002)(8936002)(86362001)(47076005)(6486002)(53546011)(36860700001)(107886003)(6506007)(33656002)(186003)(6512007)(2616005)(26005)(36756003)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 09:09:10.1098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16cc3d9d-9cea-4fcd-7177-08da28f6c1a4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5299

SGkgSmFuLA0KDQo+IE9uIDIxIEFwciAyMDIyLCBhdCAxNToyNiwgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IFRoZXJlJ3Mgbm8gZ29vZCByZWFzb24gdG8gdXNl
IHRoZXNlIHdoZW4gd2UgYWxyZWFkeSBoYXZlIGEgcGNpX3NiZGZfdA0KPiB0eXBlIG9iamVjdCBh
dmFpbGFibGUuIFRoaXMgZXh0ZW5kcyB0byB0aGUgdXNlIG9mIFBDSV9CVVMoKSBpbg0KPiBwY2lf
ZWNhbV9tYXBfYnVzKCkgYXMgd2VsbC4NCj4gDQo+IE5vIGNoYW5nZSB0byBnZW5lcmF0ZWQgY29k
ZSAod2l0aCBnY2MxMSBhdCBsZWFzdCwgYW5kIEkgaGF2ZSB0byBhZG1pdA0KPiB0aGF0IEkgZGlk
bid0IGV4cGVjdCBjb21waWxlcnMgdG8gbmVjZXNzYXJpbHkgYmUgYWJsZSB0byBzcG90IHRoZQ0K
PiBvcHRpbWl6YXRpb24gcG90ZW50aWFsIG9uIHRoZSBvcmlnaW5hbCBjb2RlKS4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gUmV2aWV3ZWQt
Ynk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBSZXZpZXdlZC1i
eTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQpSZXZpZXdlZC1ieTogQmVydHJh
bmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KDQpTb3JyeSBJIG1pc3NlZCBp
dC4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQoNCj4gLS0tDQo+IE5vdGUgdGhhdCB0aGUgQXJtIGNo
YW5nZXMgYXJlICJibGluZCI6IEkgaGF2ZW4ndCBiZWVuIGFibGUgdG8gc3BvdCBhIHdheQ0KPiB0
byBhdCBsZWFzdCBjb21waWxlIHRlc3QgdGhlIGNoYW5nZXMgdGhlcmU7IHRoZSBjb2RlIGxvb2tz
IHRvIGJlDQo+IGVudGlyZWx5IGRlYWQuDQo+IC0tLQ0KPiB2MjogQXJtIGJ1aWxkIGZpeCAoZm9y
IHRob3NlIHdobyBhY3R1YWxseSBoYXZlIHdheXMgdG8gYnVpbGQgdGhlIEFybQ0KPiAgICBjb2Rl
IGJlaW5nIGNoYW5nZWQgaGVyZSkuDQo+IA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vcGNpL2VjYW0u
Yw0KPiArKysgYi94ZW4vYXJjaC9hcm0vcGNpL2VjYW0uYw0KPiBAQCAtMjgsOCArMjgsNyBAQCB2
b2lkIF9faW9tZW0gKnBjaV9lY2FtX21hcF9idXMoc3RydWN0IHBjDQo+ICAgICAgICAgY29udGFp
bmVyX29mKGJyaWRnZS0+b3BzLCBjb25zdCBzdHJ1Y3QgcGNpX2VjYW1fb3BzLCBwY2lfb3BzKTsN
Cj4gICAgIHVuc2lnbmVkIGludCBkZXZmbl9zaGlmdCA9IG9wcy0+YnVzX3NoaWZ0IC0gODsNCj4g
ICAgIHZvaWQgX19pb21lbSAqYmFzZTsNCj4gLQ0KPiAtICAgIHVuc2lnbmVkIGludCBidXNuID0g
UENJX0JVUyhzYmRmLmJkZik7DQo+ICsgICAgdW5zaWduZWQgaW50IGJ1c24gPSBzYmRmLmJ1czsN
Cj4gDQo+ICAgICBpZiAoIGJ1c24gPCBjZmctPmJ1c25fc3RhcnQgfHwgYnVzbiA+IGNmZy0+YnVz
bl9lbmQgKQ0KPiAgICAgICAgIHJldHVybiBOVUxMOw0KPiBAQCAtMzcsNyArMzYsNyBAQCB2b2lk
IF9faW9tZW0gKnBjaV9lY2FtX21hcF9idXMoc3RydWN0IHBjDQo+ICAgICBidXNuIC09IGNmZy0+
YnVzbl9zdGFydDsNCj4gICAgIGJhc2UgPSBjZmctPndpbiArIChidXNuIDw8IG9wcy0+YnVzX3No
aWZ0KTsNCj4gDQo+IC0gICAgcmV0dXJuIGJhc2UgKyAoUENJX0RFVkZOMihzYmRmLmJkZikgPDwg
ZGV2Zm5fc2hpZnQpICsgd2hlcmU7DQo+ICsgICAgcmV0dXJuIGJhc2UgKyAoc2JkZi5kZXZmbiA8
PCBkZXZmbl9zaGlmdCkgKyB3aGVyZTsNCj4gfQ0KPiANCj4gYm9vbCBfX2luaXQgcGNpX2VjYW1f
bmVlZF9wMm1faHdkb21fbWFwcGluZyhzdHJ1Y3QgZG9tYWluICpkLA0KPiAtLS0gYS94ZW4vYXJj
aC94ODYvbXNpLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L21zaS5jDQo+IEBAIC04MzksNyArODM5
LDcgQEAgc3RhdGljIGludCBtc2l4X2NhcGFiaWxpdHlfaW5pdChzdHJ1Y3QgcA0KPiAgICAgICAg
ICAgICBwYnVzID0gZGV2LT5pbmZvLnBoeXNmbi5idXM7DQo+ICAgICAgICAgICAgIHBzbG90ID0g
UENJX1NMT1QoZGV2LT5pbmZvLnBoeXNmbi5kZXZmbik7DQo+ICAgICAgICAgICAgIHBmdW5jID0g
UENJX0ZVTkMoZGV2LT5pbmZvLnBoeXNmbi5kZXZmbik7DQo+IC0gICAgICAgICAgICB2ZiA9IFBD
SV9CREYyKGRldi0+YnVzLCBkZXYtPmRldmZuKTsNCj4gKyAgICAgICAgICAgIHZmID0gZGV2LT5z
YmRmLmJkZjsNCj4gICAgICAgICB9DQo+IA0KPiAgICAgICAgIHRhYmxlX3BhZGRyID0gcmVhZF9w
Y2lfbWVtX2JhcihzZWcsIHBidXMsIHBzbG90LCBwZnVuYywgYmlyLCB2Zik7DQo+IC0tLSBhL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9xaW52YWwuYw0KPiArKysgYi94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC92dGQvcWludmFsLmMNCj4gQEAgLTI2Nyw3ICsyNjcsNyBAQCBpbnQgcWludmFs
X2RldmljZV9pb3RsYl9zeW5jKHN0cnVjdCB2dGRfDQo+ICAgICBxaW52YWxfZW50cnktPnEuZGV2
X2lvdGxiX2ludl9kc2MubG8ucmVzXzEgPSAwOw0KPiAgICAgcWludmFsX2VudHJ5LT5xLmRldl9p
b3RsYl9pbnZfZHNjLmxvLm1heF9pbnZzX3BlbmQgPSBwZGV2LT5hdHMucXVldWVfZGVwdGg7DQo+
ICAgICBxaW52YWxfZW50cnktPnEuZGV2X2lvdGxiX2ludl9kc2MubG8ucmVzXzIgPSAwOw0KPiAt
ICAgIHFpbnZhbF9lbnRyeS0+cS5kZXZfaW90bGJfaW52X2RzYy5sby5zaWQgPSBQQ0lfQkRGMihw
ZGV2LT5idXMsIHBkZXYtPmRldmZuKTsNCj4gKyAgICBxaW52YWxfZW50cnktPnEuZGV2X2lvdGxi
X2ludl9kc2MubG8uc2lkID0gcGRldi0+c2JkZi5iZGY7DQo+ICAgICBxaW52YWxfZW50cnktPnEu
ZGV2X2lvdGxiX2ludl9kc2MubG8ucmVzXzMgPSAwOw0KPiANCj4gICAgIHFpbnZhbF9lbnRyeS0+
cS5kZXZfaW90bGJfaW52X2RzYy5oaS5zaXplID0gc2l6ZTsNCj4gDQoNCg==

