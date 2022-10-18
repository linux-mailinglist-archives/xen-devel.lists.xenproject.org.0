Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 913EE60302B
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 17:50:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425292.673013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okor6-0002LI-LB; Tue, 18 Oct 2022 15:50:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425292.673013; Tue, 18 Oct 2022 15:50:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okor6-0002IP-Gx; Tue, 18 Oct 2022 15:50:12 +0000
Received: by outflank-mailman (input) for mailman id 425292;
 Tue, 18 Oct 2022 15:50:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=opEU=2T=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1okor4-0002IJ-Lp
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 15:50:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2064.outbound.protection.outlook.com [40.107.21.64])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a1c375a-4efc-11ed-91b4-6bf2151ebd3b;
 Tue, 18 Oct 2022 17:50:07 +0200 (CEST)
Received: from AS9PR04CA0045.eurprd04.prod.outlook.com (2603:10a6:20b:46a::15)
 by AS2PR08MB10252.eurprd08.prod.outlook.com (2603:10a6:20b:648::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Tue, 18 Oct
 2022 15:50:06 +0000
Received: from AM7EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46a:cafe::7) by AS9PR04CA0045.outlook.office365.com
 (2603:10a6:20b:46a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Tue, 18 Oct 2022 15:50:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT035.mail.protection.outlook.com (100.127.141.24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Tue, 18 Oct 2022 15:50:05 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Tue, 18 Oct 2022 15:50:05 +0000
Received: from 8b9259c5e38a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0161C0DD-4DB6-49E1-96A0-C755D4F87060.1; 
 Tue, 18 Oct 2022 15:49:54 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8b9259c5e38a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Oct 2022 15:49:54 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by GV1PR08MB8306.eurprd08.prod.outlook.com (2603:10a6:150:a3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Tue, 18 Oct
 2022 15:49:51 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef%7]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 15:49:51 +0000
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
X-Inumbo-ID: 8a1c375a-4efc-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Tp5WWOqgyIt0ou1FRI/J5O9+azC1Zey2K7voGUOVaFdGBiC6NoMJNFN55Yuy+QCQNplhoP/LiUr5lyimX7TjBCRMssgt07EA/aYbysv3M2NwJM631QoTuDHRX0faiqKpXQu8XDRIwcMmBuoqRq/MvGvsJswQ4uAJI2owfCwHJJweJGRmD5L7AYPuCMr1JdEv+x9VifeXycI00XD1hHzLUtocq26w06gy8KgCKQrVApLlRBheUejlX8Txw3Fp6QdgBOam6MUqmDCyrkvYxCEBxkl1wQDcmkUof8Y9WB22VLbH8GrHOiYmU5lb0JVzO63gFQh5Bkn+3XTE7kMczroKVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JK6iBwdWgdNikg4jzo96cher+aqzD3zrjGnzg1PmSk=;
 b=ThrkU0HNmcnGeFgTabUbEkvWXsgQZgmArOyQCJqcf+vIU4O9FPR9zxH0zG+XQ9xpD2K47qA71UJFPx+RZHcJ3nuiHCIXv0Sbs7/+uU/gSO7CjTH8bH9eiUC8wE4jmvLusqYjt+w5kSymWrDJp3O+FEFj3eZ/noEYbRNxt7aRdqPf/reV5IroxsIPCIp/EmImkvUvwQ2tDR3bub9RAdPrzCZKtLXbwgPKEMdJ8uRF5H2Uf6TrVgNrcFYIUteV04RrBbIEe4gICGMOOLOKxK3nb3R58ksw6QWVrhj6xewIyOFckxF/VCDlsWUbq/UeEwe9Z7StvwhGtZJU6CTl8lsjug==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JK6iBwdWgdNikg4jzo96cher+aqzD3zrjGnzg1PmSk=;
 b=YIZVaMgCNt1Qyyt5PgzKsWqJ0K0eU8vbrbOQSQ7mKqLesD4wA+RatHJNnVDtwHu7RmdDQ/NHk2h0R9OxRHci39C/9W1PIRxyX42uB1w3WZSUOKTnuZPq4c2S3YiKJ1koe+pypfV9BCW2/QSvXYRPNrhvM6S80X59a802JCs7pcQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 118b8a194568899c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QocmTyuVeCVYFhfJCB7pK9JhcK/CyFBcc8A3orqxUvc0G5+DHKc7atARVYMXv1+lgknKeoece1Ro2JtZwIsFcMpeaDrijUz5plJoL1QLDuB/VyRzFyfTMuuqS892O+PvUFp9K7xX+33UHyhh3CHCQvrqT4e6mqff1sjFCcZJg2kJgyhiA68eji3XYtHq9TRhwLunjh1xeYDLSpKJhP9Bc4gBv1EyrRDXrRkTzSiEWmSCNfPS+a1UicVi5hQ4dM+00hwQNka2T3t0T42T8Hzv4uOpiXEmLg7CndYvZoORXHN9yo0xaIWXJIjnuWoBeZPFKmMRunPDHzl0oc45waftSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JK6iBwdWgdNikg4jzo96cher+aqzD3zrjGnzg1PmSk=;
 b=NFM8uX6nPNKNbhVc2w3Nji9kr64RX9bhgpjm2GRo18IZQyxUtHf0Bd0YZGUPlY4bbORkT/+MHUfhSB6Q/w0J0XNssibxgnUwOgfvsa8T7wB7nzw8EkCIVAwyeZ0QP2Z+Np2Jo6AQ0T8tGO8bQw0OvxlQ+M0YC3AhYUJxkAwesMK3BQ7kBkFbibkGIeNBhDBaqgusyeInjWZmpM053GD38HK4BySCtlJGcJvIL615lLOwaXgK9sxIxPjZMcXvJ+EjoF0amBPcC354/rRK/d8zB72Rcdj5RYlB0W7k+/Fpw061GxV3K+fsq6lKbdbOfxHxYMO8YKJqrYxnaRVOIZQCiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JK6iBwdWgdNikg4jzo96cher+aqzD3zrjGnzg1PmSk=;
 b=YIZVaMgCNt1Qyyt5PgzKsWqJ0K0eU8vbrbOQSQ7mKqLesD4wA+RatHJNnVDtwHu7RmdDQ/NHk2h0R9OxRHci39C/9W1PIRxyX42uB1w3WZSUOKTnuZPq4c2S3YiKJ1koe+pypfV9BCW2/QSvXYRPNrhvM6S80X59a802JCs7pcQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Proposal for deviations in static analyser findings
Thread-Topic: Proposal for deviations in static analyser findings
Thread-Index:
 AQHY3lPHTZwvWtdyCU+0K6Hw9nMyM64L9DeAgAAneoCAABdHAIAIGdUAgAADdICAAAWaAA==
Date: Tue, 18 Oct 2022 15:49:50 +0000
Message-ID: <F95C1103-8CDB-4CC3-BCB5-45254DBB286E@arm.com>
References: <EBCDE6CE-A84A-48C7-B3C2-7856E5D2392B@arm.com>
 <ddc5039d-e312-326a-b71c-8d08d04100e0@suse.com>
 <186C83D7-6C7A-4319-86E4-69F7FDA7FDA5@arm.com>
 <559a3d4c-08ea-ef8c-9a56-2b53db3d51e4@suse.com>
 <E00E3AE4-7863-4231-9DB7-A7B66C8F6791@arm.com>
 <233a9356-b64f-37f7-d7ee-3d6223224497@suse.com>
In-Reply-To: <233a9356-b64f-37f7-d7ee-3d6223224497@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3809:EE_|GV1PR08MB8306:EE_|AM7EUR03FT035:EE_|AS2PR08MB10252:EE_
X-MS-Office365-Filtering-Correlation-Id: bfbc3178-3b64-4a21-a624-08dab1206d63
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ymjDBCkFlpNS1lTkMhZAIkM+QaBy88OrEjFEnY0MDT6pt4o4MX7xyjy8d9eXIR+AAhZaBXyUbevButBTJe2VD+NOJO7TnoaMsyx57XsblAbBXXauS/1daiCxp/9GJR/KukEFa2eb6JGbD5wsPx3eTI6rpUmsb88fWduMJ9IFTaudzPJI2PNMEalO8b+bJ/oX87ZVEKAFGIKWm7jGLyaiCx40q4z73y6kPyjt3fG8aav2TRKM6cNK13BM6sNm9Xu/7U6RLPsNIoFekOc3Xx51Mn4T+T6ODqbaHFPrrjZa74lq/JSbH3drqo1Wvul2eM/f5GBKzyBVFEIvxE26kfAGyBXSOsdojbNn8Qn1ILIgW2fMYsCAbYEhgr7ldor5pSGAm+Ci4lI/e/7B/39E4qFGGiaXi1y51w0BqZun2EbrheIqvQMFOLKA3yT00mgDRJq/rfVWW+HH5KhQMQxZ4sEhks8LJDeUwcsLXmjIBbHgrUA2pVZN97XIoW/GWIA2NHPwinWtNLBJpBQoXmjuMw7xgw2Kbpl3BuGl9BkEceLlyD4fTSb2la81j8yu+06j5Y4zEi7Hdr51o5GUu+NVMR/qhy0WbGta66eAw4no+gzi8WQeA2f9l3yEdlcgcfaWjixqRKg56qDtYQ3wYyPZf7SrrAvUp7JJM6quTdS/FesxYWymYHHx5SoVJCdKrGC7u9p9mlaJa/2FVx2gWX+DJLNgz2dH4rA7GbO1D0JDduEoV8QfSsrMlsATt1kWmC8kWPUIfcTWw3fhU9IIR26m2mi9HsuEEygqCSLX26lDePOD/K4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(451199015)(38070700005)(122000001)(6486002)(478600001)(71200400001)(38100700002)(33656002)(316002)(2616005)(186003)(66556008)(66476007)(64756008)(8676002)(54906003)(66946007)(6916009)(66446008)(76116006)(91956017)(4326008)(6506007)(36756003)(53546011)(26005)(41300700001)(6512007)(8936002)(86362001)(5660300002)(2906002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <ECE18CDC7987D64EA9FD6C51DB9F4102@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8306
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	941af9f1-1f8a-470e-01b4-08dab1206456
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uXFgOyGwYpaWzf+BLrgwBz70SUX03eWAMNn9PtDMuX2I8B/i1IORRKnpf67gCWu1G9o3XD3ZnubcdLl9Cn8w55NDjqoqBQNOjauoljqxSb4YAMWIkEj41j/WEs1gJqcQxncmaSALnrzayYXxGad0SRLxzj83LkQBLhaG2DIhDjkB4Br//3wMF8UdBGAeDCf0xzfwHNPny3qA0lpnTqqN+9GxALLmoE6kYLUT3xuAReHh3Z+m9OjDBjYP5k7FSBBhC6ABAN9weJz7dWYY/Xh42lOr2mlHJE9rq3O4opsdmmGI5eXTqPlE1/yxBr0lvY6OUjVqNEuKSXPlFseAHrf/j8zi3ajeGn6Af3gnXCWnANKHMYtRVT4Gjp/JLJybM6wqWPne6aZJjAa157zX3J/wdO0mmm5awU1NyAGTsSC3ZlZ3/od4xzQXkd9dWKm7r/SOEU3YuexJhxLLMZcqKd4ydc3BGVcoucO3DxzCh+PaIXKuUc7jIV0NYxCMbKgJ5qwyRFCOP1ydRId8m6fwaCD7KUqqtAFH7XWCCTwtQMld5nte4t2uqTPq7e/Ny2cB0hrlrGbhrJXGKyzT8PuByWFaC6kt/7Pkr1xu1pHQqR8plYQFhEPyPD1Xsmny1hfGItY7vz7OKvinywxkqMcrK6X1H/TIawBE5+tWWZgtQSMn13ggiAx+RjjMSAoiRE3nAYss5W987bSgf0wPM4iyyNCaPbV2aTnIBzB6t/Rp/O9rb3k/I1AnCa3aiXWxjZ/EptStyHWxJgNfL51xAuDEbp+t7w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199015)(40470700004)(46966006)(36840700001)(36756003)(47076005)(36860700001)(6862004)(5660300002)(82740400003)(81166007)(336012)(83380400001)(33656002)(86362001)(356005)(8936002)(26005)(6512007)(54906003)(186003)(2616005)(478600001)(40460700003)(6486002)(40480700001)(316002)(82310400005)(70586007)(4326008)(41300700001)(53546011)(70206006)(8676002)(6506007)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 15:50:05.7882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfbc3178-3b64-4a21-a624-08dab1206d63
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10252

DQoNCj4gT24gMTggT2N0IDIwMjIsIGF0IDE2OjI5LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTguMTAuMjAyMiAxNzoxNywgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+PiBPbiAxMyBPY3QgMjAyMiwgYXQgMTI6MzQsIEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gT24gMTMuMTAuMjAyMiAxMjoxMSwgTHVjYSBGYW5jZWxs
dSB3cm90ZToNCj4+Pj4+IE9uIDEzIE9jdCAyMDIyLCBhdCAwODo1MCwgSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+IE9uIDEyLjEwLjIwMjIgMTg6MDAsIEx1Y2Eg
RmFuY2VsbHUgd3JvdGU6DQo+Pj4+Pj4gRW50cmllcyBpbiB0aGUgZGF0YWJhc2Ugc2hvdWxkIG5l
dmVyIGJlIHJlbW92ZWQsIGV2ZW4gaWYgdGhleSBhcmUgbm90IHVzZWQNCj4+Pj4+PiBhbnltb3Jl
IGluIHRoZSBjb2RlIChpZiBhIHBhdGNoIGlzIHJlbW92aW5nIG9yIG1vZGlmeWluZyB0aGUgZmF1
bHR5IGxpbmUpLg0KPj4+Pj4+IFRoaXMgaXMgdG8gbWFrZSBzdXJlIHRoYXQgbnVtYmVycyBhcmUg
bm90IHJldXNlZCB3aGljaCBjb3VsZCBsZWFkIHRvIGNvbmZsaWN0cw0KPj4+Pj4+IHdpdGggb2xk
IGJyYW5jaGVzIG9yIG1pc2xlYWRpbmcganVzdGlmaWNhdGlvbnMuDQo+Pj4+PiANCj4+Pj4+IENh
biB3ZSBhZGQgcHJvdmlzaW9ucyBmb3Igc2hyaW5raW5nIHN1Y2ggZW50cmllcyB0byBlLmcuIGp1
c3QgdGhlaXIgImlkIg0KPj4+Pj4gbGluZT8gT3IgaXMgdGhlIGludGVudGlvbiB0byBiZSBhYmxl
IHRvIHJlLXVzZSBzdWNoIGFuIGVudHJ5IGlmIGEgbWF0Y2hpbmcNCj4+Pj4+IGluc3RhbmNlIGFw
cGVhcnMgYWdhaW4gbGF0ZXI/DQo+Pj4+IA0KPj4+PiBJIHByZWZlciB0byBkb27igJl0IHNocmlu
ayBpdCwgdGhlIG5hbWUgaXRzZWxmIGlzIG5vdCB2ZXJ5IGxvbmcsIGV2ZW4gdXNpbmcgbWFueSBk
aWdpdHMgb2YgdGhlIGluY3JlbWVudGFsDQo+Pj4+IG51bWJlciwgaXQgcmVtb3ZlcyBhbHNvIHRo
ZSBkZXBlbmRlbmN5IG9uIHRoZSBmaWxlIG5hbWUuDQo+Pj4gDQo+Pj4gTmFtZSBsZW5ndGggaXNu
J3QgcmVsZXZhbnQgaGVyZSwgYW5kIEkgaGF2ZSBubyBpZGVhIHdoYXQgZGVwZW5kZW5jeSBvbiBh
DQo+Pj4gZmlsZSBuYW1lIHlvdSdyZSB0aGlua2luZyBvZi4gTXkgcXVlc3Rpb24gaXMgYSBzY2Fs
YWJpbGl0eSBvbmU6IE92ZXIgdGltZQ0KPj4+IHRoZSB0YWJsZSB3aWxsIGdyb3cgbGFyZ2UuIElm
IGFsbCBlbnRyaWVzIHJlbWFpbiB0aGVyZSBpbiBmdWxsIGZvcmV2ZXIsDQo+Pj4gdGFibGUgc2l6
ZSBtYXkgYmVjb21lIHVud2llbGR5Lg0KPj4gDQo+PiBPayBJIG1pc3VuZGVyc3Rvb2QgeW91ciBx
dWVzdGlvbiwgbm93IEkgdW5kZXJzdGFuZCB3aGF0IHlvdSBhcmUgYXNraW5nLCB3ZSBjb3VsZCBy
ZW1vdmUgdGhlIGNvbnRlbnQNCj4+IG9mIHRoZSDigJxhbmFseXNlcuKAnSBkaWN0aW9uYXJ5IGZv
ciBzdXJlLCBiZWNhdXNlIGlmIHRoZXJlIGlzIG5vdCBhbnltb3JlIGEgbGluayB3aXRoIHRoZSBj
dXJyZW50IGNvZGUuDQo+PiANCj4+IFJlZ2FyZGluZyByZW1vdmluZyB0aGUg4oCcbmFtZeKAnSBh
bmQg4oCcdGV4dOKAnSwgY291bGQgaXQgYmUgdGhhdCBhdCBzb21lIHBvaW50IHdlIGNhbiBpbnRy
b2R1Y2UgaW4gdGhlIGNvZGUNCj4+IGEgdmlvbGF0aW9uIHRoYXQgcmVxdWlyZXMgdGhlIHNhbWUg
anVzdGlmaWNhdGlvbiBwcm92aWRlZCBieSB0aGUg4oCcb3JwaGFu4oCdIGVudHJ5Pw0KPj4gSW4g
dGhhdCBjYXNlIHdlIGNvdWxkIHJldXNlIHRoYXQgZW50cnkgd2l0aG91dCBjcmVhdGluZyBhIG5l
dyBvbmUgdGhhdCB3aWxsIG9ubHkgd2FzdGUgc3BhY2UuDQo+PiBXaGF0IGlzIHRoZSBvcGluaW9u
IG9uIHRoaXM/DQo+IA0KPiBXZWxsLCB5ZXMsIHRoaXMgaXMgdGhlIG9uZSBjYXNlIHRoYXQgSSwg
dG9vLCB3YXMgd29uZGVyaW5nIGFib3V0LiBJdCdzIG5vdA0KPiBjbGVhciB0byBtZSB3aGV0aGVy
IGl0IHdvdWxkbid0IGJlIGJldHRlciB0byBhbGxvY2F0ZSBhIGZyZXNoIElEIGluIHN1Y2ggYQ0K
PiBjYXNlLg0KDQpJdOKAmXMgbm90IGNsZWFyIHRvIG1lIHRoZSBvcHBvc2l0ZSwgdGhhdCBpcyB3
aHkgd2Ugd291bGQgYWxsb2NhdGUgYSBmcmVzaCBJRCBpbiB0aGlzIGNhc2UuDQoNCj4gDQo+Pj4+
Pj4gSGVyZSBhIGJyaWVmIGV4cGxhbmF0aW9uIG9mIHRoZSBmaWVsZCBpbnNpZGUgYW4gb2JqZWN0
IG9mIHRoZSAiY29udGVudCIgYXJyYXk6DQo+Pj4+Pj4gLSBpZDogaXQgaXMgYSB1bmlxdWUgc3Ry
aW5nIHRoYXQgaXMgdXNlZCB0byByZWZlciB0byB0aGUgZmluZGluZywgbWFueSBmaW5kaW5nDQo+
Pj4+Pj4gY2FuIGJlIHRhZ2dlZCB3aXRoIHRoZSBzYW1lIGlkLCBpZiB0aGUganVzdGlmaWNhdGlv
biBob2xkcyBmb3IgYW55IGFwcGxpZWQNCj4+Pj4+PiBjYXNlLg0KPj4+Pj4+IEl0IHRlbGxzIHRo
ZSB0b29sIHRvIHN1YnN0aXR1dGUgYSBYZW4gaW4tY29kZSBjb21tZW50IGhhdmluZyB0aGlzIHN0
cnVjdHVyZToNCj4+Pj4+PiAvKiBTQUYtMC1zYWZlIFsuLi5dIFwqLw0KPj4+Pj4+IC0gYW5hbHlz
ZXI6IGl0IGlzIGFuIG9iamVjdCBjb250YWluaW5nIHBhaXIgb2Yga2V5LXZhbHVlIHN0cmluZ3Ms
IHRoZSBrZXkgaXMNCj4+Pj4+PiB0aGUgYW5hbHlzZXIsIHNvIGl0IGNhbiBiZSBjcHBjaGVjaywg
Y292ZXJpdHkgb3IgZWNsYWlyLiBUaGUgdmFsdWUgaXMgdGhlDQo+Pj4+Pj4gcHJvcHJpZXRhcnkg
aWQgY29ycmVzcG9uZGluZyBvbiB0aGUgZmluZGluZywgZm9yIGV4YW1wbGUgd2hlbiBjb3Zlcml0
eSBpcw0KPj4+Pj4+IHVzZWQgYXMgYW5hbHlzZXIsIHRoZSB0b29sIHdpbGwgdHJhbnNsYXRlIHRo
ZSBYZW4gaW4tY29kZSBjb21lbnQgaW4gdGhpcyB3YXk6DQo+Pj4+Pj4gLyogU0FGLTAtc2FmZSBb
Li4uXSBcKi8gLT4gLyogY292ZXJpdHlbY292ZXJpdHktaWRdIFwqLw0KPj4+Pj4gDQo+Pj4+PiBJ
biBoZXJlLCB3aGVyZSB3b3VsZCBjb3Zlcml0eS1pZCBjb21lIGZyb20/IEFuZCBob3cgZG9lcyB0
aGUgdHJhbnNmb3JtYXRpb24NCj4+Pj4+IGhlcmUgbWF0Y2ggdXAgd2l0aCB0aGUgdmFsdWUgb2Yg
dGhlICJjb3Zlcml0eSI6IGZpZWxkIGluIHRoZSB0YWJsZT8NCj4+Pj4gDQo+Pj4+IEkgY2FuIHB1
dCBhbiBleGFtcGxlIG9mIHRoYXQsIGFzIHlvdSBwb2ludGVkIG91dCBpdCBjb3VsZCBiZSBkaWZm
aWN1bHQgdG8gZ2V0IHdoZXJlDQo+Pj4+IHRoaXMgcHJvcHJpZXRhcnkgdG9vbCBJRCBjb21lcyBm
cm9tLg0KPj4+PiANCj4+Pj4gVGhlIHByb3ByaWV0YXJ5IElEIChDb3Zlcml0eSBpbiB0aGlzIGNh
c2UpIGNvbWVzIGZyb20gdGhlIHJlcG9ydCBpdCBwcm9kdWNlczoNCj4+Pj4gDQo+Pj4+IFvigKZd
DQo+Pj4+IDxmaWxlIHBhdGg+OjxsaW5lIG51bWJlcj46DQo+Pj4+IDEuIHByb3ByaWV0YXJ5X0lE
OiBb4oCmXQ0KPj4+PiBb4oCmXQ0KPj4+PiANCj4+Pj4gYWZ0ZXIgd2Ugc2VlIHRoZSBmaW5kaW5n
LCB3ZSB0YWtlIHRoYXQgSUQsIHdlIHB1dCBpdCBpbiB0aGUg4oCcYW5hbHlzZXLigJ0gZGljdGlv
bmFyeSBhczoNCj4+Pj4gDQo+Pj4+IFvigKZdDQo+Pj4+ICJpZCI64oCdU0FGLTItc2FmZSIsDQo+
Pj4+IOKAnGFuYWx5c2Vy4oCdOiB7DQo+Pj4+IAnigJxjb3Zlcml0eeKAnTog4oCccHJvcHJpZXRh
cnlfSUQiDQo+Pj4+IH0sDQo+Pj4+IFvigKZdDQo+Pj4+IA0KPj4+PiBTbyBpbiB0aGUgc291cmNl
IGNvZGUgd2Ugd2lsbCBoYXZlOg0KPj4+PiANCj4+Pj4gLyogU0FGLTItc2FmZSBbb3B0aW9uYWwg
dGV4dF0gKi8NCj4+Pj4gQyBjb2RlIGFmZmVjdGVkIGxpbmU7DQo+Pj4+IA0KPj4+PiBBbmQgd2hl
biB0aGUgYW5hbHlzaXMgd2lsbCBiZSBwZXJmb3JtZWQsIHRoZSB0b29sIChjb3Zlcml0eSBmb3Ig
ZXhhbXBsZSkgd2lsbCBydW4gb24gdGhpcyBzb3VyY2UgY29kZToNCj4+Pj4gDQo+Pj4+IC8qIGNv
dmVyaXR5W3Byb3ByaWV0YXJ5X0lEXSAqLw0KPj4+PiBDIGNvZGUgYWZmZWN0ZWQgbGluZTsNCj4+
Pj4gDQo+Pj4+IFRoZSB0b29sIHdpbGwgd3JpdGUgYSByZXBvcnQgYW5kIHdpbGwgc3VwcHJlc3Mg
dGhlIGZpbmRpbmcgd2l0aCDigJxwcm9wcmlldGFyeV9JROKAnSB0aGF0IGNvbWVzIGluIHRoZSBD
IGNvZGUNCj4+Pj4gbGluZSBhZnRlciB0aGUgY29tbWVudC4NCj4+PiANCj4+PiBMZXQgbWUgYWRk
IHNvbWUgYmFja2dyb3VuZCB0byBteSBlYXJsaWVyIGNvbW1lbnQ6DQo+Pj4gDQo+Pj4gSWYgd2Ug
d2FudGVkIHRvIGFkZCBzdWNoIElEcyB0byB0aGUgdGFibGUsIHRoZW4gSSBndWVzcyB0aGlzIHdv
dWxkIHJlc3VsdCBpbg0KPj4+IGEgcHJvbGlmZXJhdGlvbiBvZiBlbnRyaWVzLiBJZiBteSBvYnNl
cnZhdGlvbnMgaGF2ZW4ndCBtaXNndWlkZWQgbWUsDQo+Pj4gQ292ZXJpdHkgbWlnaHQgcmUtdXNl
IHRoZSBzYW1lIElEIGZvciBtdWx0aXBsZSBzaW1pbGFyIG5ldyBpc3N1ZXMgZm91bmQgaW4gYQ0K
Pj4+IHNpbmdsZSBydW4sIGJ1dCBpdCB3b3VsZCBub3QgcmUtdXNlIHRoZW0gYWNyb3NzIHJ1bnMu
IEhlbmNlIGlycmVzcGVjdGl2ZSBvZg0KPj4+IHRoZWlyIHNpbWlsYXJpdHksIG11bHRpcGxlIHRh
YmxlIGVudHJpZXMgd291bGQgYmUgbmVlZGVkIGp1c3QgYmVjYXVzZSBvZiB0aGUNCj4+PiBkaWZm
ZXJlbnQgQ292ZXJpdHkgSURzLg0KPj4gDQo+PiBDb3Zlcml0eSB3aWxsIHVzZSBldmVyeSBydW4g
dGhlIHNhbWUgaWQgZm9yIHRoZSBzYW1lIGNsYXNzIG9mIHZpb2xhdGlvbiwgZm9yIGV4YW1wbGUN
Cj4+IG1pc3JhX2NfMjAxMl9ydWxlXzhfNl92aW9sYXRpb24gZm9yIHZpb2xhdGlvbiBvZiBydWxl
IDguNi4NCj4gDQo+IEhtbSwgSSd2ZSBuZXZlciBzZWVuIHN1Y2guIEkgYWx3YXlzIHNhdyBpdCB1
c2UgbnVtZXJpYyBJRHMsIGFuZCB3ZSd2ZQ0KPiBhY3R1YWxseSBiZWVuIHB1dHRpbmcgdGhlc2Ug
aW4gY29tbWl0cyB3aGVuIGFkZHJlc3NpbmcgdGhlaXIgZmluZGluZ3MuDQoNCkkgZG9u4oCZdCBr
bm93IGhvdyBkb2VzIGl0IHdvcmsgZm9yIENvdmVyaXR5IFNjYW4sIGJ1dCBpdCBzaG91bGQganVz
dCBydW4gc3RhdGljIGFuYWx5c2lzIG9uIHRoZQ0KY29kZSBhbmQgbm90IE1JU1JBIGNvbXBsaWFu
Y2UuDQpUaGUg4oCcQ292ZXJpdHnigJ0gc3VpdGUgaW5zdGVhZCB1c2UgZml4ZWQgSURzIGZvciBl
dmVyeSBjbGFzcyBvZiB2aW9sYXRpb25zLCBhbHNvIGluIGNhc2Ugb2Ygc3RhdGljDQphbmFseXNp
cywgYW4gZXhhbXBsZSBoZXJlOg0KDQp4ZW4vYXJjaC9hcm0vYXJtNjQvbGliL2JpdG9wcy5jOjEy
NDoNCiAgMS4gc2V0X2J1dF9ub3RfdXNlZDogdmFyaWFibGUgInRtcCIgd2FzIHNldCBidXQgbmV2
ZXIgdXNlZA0KDQo+IA0KPj4+PiBBZnRlciB0aGUgYW5hbHlzaXMsIHRoZSBzb3VyY2UgY29kZSB3
aWxsIHJldHVybiBhcyB0aGUgb3JpZ2luYWwgKHdpdGggdGhlIFNBRi0qIHRhZykuDQo+Pj4gDQo+
Pj4gV2hpbGUgeW91IG1lbnRpb24gc29tZXRoaW5nIHNpbWlsYXIgYWxzbyBhcyBzdGVwIDMgaW4g
dGhlIG9yaWdpbmFsIGRvY3VtZW50DQo+Pj4gbmVhciB0aGUgdG9wLCBJJ20gYWZyYWlkIEkgZG9u
J3QgdW5kZXJzdGFuZCB3aGF0IHRoaXMgInJldHVybiBhcyB0aGUgb3JpZ2luYWwiDQo+Pj4gbWVh
bnMuIElmIHlvdSB3YW50IHRvIHJ1biB0aGUgdG9vbCBvbiBhbiBhbHRlcmVkIChjb21tZW50cyBt
b2RpZmllZCkgc291cmNlDQo+Pj4gdHJlZSwgd2hhdCBJJ2QgZXhwZWN0IHlvdSB0byBkbyBpcyBj
bG9uZSB0aGUgc291cmNlcyBpbnRvIGEgdGhyb3ctYXdheSB0cmVlLA0KPj4+IG1hc3NhZ2UgdGhl
IGNvbW1lbnRzLCBydW4gdGhlIHRvb2wsIGFuZCBkZWxldGUgdGhlIG1hc3NhZ2VkIHRyZWUuDQo+
Pj4+Pj4gaWYgdGhlIG9iamVjdCBkb2Vzbid0IGhhdmUgYSBrZXktdmFsdWUsIHRoZW4gdGhlIGNv
cnJlc3BvbmRpbmcgaW4tY29kZQ0KPj4+Pj4+IGNvbW1lbnQgd29uJ3QgYmUgdHJhbnNsYXRlZC4N
Cj4+Pj4+IA0KPj4+Pj4gSWlyYyBhdCBsZWFzdCBDb3Zlcml0eSBpZ25vcmVzIGNlcnRhaW4gaW5z
dGFuY2VzIG9mIHdoYXQgaXQgbWlnaHQgY29uc2lkZXINCj4+Pj4+IHZpb2xhdGlvbnMgKGZhbGwt
dGhyb3VnaCBpbiBzd2l0Y2goKSBzdGF0ZW1lbnRzIGluIHBhcnRpY3VsYXIpIGluIGNhc2UNCj4+
Pj4+IF9hbnlfIGNvbW1lbnQgaXMgcHJlc2VudC4gVGhlcmVmb3JlIG1heSBJIHN1Z2dlc3QgdGhh
dCBzdWNoIGNvbW1lbnRzIGJlDQo+Pj4+PiBkZWxldGVkIChyZWFsbHk6IHJlcGxhY2VkIGJ5IGEg
YmxhbmsgbGluZSwgdG8gbWFpbnRhaW4gY29ycmVjdCBsaW5lDQo+Pj4+PiBudW1iZXJpbmcpIGlm
IHRoZXJlJ3Mgbm8gbWF0Y2hpbmcga2V5LXZhbHVlIHBhaXI/DQo+Pj4+IA0KPj4+PiBZZXMgdGhl
IGxpbmUgd29u4oCZdCBiZSBhbHRlcmVkIGlmIHRoZXJlIGlzIG5vIG1hdGNoLiBUaGlzIHRvIGVu
c3VyZSB0aGUgY29ycmVjdCBsaW5lDQo+Pj4+IG51bWJlcmluZyBpcyBub3QgYWZmZWN0ZWQuDQo+
Pj4gDQo+Pj4gIndvbid0IGJlIGFsdGVyZWQiIGlzIHRoZSBvcHBvc2l0ZSBvZiB3aGF0IEkndmUg
YmVlbiBhc2tpbmcgdG8gY29uc2lkZXI6DQo+Pj4gT2JzZXJ2aW5nIHRoYXQgY29tbWVudHMgX3Jl
Z2FyZGxlc3NfIG9mIHRoZWlyIGNvbnRlbnRzIG1heSBzaWxlbmNlIGZpbmRpbmdzLA0KPj4+IHRo
ZSBzdWdnZXN0aW9uIGlzIHRvIHJlbW92ZSBjb21tZW50cyAobGVhdmluZyBhIGJsYW5rIGxpbmUp
IHdoZW4gdGhlcmUncyBubw0KPj4+IGVudHJ5IGZvciB0aGUgdGFyZ2V0ZWQgdG9vbCBpbiB0aGUg
dGFibGUgZW50cnkuDQo+PiANCj4+IFdoeT8gVGhlIHRhZyBjb21tZW50IHdvbuKAmXQgZG8gYW55
dGhpbmcsIGl0IHdvdWxkIGFjdCBhcyBhIGJsYW5rIGxpbmUgZnJvbSB0aGUgYW5hbHlzZXINCj4+
IHBlcnNwZWN0aXZlLg0KPiANCj4gVGhlIF90YWdfIHdvbid0IGRvIGFueXRoaW5nLCBidXQgYXMg
c2FpZCBhbnkgX2NvbW1lbnRfIG1heSBoYXZlIGFuIGVmZmVjdC4NCg0KWWVzLCBhbnkgY29tbWVu
dCB0aGF0IGlzIHVzaW5nIGEgcHJvcHJpZXRhcnkgc3ludGF4IGZvciB0aGUgdG9vbHMgd2UgdXNl
Og0KDQovKiBjcHBjaGVjay1zdXBwcmVzc1twcm9wcmlldGFyeV9JRF0gKi8NCi8qIGNvdmVyaXR5
W3Byb3ByaWV0YXJ5X0lEXSAqLw0KLyogLUU+IGhpZGUgcHJvcHJpZXRhcnlfSUQgMSDigJwiICov
DQoNCk1heSBoYXZlIGFuIGVmZmVjdC4NCg0KSWYgYW4gZW50cnkgaW4gdGhlIGRhdGFiYXNlIGhh
cyBubyBtYXRjaCB3aXRoIHRoZSB1c2VkIHRvb2wsIHRoZW4gaXQgd291bGQgc3RheSBhcyAoZm9y
IGV4YW1wbGUpOg0KDQovKiBTQUYtWC1zYWZlIFtibGFibGFibGFdICovDQoNCldoaWNoIGhhcyBu
byBlZmZlY3Qgb24gYW55IHRvb2wsIGhlbmNlIEkgZG9u4oCZdCBzZWUgdGhlIG5lZWRzIHRvIHJl
cGxhY2UgaXQgd2l0aCBhIGJsYW5rIGxpbmUuDQoNCkNoZWVycywNCkx1Y2ENCg0KPiANCj4gSmFu
DQoNCg==

