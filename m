Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA5A620DFF
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 12:01:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439930.693980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osMLv-0002os-8F; Tue, 08 Nov 2022 11:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439930.693980; Tue, 08 Nov 2022 11:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osMLv-0002m4-4j; Tue, 08 Nov 2022 11:01:11 +0000
Received: by outflank-mailman (input) for mailman id 439930;
 Tue, 08 Nov 2022 11:01:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RwHN=3I=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1osMLt-00015v-82
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 11:01:09 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2044.outbound.protection.outlook.com [40.107.104.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5ab29be-5f54-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 12:01:08 +0100 (CET)
Received: from FR3P281CA0122.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:94::6) by
 PAVPR08MB9260.eurprd08.prod.outlook.com (2603:10a6:102:306::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 11:01:02 +0000
Received: from VI1EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:94:cafe::c7) by FR3P281CA0122.outlook.office365.com
 (2603:10a6:d10:94::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11 via Frontend
 Transport; Tue, 8 Nov 2022 11:01:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT062.mail.protection.outlook.com (100.127.145.26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Tue, 8 Nov 2022 11:01:01 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Tue, 08 Nov 2022 11:01:01 +0000
Received: from b71c067ee86c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 651C6947-58E7-4196-AF70-E0AB5ED5C003.1; 
 Tue, 08 Nov 2022 11:00:51 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b71c067ee86c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Nov 2022 11:00:51 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AM9PR08MB6658.eurprd08.prod.outlook.com (2603:10a6:20b:303::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 11:00:48 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::a504:d47b:217:4893]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::a504:d47b:217:4893%4]) with mapi id 15.20.5813.011; Tue, 8 Nov 2022
 11:00:48 +0000
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
X-Inumbo-ID: a5ab29be-5f54-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=QstSyg877W2uA89u/NU6Cj6imolVLNnnFcYQr2uxJ6OkFXNxSvlEV2HfvBBIzcYYndIEVcQGfjn/rdlrKRt1Yr2RxDqSszozMAoZClYOOHLMjI5RtI1MUN2LLdq+EtB5oz11lAD/4SA0R9i2ZA9Xqu8mMNWPLRGJdyy63JMPqcPsNKYZn5XVqSp7ENpxU9Vxs8dU4W1o9IT8iUK9hS/286iMIJ8dUIdxdwbtvstiJOMtR2pQ8Y3pvPtR7KaWEx0nPyOg8ivBGDVEo1viRd4fQe7lNu0iaDmXNks1iChNriaWjoQI21LYznkQs2gwPn0QN/iUlPa+KjoS7W47c2ausw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziW/iULUAbBB1IoqvVvfagfEsim2NtZox8AdGitTvIA=;
 b=D4J12t8zImHd9SHavSzqSA0k2F29SEAEwmSUS1JlcuYvdgYRzvVnAJhsfUyhOZ+X++KKUpvtcdiWYFVYOlpXUlPv1spuuxlcCBP5B81SI9/BgSI/zMrV0PRWewwvVfFeqIZzSuG5h+29LW/xAZNrmU9xLP7NAPmyTss7wa8FQ1SzlAGbwGLmvnj1uy7XzFoBE5VRoyNV6xsAyI9oA6AWMJkriVpW7NFDdhLMYK1wwuEl4X3V055nLcVxDsfGQ7D4c1gJ+QSYoKeLF1zFmTGvlVHZWG7Ng2bGbJixxfIOFA9UbYe4l2b0w74A3hozY4b4HZJR5B5yVEnKTb5YT529Zw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziW/iULUAbBB1IoqvVvfagfEsim2NtZox8AdGitTvIA=;
 b=zc32Nc8/Kcls3qxKTRsE0R3XDLd+j7qgn2J4qvXsFGrretqwsUgvcECal1yZPomW3HiYtICrvm0s9V+h4jmKiYea+cmXmzKN+2xai2+ItRsnU5/V0gxdSHhc1XeVZiF8ESfaIu2iyBUJDfMGABdKqUbzGZTdWpC7MYlvtIAG1gQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e0c21e4067a79a0a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kcotjXmZZPQTk0EgHGQwHjOd211YGd80iAj6CQZqnziYvdnzzCVwdM+WIErbkFPGbd5zJe5d/tdoWOM9FCWIKHnaTsK5Ejo/lzWlElg7Fm/bXwDprSZEiZQ9TItUPSgKHazW5R5Y2IwQ2qH+6hIpDD6CSVt9pwgH62oa4ugBgTR6CX7eM8HTX6yS7ocD8HClIYNTi+NfsKIvcCR0QmsLZZ7eCtWeRfMJ872/oM+vR7tYWsJXB1vkyUAxZAzJwh1LqqzjZHCQKB68huEXPLIc/uNA5z4nf3K1y5rBCnH2ukSrWpBKXpj835WGt3wjXu3sZgYGh5mKyq4Iu+u8OhHRMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziW/iULUAbBB1IoqvVvfagfEsim2NtZox8AdGitTvIA=;
 b=RiaDkWc+YToM2N7oSOYJ5KHyRgbnCffFpOXSouHPcXhSds5nMG4l1Zb2alxr13hTNf98B1eczdPM1DhugHaAiYkd9RpxALHHBfRBQUBXUabAICBVe6p30ZqAA5niMIBrHemdTxDamzxVf5D0e4TzEr0kzJXniT9F4r2lXgJi6DOteM7Fs6Cr3xFxzPOUGoDgxO8hXLX8iYQuLlkIlMBgxQzn8AW4/ewwtC8n7gFPjNEkpmYMohb0u4+lAKdkzBnuJQ4jc4ZS03txZIaL5ZVx7RepG9SQFG6lBEv5vb0iiEuzlsY/3MMl2QPfxuEI5Kq5UWQ9DLsCJbnfQjmUhRHNQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziW/iULUAbBB1IoqvVvfagfEsim2NtZox8AdGitTvIA=;
 b=zc32Nc8/Kcls3qxKTRsE0R3XDLd+j7qgn2J4qvXsFGrretqwsUgvcECal1yZPomW3HiYtICrvm0s9V+h4jmKiYea+cmXmzKN+2xai2+ItRsnU5/V0gxdSHhc1XeVZiF8ESfaIu2iyBUJDfMGABdKqUbzGZTdWpC7MYlvtIAG1gQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 4/4] xen: Justify linker script defined symbols in
 include/xen/kernel.h
