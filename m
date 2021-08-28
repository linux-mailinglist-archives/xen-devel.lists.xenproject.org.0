Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 349FB3FA352
	for <lists+xen-devel@lfdr.de>; Sat, 28 Aug 2021 05:18:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174168.317749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJor3-0000VF-HA; Sat, 28 Aug 2021 03:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174168.317749; Sat, 28 Aug 2021 03:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJor3-0000SY-DY; Sat, 28 Aug 2021 03:18:01 +0000
Received: by outflank-mailman (input) for mailman id 174168;
 Sat, 28 Aug 2021 03:18:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sP14=NT=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mJor2-0000SS-K3
 for xen-devel@lists.xenproject.org; Sat, 28 Aug 2021 03:18:00 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.84]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b34eec6-4cd1-4ea2-9ed0-0ebdba07dc02;
 Sat, 28 Aug 2021 03:17:57 +0000 (UTC)
Received: from AM7PR03CA0002.eurprd03.prod.outlook.com (2603:10a6:20b:130::12)
 by AS8PR08MB6565.eurprd08.prod.outlook.com (2603:10a6:20b:33c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Sat, 28 Aug
 2021 03:17:55 +0000
Received: from VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::43) by AM7PR03CA0002.outlook.office365.com
 (2603:10a6:20b:130::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Sat, 28 Aug 2021 03:17:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT036.mail.protection.outlook.com (10.152.19.204) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Sat, 28 Aug 2021 03:17:55 +0000
Received: ("Tessian outbound 56612e04f172:v103");
 Sat, 28 Aug 2021 03:17:54 +0000
Received: from a4b95a235b26.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 652298BC-684E-4785-AC16-DA9D609E7698.1; 
 Sat, 28 Aug 2021 03:17:44 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a4b95a235b26.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 28 Aug 2021 03:17:44 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (10.141.135.71) by
 DB6PR08MB2934.eurprd08.prod.outlook.com (10.170.220.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20; Sat, 28 Aug 2021 03:17:43 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Sat, 28 Aug 2021
 03:17:43 +0000
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
X-Inumbo-ID: 4b34eec6-4cd1-4ea2-9ed0-0ebdba07dc02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gRx1UnI2+7Q1lBsKrHCTnH+9Ao7bcFD9TInqTL3yG4=;
 b=JSq8coXqySaFjeVFSK7RbUGPbl1PBgy8EjHgZMLwjsK4c9bj0IS/3FbNhELYjMzyiBnBh9ztZQYJUab4Ev5eS4V6Y6pc5QTyYmHyU8uEXTP7/SUKP7ZOVaBqbLsea4HXzhhCSyfLyWvAEZCtd+FYTCDg1HUwgo6WMj1Kyh6bwYc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c260Y9urKjJtkZ4U2ZmLw7D9nsDMtR2rNv2jMXRjBiNgz+4T+QA2PlmQxqDM2TBexafXIRpP4ixxMZDQRJyYlt6FC8xv0jbzkuhYamalNReMJ3TEjHcuwRxsmnMnt4dsHr2cwkVyQoKaIhXxh3brkurZkdExNtQ+VESXZquPuA3kap6+P7uAfmFjE0Rk5cJyAX+ASO0r9+kFiFbubZKSMbToBrV7AOKKCQppYIh8M/qbMw5QMwKFiuIVwOedwn1J9gRZFnMRiS14Wfp/NO74DvW+5Nu6Yo4ty83sLD0XofnhQftfyAN7oXo8eALdRLCR59QoMhNCF0d6R0AwW2358g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gRx1UnI2+7Q1lBsKrHCTnH+9Ao7bcFD9TInqTL3yG4=;
 b=Q00lz8bNq/0f2tgxjsys8na0z1msjJT80bOkqMRv4k13KquLoh4UjT6Jxd4TVJBOzqYsVnvkdjv/B79DT1zLghl2h0kVusgyDy3P3Lg5BsKowlpvJ8SQV7cAQW1oWD2xRLh0Inm12iYP2AzuCJLYgLURRlRL885gR22h1xf790jSWYgXS2R154kLHOLA54OXp9uAUU7HgXk/Mr+pjxIl3gzS0zvT6cSTG/LX1gzv37FxkItNzm3qG7arDS/QQmzS2uidl3oe1JnEogB3CiFlOLxxTdUFLq7uG1DfjnAoVmE27seUkI/F0dCR/4QeoWsEAurDrFt6xChoSma5nvG40g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gRx1UnI2+7Q1lBsKrHCTnH+9Ao7bcFD9TInqTL3yG4=;
 b=JSq8coXqySaFjeVFSK7RbUGPbl1PBgy8EjHgZMLwjsK4c9bj0IS/3FbNhELYjMzyiBnBh9ztZQYJUab4Ev5eS4V6Y6pc5QTyYmHyU8uEXTP7/SUKP7ZOVaBqbLsea4HXzhhCSyfLyWvAEZCtd+FYTCDg1HUwgo6WMj1Kyh6bwYc=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 38/40] xen/arm: enable device tree based NUMA in
 system init
Thread-Topic: [XEN RFC PATCH 38/40] xen/arm: enable device tree based NUMA in
 system init
Thread-Index: AQHXjptQCVAwokAljU6uEdAOvxt6uKuHg4WAgADUAaA=
Date: Sat, 28 Aug 2021 03:17:43 +0000
Message-ID:
 <DB9PR08MB68570138E19683934DA86B1B9EC99@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-39-wei.chen@arm.com>
 <86469c72-68d0-2a30-66ef-497884125437@xen.org>
In-Reply-To: <86469c72-68d0-2a30-66ef-497884125437@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: FA88E53850A5F344BF5E2D472757E529.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: abcaf3aa-e350-42d3-62f7-08d969d26d99
x-ms-traffictypediagnostic: DB6PR08MB2934:|AS8PR08MB6565:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB656587C6B99CBE0AA2DF9FAE9EC99@AS8PR08MB6565.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WjDsDrvsXXtLWXM32Bwb7eX805n82jldEIxjmO16yD87PV6ogeQ+rOV6YWo9pFhIszf0p8JdhVfwJK/J5pEYx88I7ypwNWR/0dUaszBFiMbXQc7xHFMq5BdApMYK1B+oUlWBEtFQLp+SU5432wRDRdtg/znA6IyMsAKOHd4jGjJcDG5LnbdOOHEQy46jV+5AZf6B/d6Hwmd7FfxPSLGBd6qalynUav7DwpQk/aRWhG6L7yBjKH53SDk58Jbtez7K8FYKHAWlSuRm9+HR/3I2OQH/XYOaYvQN9sLJXr5AuKASr8OBPRcB3dZPk4sbVtd/gVOR13vMODLhNX7da87EHMXqwhptUjFBGAnecSvgLaEvQ+9PQR0SwUgFGYyR97hxKhGdMk4J4oSS/g3OrNU7qv9wzo+yc3WhcqS157IgaItq76Q3ps8Q5oz+tAQIOctRx/Az/3MG33i/yRKjl2JhEKhRymDuoMedN6zJdv913tuydafuMnVq4ubwCEc8em4bsF8zeF8AJ13JpeywMa8BnYSCq2KsBTgah9uk9g7olgjOY4HVSc+4vaPXRm9quZ+VCkStefJXVNL7dvxXA6o1uwE/LyhEsuUD3/BxvsAnJ4OGzfQY/LSkSFzyMbB+z/kWNkEr+uJdnySwFbo+5D221kcT7VOxrTJtKjkXNO8evNsiPuFMtztPyoDFYAh9zKtR8FgLMM1sHBweTis1E/cJgA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(136003)(396003)(376002)(366004)(53546011)(33656002)(26005)(55016002)(38070700005)(66556008)(64756008)(66476007)(186003)(9686003)(6506007)(478600001)(5660300002)(122000001)(83380400001)(2906002)(71200400001)(86362001)(66446008)(38100700002)(8936002)(8676002)(52536014)(316002)(66946007)(110136005)(76116006)(4326008)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ODVCbHJNWFZEVzVnY3J1S0FXMk9samxBU29BRHh1RDA4L3JwdkZNb1RLRjkz?=
 =?utf-8?B?UFJnOFNlOTZVK2UwSWpLQUZRdGJjRUVIOVYxaDN4TjFxa2FiZGtwZElCTGtN?=
 =?utf-8?B?OVVKZURiWk5nK3ZzVXdwWlhiUExyWmhFWXhtNGMxZURBVDlBYm5RaWF5bkQ1?=
 =?utf-8?B?V1ozcTVhUHZ3VlpwUHgzZEMwQkExQXFOVmRpVVpHY0s1SWxaaUpxYjlwWlF6?=
 =?utf-8?B?cTBrTGhMS0Rjc2ttM3dISlRySFRZMURQaE9naUhRM1c4Wld1cSsva2Q3SDhI?=
 =?utf-8?B?MzlIb2hoQkdVU1RzR3B3VkdvaTB3Z0trRThRdXVhTTVwRUF1ZmxwZ2FoVmtr?=
 =?utf-8?B?aEwzSVRuR3N0SkJYWGEwNXlxaEtBQ0R6bVRTRzJlS2FsbWtZUzVwQXlvWlVz?=
 =?utf-8?B?ZC9qZnBIaXpFVWVRZitJRlJncU12SngzMXRLdnBHcEtqSC9yRE11TXB2eTdo?=
 =?utf-8?B?S3NaNlBONm1Bb3JHVy9GSmdMNzlkRW5Sd0pkR0ZtQURod0Fmc3ZkY1B1bitT?=
 =?utf-8?B?S1dXQVBxQTlMR0xDMFJ3dnAwY1E1aTJEeEVKckpZMHFSVE5MWVZXOTIyWTZJ?=
 =?utf-8?B?Skc0alBzS0dKV3hWdjRJQ0cxVEhhNEpXZ1p0YXVqZGhJU1FsSEdyNzU4aEtP?=
 =?utf-8?B?cXlxS0ZkUUx5TTEwRk4vMGdXTmpzVWMzYlVScVZib2VLWFhna1F0YkdwSUtM?=
 =?utf-8?B?Z1k5bVBDR05rdnFuVCtlN2VLMzhUdjhUNmYvdG41SlZueFQydS9JUUgzdSto?=
 =?utf-8?B?em5uekJ0TWpWcFBZZkM3Q2VDcmlaMm5aL1paMjlDYXYrdHpZdDZVMTdOUTBH?=
 =?utf-8?B?SGlJWjREZ1RRTlgvdE51VGRiMEovZGl1UktCQ3M1VG5Hb1JUd2xJc05xbHN4?=
 =?utf-8?B?aTlMWXMxM1kwU1lGbFR5bHJOKzJST01FVnF6WDMrbGo0dGVtajJKVXQwUzYv?=
 =?utf-8?B?aHFUdVJVL1o1ejRXVmdNdTNuMVNlVC9vbTV0REJJajYzUmZQYUdHTjRMTGky?=
 =?utf-8?B?L3VNU0dxdWtFOGJiU09qUkhSclloODZneDRCazFRZXBQSWFYUHJKU0doWGFl?=
 =?utf-8?B?bHBZMVNqdkdyTWNZckZWYVNuUHk5WnZvK2t1OFVlVzBmUWVrN1hCOG9CWWIz?=
 =?utf-8?B?OTRIdno2WVd0dFlFck10am5xb0xOTzV0cVg5Rm5XaUxlMm13emhQNG1Rd2g3?=
 =?utf-8?B?d0VYR0pVL3hRMlU3Uit2VDVsZGp2L2M5bHdxWkxWbGxQZVNpbVdxZmoyMi9m?=
 =?utf-8?B?bnFSdlZ3elF6Q0lGTVA0a0RYbWpQN2pQdm92VWNVbDFiS1NIMENzaWUwbGJz?=
 =?utf-8?B?Qm9EL3U4c3BRMC9IZWczdlRaL01PSFlqRG1mK3N4Qi9ETGJJUFlPckhOSUR3?=
 =?utf-8?B?TzFDY3hSRHlmZGhseCs1Z1JncFRiZG9jMVpKMmsrV3V5TmJUVE8za2lyQ214?=
 =?utf-8?B?MFBScHp5L2k0UzFsTXpFMWRBRkNrdWRtTUNVNmRiV2xoWTZMcDRqNTByeXRQ?=
 =?utf-8?B?ZFlqcXhmd2MvNkhXWmxGWHZvK0FWbU1aOURnbW0wbExoOFZJcktSdC90TUV5?=
 =?utf-8?B?Y1hZZkJYa2RJQUZpcFk1TDZWUDUzOWNKMW50aGM1M3F6T1FOZEx4K0s0Z0Zs?=
 =?utf-8?B?cW1CeUMreEZhV2xvQzN4dGhKclZLdElicEtWRjFzWW84VDVGZlpzSnhJTDkx?=
 =?utf-8?B?eU1sTklaTzlDaXhXYVkxQjZMZUVZeFF4N1ZiT3VPRDAyc09LV3hkYmFpY3hC?=
 =?utf-8?Q?fGwmfwp9MCsl8YHLtNbMlRaVblBkO+RX1YkNTv/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2934
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7d33c404-3bc9-4bf7-d6c8-08d969d26675
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3nBLTUY/YCitl8mUCUcvpuXy+8byTc0zMTusF/XMhUfVXIC2GCCQy2s0zN75u1xx5vHjbD0WwTeJ62NqNLmtFTjxVtYtnDZSiW0Xmt0XCWw25r+ksvUQI0bcNrbyprPuo8O5RIBlwMYa9x/5h/990w0BzZpUoDm/Am1Yx855LfZ0Nr4hYn7B5xySp8lKdObYpOobr1+d8R/YmqU5beHH5/k9n1hLbKbenv5mGYwrYAWrpDm9pq0LeoJXk4kYYPcjhv8ZyxLErlpQ6zRjkfWAQLFBw3XpfWEenEDMTfE5ZZ8sqswGQq38MuFQ8POghVQwXqHc7JC/9SVd5Djt84a1bqR8ifvlWq2OTHRYbTwudFUKFwC0QjTjEbVQeRpnzkKz+XyLpHLUa5i/7DfWXw+ioj/UJlfZP0A/IgrFIoT8CUwVZVCwB/Mk0T5516zh6O+n3rDENMWzAv+iWOkJxBIZfUYcTz6dsGht3DikLQmhdVEJfPwx3HUSgSN9Cqbi4S6ioCD4GV1WzgfV2tkGpHHhNrwyUsSmuHGvmNnfNqK+d2N3ZZufJYJZmUlCRbskn4k5n391gHa9pl2GBPUGYvhNyS/ha3viVbOE2CZshYznoSs8cKw05vinGiGHPLdSwHQzGGSn5AYQQJ5K3ZUPQ7JDYju8MA8NPu983grx134MItV+RG385VbhHGQjT4wl94n49/YUm1orIXOHe6EiFelwTw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39850400004)(396003)(36840700001)(46966006)(186003)(2906002)(478600001)(336012)(5660300002)(52536014)(33656002)(356005)(316002)(110136005)(82740400003)(8676002)(6506007)(4326008)(53546011)(8936002)(26005)(81166007)(82310400003)(83380400001)(47076005)(9686003)(86362001)(70206006)(70586007)(55016002)(7696005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2021 03:17:55.1365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abcaf3aa-e350-42d3-62f7-08d969d26d99
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6565

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjfml6UgMjI6MzMN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqYmV1bGljaEBzdXNlLmNvbQ0K
PiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMzgvNDBdIHhlbi9hcm06IGVuYWJsZSBkZXZpY2UgdHJl
ZSBiYXNlZCBOVU1BDQo+IGluIHN5c3RlbSBpbml0DQo+IA0KPiBIaSBXZWksDQo+IA0KPiBPbiAx
MS8wOC8yMDIxIDExOjI0LCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBFdmVyeXRoaW5nIGlzIHJlYWR5
LCB3ZSBjYW4gcmVtb3ZlIHRoZSBmYWtlIE5VTUEgbm9kZSBhbmQNCj4gPiBkZXBlbmRzIG9uIGRl
dmljZSB0cmVlIHRvIGNyZWF0ZSBOVU1BIHN5c3RlbS4NCj4gDQo+IFNvIHlvdSBqdXN0IGFkZGVk
IGNvZGUgYSBmZXcgcGF0Y2hlcyBiZWZvcmUgdGhhdCBhcmUgbm93IGNvbXBsZXRlbHkNCj4gcmV3
cml0dGVuLiBDYW4geW91IHBsZWFzZSByZS1vcmRlciB0aGlzIHNlcmllcyBzbyBpdCBkb2Vzbid0
IGhhcHBlbj8NCj4gDQo+IFRoaXMgbWF5IG1lYW4gdGhhdCBDT05GSUdfTlVNQSBpcyBvbmx5IHNl
bGVjdGVkIHVudGlsIGxhdGUgaW4gdGhpcyBzZXJpZXMuDQo+IA0KDQpXaHkgSSBkaWQgbGlrZSB0
aGlzIGlzIGJlY2F1c2UgbXkgb3JpZ2luYWwgY29uY2VybnMgYXJlOg0KMS4gV2hlbiBJIGludHJv
ZHVjZWQgdGhlIENPTkZJR19OVU1BLiBVc2VycyB3aWxsIGJlIHVzaW5nIGEgY29kZSBiYXNlIG9u
DQogICB0aGlzIGNvbW1pdCBieSBhY2NpZGVudC4NCjIuIElmIHVzZXJzIHNlbGVjdCBDT05GSUdf
TlVNQSwgYnV0IG5vdCBhbGwgTlVNQSBkYXRhIGFyZSBub3QgaW5pdGlhbGl6ZWQNCiAgIHByb3Bl
cmx5LiBUaGUgc3lzdGVtIG1heSBub3Qgd29yayBwcm9wZXJseS4NCjMuIFNvIEkgY3JlYXRlZCB0
aGUgZmFrZSBub2RlIHRvIGluaXRpYWxpemUgdGhlIE5VTUEgZGF0YSwgYmVmb3JlIHdlIHBhcnNl
cg0KICAgcmVhbCBkYXRhIGZyb20gRFRCLg0KNC4gSW4gdGhpcyBjYXNlLCB1c2VyIGNhbiB3b3Jr
IHdlbGwgd2l0aCBDT05GSUdfTlVNQSBpcyBlbmFibGVkLCB3aXRob3V0DQogICB0aGlzIHNlcmll
cyBpcyBjb21wbGV0ZWQuDQoNCkl0IHNlZW1zIEkgdGhvdWdodCB0b28gbXVjaC4gSWYgdGhlc2Ug
Y29uY2VybnMgYXJlIG5vdCBuZWNlc3NhcnkuIEkgYW0NCk9LIHRvIHJlLW9yZGVyIHRoaXMgc2Vy
aWVzLg0KDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