Thread-Topic: [RFC PATCH 4/4] xen: Justify linker script defined symbols in
 include/xen/kernel.h
Thread-Index: AQHY8pZ4QA3C9Pi6Y066NaE9A9ULoK4zWNUAgAABAICAABGdgIAAZ3AAgAEKpoA=
Date: Tue, 8 Nov 2022 11:00:47 +0000
Message-ID: <5B9130CD-BC40-42E3-8D79-DABC321AFF13@arm.com>
References: <20221107104739.10404-1-luca.fancellu@arm.com>
 <20221107104739.10404-5-luca.fancellu@arm.com>
 <5caf911d-e96d-39e4-d945-db6537412f60@suse.com>
 <3925276F-8B6E-4B19-9EC2-C085FE88A637@arm.com>
 <933c4227-5839-312e-3996-693a7d8f7706@suse.com>
 <f338e43f-d77d-06e9-ee50-7fc691848bb0@xen.org>
In-Reply-To: <f338e43f-d77d-06e9-ee50-7fc691848bb0@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3809:EE_|AM9PR08MB6658:EE_|VI1EUR03FT062:EE_|PAVPR08MB9260:EE_
X-MS-Office365-Filtering-Correlation-Id: ecd72bcb-f346-40b0-f7d9-08dac1788621
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 50qavyV9cvEmS29XYDBA7abnWCDjx7vB5QZASd5A94CekvoI/xmEQq7poz5v9jo2rCRJVlIAas878l9TzNNyyISLxmS8Qo4QZENBCsDdiE37Ff276KYO//h8HoGz+KdZCCqPz4Psy+RqG4b7C+OvxCrHU1ULXGcI85YQebmk0dO25nAISkCADiIc7Jbs5traswx7j5Ztrwa6RzEHatiMeU5oE8mwiYTf3VIadytnBedgU1EqBN5jwYxVpoW8zaBcw707rnk5UdNyoBWo82Pyj/A4s0fm2vUZa1/kWQVCKzDuGSazVm3I7t9HFgBmS4QuRLW4AuwTGl/ekjFHlYaaHrf69p+ixrgRjkhsY14v1RxYH0uAhs+FItapLL13pFdOnZRaFliqIB3u4p2Ei42adR69T8FjrOFzX8fPEiO9uxDIXFFV8xPTwYCJBAl5SJwX2xc+MCmWjsVDn5m0IHyLF16JwZiZ5TN8RqpnEdTWVkLsDkZlwu9CGwDcB1d/XwiW+OjLdfUpWmkYKdWOZqOKFpM7JX3LzKYdmEN6uNLLUqBvKHYZ99UhUbsShCtkUXm1RNVcupsAnE7e7t1vP5zFGzvURR4H1ZsBhT4OS/Rldgn+mhvYNmi4Gf0Pd8JJIjbxjkM1y1rxMqRUBDGIuLvrXMuDWUrFgjvKGmMhdB+JFJ0TZmrdM8w5WyOKKTVIMppk0cw3HAgxD9L89rB+vjGs5h1lhkkeE83h1B3NL3tzvNPRiW0v62JYDOMQ+m5gOciTdAcfcvp+LCCtldgeMBayOb2h5sy3g+82FprH+vnLz+o=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(451199015)(66476007)(54906003)(186003)(6916009)(8936002)(316002)(6506007)(36756003)(53546011)(5660300002)(41300700001)(76116006)(4326008)(2906002)(66946007)(64756008)(66556008)(33656002)(26005)(66446008)(91956017)(2616005)(6512007)(8676002)(478600001)(6486002)(38070700005)(86362001)(71200400001)(38100700002)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F308080BD1CFEE4FBBE85748E6531C86@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6658
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8d36cb9c-e62e-4117-82b5-08dac1787df9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lsJdAhjdzbTzKdPXSOoFqRFQAfXY1dAKMHaslzh9cxFlh11Xt0XN/507di76ZWfIcOBz7DxxmNbmQCQWkysihaVfTkVunaKEZKZJCiwbppgvaGyDHOMBWIRdTR2vv932Qp3jfeDO3b5DBPJl4jgerDocyuLb8VsG15ZiXnGFqsw6aoIbSORVt+HOBOQbfMkAx7LM3p4M8iaaOZOiRqDB83HsGcGtxe7v5BmUMlOw+JpqUptCucFHyejn084fKLpwk188CjQWhFPCMD+rYhybVnRQTvXVvNIamV8CsDeurmp/jJProupvKxMRwLeQKNmGc9XNsxR5pvO/UO1omBmR2jUa7khwtZOuWCPIVRZToAv35dWIzkKAaW59SvdFV24yfmYoKkC85HC7w7tzr4+FbJOBYnwd8YQcyHt4nC8alMPD5ga/MBDs+wTTdWdgss4Qa3btbCQ6ruI2ZLcnGrPzeA0r/GaahFmMdrP1LgfCfXKWk6TEypfsM4jY11l6VRWKFCY+maBAIR0/3GY/7fVi8o8S7AhIrG+QkcJNl8JS5GHA7H4j8XQ6r9YkTz9fcOH7tST9ef/jP/jzIk8BCIioZ5OiWdqqnYyiRHZW8f7pTgClm6cwAaSegN4n88H9ERYrZj+cQZrfU/VsmK3pssVgt1QlrENMTi1IJw/U6LEhl9tup6L9QsmtV/NgzMRuRXBqQQPZgynYx2o2vQjj1u67CFyEvoxZFGhDI89+PeHXQUbrGH2rAbW0bxOR6AEXpkrDJt81P1smqrh5mp0vbf4RLg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199015)(46966006)(36840700001)(40470700004)(82740400003)(356005)(40460700003)(81166007)(6862004)(36860700001)(70206006)(70586007)(4326008)(8676002)(41300700001)(8936002)(54906003)(316002)(36756003)(82310400005)(2906002)(40480700001)(47076005)(336012)(53546011)(6506007)(6512007)(26005)(6486002)(478600001)(2616005)(186003)(5660300002)(33656002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 11:01:01.5862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecd72bcb-f346-40b0-f7d9-08dac1788621
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9260



> On 7 Nov 2022, at 19:06, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 07/11/2022 12:56, Jan Beulich wrote:
>> On 07.11.2022 12:53, Luca Fancellu wrote:
>>>> On 7 Nov 2022, at 11:49, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 07.11.2022 11:47, Luca Fancellu wrote:
>>>>> --- a/xen/include/xen/kernel.h
>>>>> +++ b/xen/include/xen/kernel.h
>>>>> @@ -65,24 +65,28 @@
>>>>> 	1;                                      \
>>>>> })
>>>>>=20
>>>>> +/* SAF-0-safe R8.6 linker script defined symbols */
>>>>> extern char _start[], _end[], start[];
>>>>> #define is_kernel(p) ({                         \
>>>>>     char *__p =3D (char *)(unsigned long)(p);     \
>>>>>     (__p >=3D _start) && (__p < _end);            \
>>>>> })
>>>>>=20
>>>>> +/* SAF-0-safe R8.6 linker script defined symbols */
>>>>> extern char _stext[], _etext[];
>>>>> #define is_kernel_text(p) ({                    \
>>>>>     char *__p =3D (char *)(unsigned long)(p);     \
>>>>>     (__p >=3D _stext) && (__p < _etext);          \
>>>>> })
>>>>>=20
>>>>> +/* SAF-0-safe R8.6 linker script defined symbols */
>>>>> extern const char _srodata[], _erodata[];
>>>>> #define is_kernel_rodata(p) ({                  \
>>>>>     const char *__p =3D (const char *)(unsigned long)(p);     \
>>>>>     (__p >=3D _srodata) && (__p < _erodata);      \
>>>>> })
>>>>>=20
>>>>> +/* SAF-0-safe R8.6 linker script defined symbols */
>>>>> extern char _sinittext[], _einittext[];
>>>>> #define is_kernel_inittext(p) ({                \
>>>>>     char *__p =3D (char *)(unsigned long)(p);     \
>>>>=20
>>>> Why the "R8.6" everywhere here? Didn't we agree that the in-code
>>>> comments should be tool-agnostic?
>>>=20
>>> The R8.6 is not tool specific, it is to give the quick hint that we are=
 deviating
>>> from MISRA Rule 8.6.
>> Well, yes, "tool" was wrong for me to write. Imo references to a specifi=
c
>> spec should equally be avoided in in-code comments, as other specs may
>> turn up.
>=20
> +1. The comment duplication is not great and sometimes even a short expla=
nation it may not fit in 80 characters (AFAICT the justification should be =
a one line comment).
>=20

Ok we can remove the R8.6 from the comments, is the remaining part ok?


> Cheers,
>=20
> --=20
> Julien Grall


