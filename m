Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D779687A5
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 14:39:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787871.1197339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl6KO-0003Ew-FQ; Mon, 02 Sep 2024 12:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787871.1197339; Mon, 02 Sep 2024 12:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl6KO-0003CN-Ch; Mon, 02 Sep 2024 12:38:40 +0000
Received: by outflank-mailman (input) for mailman id 787871;
 Mon, 02 Sep 2024 12:38:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D5C5=QA=epam.com=prvs=59756471fc=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1sl6KN-0003Bu-8g
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 12:38:39 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 461674dd-6928-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 14:38:38 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 482CUJv2008985;
 Mon, 2 Sep 2024 12:38:28 GMT
Received: from db3pr0202cu003.outbound.protection.outlook.com
 (mail-northeuropeazlp17011023.outbound.protection.outlook.com [40.93.64.23])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 41dde5g0sv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Sep 2024 12:38:28 +0000 (GMT)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by PAVPR03MB10179.eurprd03.prod.outlook.com (2603:10a6:102:327::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Mon, 2 Sep
 2024 12:38:23 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%7]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 12:38:22 +0000
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
X-Inumbo-ID: 461674dd-6928-11ef-a0b2-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QBXJToNsu9Yt4gEj/ZQVi61CCjqpRP3ikUSq35M7rRBTc5aiMut6pY1RPs6S487ac2UCngNYcZ0BnMTewbdl0zkxWEozcK0wM8wALI9KhJXd2jGUkIEDj1MQNVpskiTuLmEUQ3/5/zHUozkBFECbOkKTBi7kxZXJj/l6GzoGZPnMSSufxNN/iw5EEY5E2bqwD0h0NfTkaNOEaF/X4zL2wVXQZ1lLqT7lSQI6zHUy/WVrPqvvM7JAIgBfk/s9f+QdwfhyQI/XSB/x6OAP5EpupGihcMDFCAnGrVuChDj8idtPpTZrLW4Rq8Qm4ATzhcqAjY27UEr7DRqUfo/9grhYlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sb3KNOKaW6KGLpVEyerzsgVIoITy3hGl7Vo/g4XvKwc=;
 b=ERAclKP5SuTd+aKuVQr3b7eGew1deBq2ZaUHcPi3o6veWSEerCGTjZvKJ8wrLPIf5hEEyrKhbUNfCv+hh94SR9eGN2oP98R6wAEe1Fbwfs8v6HbaOcC1fOcc0C8fOHJZ2zeMLtHeLq0b5/TFQP2NE7eopprYRNsanoFI9hcqNI0RyhXW8mm8kwJfCoPXUTqunzxVnt59MA86Dj4uPWX1sIjHbQxDGHupHdaIvplvzPHfPNL4/b1zK5in11odsXBOONmJn1me1J+5G7hgjWyLq7gnLpsyI6cShppqDTbrxDLt57FMEUyOAb0jz221xuj8mPSd8OaxCjDDrI0HviOzHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sb3KNOKaW6KGLpVEyerzsgVIoITy3hGl7Vo/g4XvKwc=;
 b=SsFSIsNo4TIzZE9/XpD/s7fOsrr4T+rlR6TlmwJ6i9HFwYXpDuwgB6QvDfSIr3HVmGs1JOGdLdOsu3yw87nSvJ66kA2bE7QhYwczpnt9+IF0uEIyNs+PL3FcaR4GFX0xmNB7OmsTsogTb7uyeMfLvuZokcN1iH7QceCnczk3MapUWW6uydkGEsT48ctjcHc+X3m6ZRamWs2fQVwB+Ys7MQQmxjwM/TK8zGiGvHHS5cllTgkH8rN/++NGwA3xXxvhFWtYIiWyLxKEsuOKjWtduTicwyGNYCM9rxLv8r7nQbDEup4UqGakp7H3oTojOq7IRKCR/7hbiEQgX5JQtT0BVA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Grygorii Strashko <grygorii_strashko@epam.com>,
        Peng Fan <peng.fan@oss.nxp.com>
CC: "julien@xen.org" <julien@xen.org>, Artem Mygaiev <Artem_Mygaiev@epam.com>
Subject: Follow up discussion for: [RFC v2] Introduce SCI-mediator feature
Thread-Topic: Follow up discussion for: [RFC v2] Introduce SCI-mediator
 feature
Thread-Index: AQHa/TT/0nIgcrSoPES5n7Kbm0YhpA==
Date: Mon, 2 Sep 2024 12:38:22 +0000
Message-ID: <460ec8fb-bae0-4681-b774-20cb564fa9c4@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|PAVPR03MB10179:EE_
x-ms-office365-filtering-correlation-id: a7a66d81-28d9-4aa4-072a-08dccb4c2207
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OUZ0bkdwWlpZZGY1VDQyRkxETjZlclVGVWtnRTl1bXNVN01aaGNIWjRpLzNJ?=
 =?utf-8?B?eUIzNWU5akVNNHUwaGpwckRvS1BSWFVvNlZhVExqK080NG9HVkprTjdlajJX?=
 =?utf-8?B?YXVRNnBFTEkwZEp3OUQrN0lJMm9tZ05xcnhYSFBQeXZyRGd3QmpQcm5qQkIv?=
 =?utf-8?B?VUpZbXdkR0haeVoxaGhxTmFIZHJYTm9hdThSanhNczZGTkpheG93TmxWK1FF?=
 =?utf-8?B?RHQ2Z3QreDY4OHRKaW12MTZZUDdaSkVPVGFpWU5qUVhjd01OWnEwYVpXcy9t?=
 =?utf-8?B?TVlqbFBQTjdWRzVHclkrS2lkWUlHY0NMMTJFVGI2akkybUtmcG5MeWovdUR2?=
 =?utf-8?B?OTNCMW9lRXVZYTBmOEtxbzJxeXRKbG96alRXMFBDbUs0cTlpVjVlRzgzdjF5?=
 =?utf-8?B?T04xNzltT0VRaGU2QWZ2UWFUbElVSENYSWxZbWUza0g0NGxzRTIxQ3h6RklE?=
 =?utf-8?B?anZ3QjB0TE1LcFoyVHFEemtPWHhGNTdFaW5mMFM3TzJoMkZuSk9EQzF6eUh3?=
 =?utf-8?B?MlhaNTQ5Z05XdzI0QjVoaklmMHoyMzltSFU4ZjZGOW5XTE11blN3ZUk2TzNj?=
 =?utf-8?B?U0hvOFNWNXNmTDAvVWpQdUoxTm9zeS8xNmZYTFMvTmQxVDFuaUNLTVlrQ1Er?=
 =?utf-8?B?TXR5eEdwL3RRNVBldCtuNEVOdlJDQnBVNnQrSXR2UlNiMk5ISE9QR3F2S05p?=
 =?utf-8?B?ek11TFBjaFU5ZlV5eGx2NVIzY2pUNGhPNEpuclo0a1ZQMFpCZmFRRjNHZHJY?=
 =?utf-8?B?STZ4WVQxOGVLZzMwUk9NZFJDKysxUWlUY1QrSEVxTGRiNTVQaVVqVDVzclhO?=
 =?utf-8?B?L01tekNISk5sckI3b1F2TTYxbWdIak5wVGs0L1BXWWZOaW9FV3pNL2Y4bnNL?=
 =?utf-8?B?aDRRU1RnRGJvTEkxVCtzNFhzTXZIWjg0Qi9RcVdWcDVjZTBWeHlaR2FsaURm?=
 =?utf-8?B?c0dlY01pcnFOMHUxOU9DMkFwc1Q4ejI2dlU4SE9aVHhFT2NFOVozQ0NzUkND?=
 =?utf-8?B?U254SnVGRnhCb3U2cW9pc1UrZnJUMklrWHNzR0hLVGRDQjM1ekplVEo3TCsw?=
 =?utf-8?B?WGx3SXY0bjBRUlo2TEFuRXB3UnRGeDFLUHVZSDhWakFTWWNiWVdKT3puK2p2?=
 =?utf-8?B?dU4zNmlWZ0gvNlRnY3VyQnJISCtrWGdQaVVlUndqa3hUemh4WmFsVnVsK1pz?=
 =?utf-8?B?eG5KQmtJMnlGL245UGlOaE1KNEZJM2xsL0w1UnErL3ZLS2RrVDZXeVg5aVNo?=
 =?utf-8?B?ZG9RbCtGMHFFazN1ZjM4bW5uZXkzVi9IMmpwKzRISWxqQlYwNlg5d0liQjZz?=
 =?utf-8?B?eVppcmRMSldZYnpuT0QrZHlUcnc1NVBMSlpaVmRBNTRXQm9PVVNQeFgzclhh?=
 =?utf-8?B?ckZLYmlXU3hENVZLWTFmNThHekJFZmVYSGNaTnNRUHA2SDRlUFVrVEQvK2FU?=
 =?utf-8?B?ZG0xaFdRUDlPY3pZWGdmYTJSSkZuRDRtZ1hmZEE4N0YxN2VQNmFpYzB0UXdR?=
 =?utf-8?B?SXcvTDhIOGZUTWY3bjVLSTM3d3JNOGwwdTVtTmdtYVlPL1pSWno5RmJGQmpV?=
 =?utf-8?B?TEFKZGs3SDBTWTc5WWVtUWVUZkE4dVh0NGU2ZUJyMUhHRGIralZZTEpSTzdm?=
 =?utf-8?B?ZGY1enY3OS9yZmIxQTJkQXhEN0J5NEV5ai8zZkoyYlFPaXFkUUhMa01WL084?=
 =?utf-8?B?eEJzZWRGZ3JoVjYvWHhXNExxeCtjRjJjSldZdzRrZGwrdW5FTzFEK0hjZ3Jk?=
 =?utf-8?B?UDVETVB0Q3IwZjJJZit3RVc2TWlTQWlETzFpMzVDY2FTRHduNkoxdDlWU2pY?=
 =?utf-8?Q?uHNh6bb4LOvJfpHrrO3z+PvyZpjkbPOqvkF9Y=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NVN4OXhHL1NOL1JkajVFRm9SVE90TmVPTG11UDQvL2hYejd3emFjYTNpck4r?=
 =?utf-8?B?MkNJUkd0UzdITWRJTlR5Um4vVThjQVNVZTVIaWt6Wm5GU3BraHpHU0l5VFFa?=
 =?utf-8?B?ajNYeVRUMXdRVlN6aWR1NktQYmhNS1dUUHVlRS9pNFJEYnNZVWtxa0wzaVZM?=
 =?utf-8?B?YU10OFhMT3NSRHYxRXhKOFd6Qkk2SnRrbGwxa01CRWRldURmYzl4V1ZheGVO?=
 =?utf-8?B?Q3Btc3FDdUVHZFl3QXc0K1ZPbm1PUDZBSi9rSHMvZEdyVFd1dG53Q0hhYVl0?=
 =?utf-8?B?b3A5TW5MUkNLOFJTUEd1L25ycXhpSkx6MkRlcGVxbDYrSHpxS0FKMXBqZkE5?=
 =?utf-8?B?eis1eEltd2hPemE3K2Iwc0JPTjJLNkcxSGY5MEtQM3E3ZVhBY0ZPWEU5TktT?=
 =?utf-8?B?dkxEL29xNjFwZkNJR1Y3dEVLMTlKdWZJOW9DSUNiY3F1N2JMeC9HUGNjRmd6?=
 =?utf-8?B?cWdwRkdPMUVyN1ArUXpqMkR6alJmeFZ2b3RZTVFUYzNyeWM2bzlvbzlHTmY3?=
 =?utf-8?B?WTVJeXNmMlZMTlJ1Rk9kU2pEdkhtNnQwckRrTmZmWkttUHU5c3V5eWx4VkZX?=
 =?utf-8?B?VXFNa2M4ZWp4TzdQeWR1ZVJXYi9GeGtsZmpIVmlncmlpWHdWbi8rUjFwdjR5?=
 =?utf-8?B?cnFiTXltbmlxT0FxS1p2WUh5dFlSSkZUZUtVSGN0YVJmcFRwZmpJRkVIWnRP?=
 =?utf-8?B?MjZ4dTBtRStHWkVXeW5iaXpkY0lrdFA2dXg4MDZIai9FVGIrVjlIMzdYd0tC?=
 =?utf-8?B?U3B3Q1gwZmJ2bEcyRUI5VXNVaHJzeWl2MGpWL1h2M2l5aGNIT3kxV1BvdW5p?=
 =?utf-8?B?S01Ceno2N0lMQ3RMcFRSQVV2eFFoSkpDQXliUFdDeXhJU3RmZFZIWkUwMEp3?=
 =?utf-8?B?MC9jaUxObDRZL2o4NWd0aG5ZNGJXTEpHWDZrSU5ZSlRHL0U2NVN6K1dkNjZF?=
 =?utf-8?B?eVh0Y05Ib2FNblJLUFFVckxha3Q4Zk1FOUtJVzVmajljTXpyQVNmUE54K1lY?=
 =?utf-8?B?SGZwbG9RbmVZYzBGVzc1aC84bjJKd1NuOEROSkkrT3ZjNEhuUXNqVXVWTmRy?=
 =?utf-8?B?TzlrclR3b05qdlEvMDFEUUZPVkFtTGNtTEE2ZFhJVDgvMDJ1QmZDRzJTTWt1?=
 =?utf-8?B?eFVhZ3dBV1B1UTRYVkVldVlhakJzcUp6UlRWVnh2d3RjamNiQ0w5dFoyMFNr?=
 =?utf-8?B?Z1lsVHZodWpUVEJtbzJoczJWM1h4UVAyUzVCWlAzYzhEQm9YV3ZicG92RDdB?=
 =?utf-8?B?M1IyaWRmR08xYjF5ZjZYOWx1ZXdSQU11aENDMFIvV2FYaVh3alRPbG5sODF0?=
 =?utf-8?B?NUJVNHRLcWtEWUpsWVBGeFQzb0hiWFpXOHhIbWlnNlZLWEp4ejlDWmlXVlhF?=
 =?utf-8?B?enpReVhhRGZGWkhLNTNxRDUvZWRHSFNETDBVcFhYdFd3YlN0WVB1RytadG9F?=
 =?utf-8?B?RVBlYU4xSWYvUmVnT1dYTUJMN3hxMytYRG9VL29sM3pyU3VUeWdxRkZXa2t0?=
 =?utf-8?B?M2xRT2NkNExRbDR4UkxUQmcvNHhnMktaM3czWHZyWTFSQmVRcXJucG5Vd3Zw?=
 =?utf-8?B?cUwrTUt2ZHFudkc0RENVL2RiSVBmYzhEeVFvbyt1NlFMT05sc3paWDVZaFEr?=
 =?utf-8?B?OEtrc2ZZdituaVdRdGNWaWd3b3labm92MUFlT2k5SkRnd1lmV1h6N3JsZktr?=
 =?utf-8?B?OWRDZXNQN2I3VHJIT21xWXhWd2lBdzZqazdEeUpYbzRWZitpdktwMjd6UGxz?=
 =?utf-8?B?STE3MWRPbVpkODdjb0JTc0RrOFVVVFEramdrT2E3ejltRjdMeXl6Y0doWjQz?=
 =?utf-8?B?R3QyblpTVkR4OHY1WHg0MHdvZC9yZGs0b2FDcFpIa1JEejcyRUFySkNaQWgy?=
 =?utf-8?B?dlhFYTlWMlRJdVlsWStBSW1yZnBPb2luL0grWUpXODBPUVpwTjVmQVFGZWYx?=
 =?utf-8?B?OGNtbDRxTFJZUU1Fd1lGQWtkWm1keHlMY0hKeE5xM1pqTEZOVmI1Tmk4dytI?=
 =?utf-8?B?b0ovOXVOcytqSjd4WVRYSEh2MXN2NDg1Uy9qOE9sMFVNN1pOc2R0TGkyT0l6?=
 =?utf-8?B?cDhvN0NyNStrRlNuV2lhY0dqN01lYytQOE9QNktiVlZselY5Rk9iWVRZU3hT?=
 =?utf-8?B?b1g3aDFmQXhwWFNubWpMV2MxTTRZM1VWWUlSQWtIYXNwTFJVaHgxSEdleTdU?=
 =?utf-8?B?Z2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ECFB7361A5709144B659AAF7791BCB53@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a66d81-28d9-4aa4-072a-08dccb4c2207
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2024 12:38:22.8029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jrw2hGNM33UFyr4QexZ7sxqxVgjgUw+kwvRgqZqwGIHEu0GZzLBiUY2lfcys2y7EfNVIaqouziT0wi+30Ifg8oAoFS+ZD/36oxF+QWo4yIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB10179
X-Proofpoint-GUID: bGWPVqELKd8ZOkWPtUkeu1HslakOlqZh
X-Proofpoint-ORIG-GUID: bGWPVqELKd8ZOkWPtUkeu1HslakOlqZh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_02,2024-09-02_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxlogscore=886 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409020102

R3JlZXRpbmdzLA0KDQpBZnRlciBzb21lIHRpbWUgd2UgYXJlIGJhY2sgdG8gdGhlIGRldmVsb3Bt
ZW50IG9mIHRoZSBTQ0ktTWVkaWF0b3IgDQpmZWF0dXJlIHByZXNlbnRlZCBhcyBSRkMgZmV3IHll
YXJzIGVhcmxpZXIuDQpMaW5rIHRvIHRoZSBSRkMgdjI6IA0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsL2NvdmVyLjE2NDQzNDE2MzUuZ2l0Lm9sZWtzaWlfbW9pc2llaWV2QGVwYW0uY29tLw0K
DQpMYXN0IHRpbWUgZmVhdHVyZSBkaXNjdXNzaW9uIHdhcyBzdGFsbGVkIGF0IHRoZSBmb2xsb3dp
bmcgcG9pbnQ6DQotIERldmljZS10cmVlIGJpbmRpbmdzIHNob3VsZCBiZSBjaGFuZ2VkIHRvIHBy
b3ZpZGUgcHJvcGVyIGRldmljZS1pZCBmb3IgDQpTQ01JIGRldmljZXMgd2hpY2ggaXMgdXBzdHJl
YW1lZCBpbiB0aGUgTGludXggS2VybmVsIGJ5IG5vdzoNCmh0dHBzOi8vcGF0Y2hldy5vcmcvbGlu
dXgvMjAyNDAxMDUxMzA0MDQuMzAxMTcyLTEtZ2F0aWVuLmNoZXZhbGxpZXJAZm9zcy5zdC5jb20v
MjAyNDAxMDUxMzA0MDQuMzAxMTcyLTItZ2F0aWVuLmNoZXZhbGxpZXJAZm9zcy5zdC5jb20vDQoN
ClRoYXQncyB3aHkgd2Ugd2VudCBiYWNrIHRvIHRoZSBkZXZlbG9wbWVudCBvZiB0aGUgU0NNSS1N
ZWRpYXRvciBmZWF0dXJlLiANCk91ciBjdXJyZW50IHNldHVwIGlzIERvbTBsZXNzIHdpdGggWmVw
aHlyIGFzIENvbnRyb2wgZG9tYWluIGFuZCBMaW51eCBhcyANCkRvbVUuDQoNCkhlcmVieSBJIHdh
bnQgdG8gc3RhcnQgYSBkaXNjdXNzaW9uIGFib3V0IHRoZSBjb3JyZWN0IGFwcHJvYWNoIG9mIGFk
ZGluZyANCnNjbWkgbm9kZXMgdG8gdGhlIHBhcnRpYWwgZGV2aWNlIHRyZWUgZm9yIGRvbWFpbi4N
Cg0KQ3VycmVudCBkZXZpY2UtdHJlZSBjb25maWd1cmF0aW9uIHdlIGhhdmUgZm9yIFhlbiBhbmQg
RG9tVSBkb21haW4gYXJlIA0KdGhlIGZvbGxvd2luZzoNCg0KMSkgWGVuIGRldmljZS10cmVlIG92
ZXJsYXk6DQomey99IHsNCiAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDB4MDI+Ow0KICAgICAg
ICAgI3NpemUtY2VsbHMgPSA8MHgwMT47DQoNCiAgICAgICAgIHNyYW1AM2ZmMDAwMDAgew0KICAg
ICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm1taW8tc3JhbSI7DQogICAgICAgICAgICAgICAg
IHJlZyA9IDwweDAwIDB4M2ZmMDAwMDAgMHgxMDAwMD47DQogICAgICAgICAgICAgICAgICNhZGRy
ZXNzLWNlbGxzID0gPDB4MDE+Ow0KICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwweDAx
PjsNCiAgICAgICAgICAgICAgICAgcmFuZ2VzID0gPDB4MDAgMHgwMCAweDNmZjAwMDAwIDB4MTAw
MDA+Ow0KICAgICAgICAgICAgICAgICBwaGFuZGxlID0gPDB4MDM+Ow0KDQogICAgICAgICAgICAg
ICAgIHNjbWlfc2htXzA6IHNjbWlfc2htQDAgew0KICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAiYXJtLHNjbWktc2htZW0iOw0KICAgICAgICAgICAgICAgICAgICAgICAgIHJl
ZyA9IDwweDAwIDB4MTAwMD47DQogICAgICAgICAgICAgICAgIH07DQogICAgICAgICAgICAgICAg
IHNjbWlfc2htXzE6IHNjbWlfc2htQDEgew0KICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAiYXJtLHNjbWktc2htZW0iOw0KICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9
IDwweDEwMDAgMHgxMDAwPjsNCiAgICAgICAgICAgICAgICAgfTsNCiAgICAgICAgICAgICAgICAg
c2NtaV9zaG1fMjogc2NtaV9zaG1AMiB7DQogICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJhcm0sc2NtaS1zaG1lbSI7DQogICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0g
PDB4MjAwMCAweDEwMDA+Ow0KICAgICAgICAgICAgICAgICB9Ow0KICAgICAgICAgICAgICAgICBz
Y21pX3NobV8zOiBzY21pX3NobUAzIHsNCiAgICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRp
YmxlID0gImFybSxzY21pLXNobWVtIjsNCiAgICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8
MHgzMDAwIDB4MTAwMD47DQogICAgICAgICAgICAgICAgIH07DQogICAgICAgICAgICAgICAgIHNj
bWlfc2htXzQ6IHNjbWlfc2htQDQgew0KICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAiYXJtLHNjbWktc2htZW0iOw0KICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDww
eDQwMDAgMHgxMDAwPjsNCiAgICAgICAgICAgICAgICAgfTsNCiAgICAgICAgICAgICAgICAgc2Nt
aV9zaG1fNTogc2NtaV9zaG1ANSB7DQogICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJhcm0sc2NtaS1zaG1lbSI7DQogICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4
NTAwMCAweDEwMDA+Ow0KICAgICAgICAgICAgICAgICB9Ow0KICAgICAgICAgICAgICAgICBzY21p
X3NobV82OiBzY21pX3NobUA2IHsNCiAgICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxl
ID0gImFybSxzY21pLXNobWVtIjsNCiAgICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHg2
MDAwIDB4MTAwMD47DQogICAgICAgICAgICAgICAgIH07DQogICAgICAgICAgICAgICAgIHNjbWlf
c2htXzc6IHNjbWlfc2htQDcgew0KICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUg
PSAiYXJtLHNjbWktc2htZW0iOw0KICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDcw
MDAgMHgxMDAwPjsNCiAgICAgICAgICAgICAgICAgfTsNCiAgICAgICAgIH07DQp9Ow0KJnsvfSB7
DQogICAgICAgICAgICAgICAgIGRvbVUgew0KICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAieGVuLGRvbWFpbiI7DQogIAkJCSAuLi4NCiAgICAgICAgICAgICAgICAgICAgICAg
ICB4ZW4sYXJtX3NjaSA9ICJzY21pLXNtYyI7DQogICAgICAgICAgICAgICAgIH07DQoNCn07DQom
ey9maXJtd2FyZS99IHsNCiAgICAgICAgIHNjbWk6IHNjbWkgew0KICAgICAgICAgICAgICAgICBj
b21wYXRpYmxlID0gImFybSxzY21pLXNtYyI7DQogICAgICAgICAgICAgICAgIGFybSxzbWMtaWQg
PSA8MHg4MjAwMDAwMj47DQogICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDB4MDE+
Ow0KICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwweDAwPjsNCiAgICAgICAgICAgICAg
ICAgI2FjY2Vzcy1jb250cm9sbGVyLWNlbGxzID0gPDE+Ow0KICAgICAgICAgICAgICAgICBzaG1l
bSA9IDwmc2NtaV9zaG1fMD47DQoNCiAgICAgICAgICAgICAgICAgZXBhbSxzZWNvbmRhcnktYWdl
bnRzID0gPA0KICAgICAgICAgICAgICAgICAxIDB4ODIwMDAwMDMgJnNjbWlfc2htXzENCiAgICAg
ICAgICAgICAgICAgMiAweDgyMDAwMDA0ICZzY21pX3NobV8yDQogICAgICAgICAgICAgICAgIDMg
MHg4MjAwMDAwNSAmc2NtaV9zaG1fMw0KICAgICAgICAgICAgICAgICA0IDB4ODIwMDAwMDYgJnNj
bWlfc2htXzQNCiAgICAgICAgICAgICAgICAgNSAweDgyMDAwMDA3ICZzY21pX3NobV81DQogICAg
ICAgICAgICAgICAgIDYgMHg4MjAwMDAwOCAmc2NtaV9zaG1fNg0KICAgICAgICAgICAgICAgICA3
IDB4ODIwMDAwMDkgJnNjbWlfc2htXzcNCiAgICAgICAgICAgICAgICAgPjsNCg0KICAgICAgICAg
ICAgICAgICBzY21pX3Jlc2V0OiBwcm90b2NvbEAxNiB7DQogICAgICAgICAgICAgICAgICAgICAg
ICAgcmVnID0gPDB4MTY+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgICNyZXNldC1jZWxscyA9
IDwweDAxPjsNCiAgICAgICAgICAgICAgICAgfTsNCg0KICAgICAgICAgICAgICAgICBzY21pX2Ns
b2NrOiBwcm90b2NvbEAxNCB7DQogICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MTQ+
Ow0KICAgICAgICAgICAgICAgICAgICAgICAgICNjbG9jay1jZWxscyA9IDwweDAxPjsNCiAgICAg
ICAgICAgICAgICAgICAgICAgICBwaGFuZGxlID0gPDB4MDQ+Ow0KICAgICAgICAgICAgICAgICB9
Ow0KICAgICAgICAgfTsNCn07DQoNCiZwY2llMSB7DQogICAgICAgICByZXNldHMgPSA8JnNjbWlf
cmVzZXQgMD4sIDwmc2NtaV9yZXNldCAxPiwgPCZwY2llX3Jlc2NhbD47DQogICAgICAgICBhY2Nl
c3MtY29udHJvbGxlcnMgPSA8JnNjbWkgMT47DQp9Ow0KDQpBcyBjYW4gYmUgc2VlbiBmcm9tIG92
ZXJsYXkgWGVuIHJlYWRpbmcgdGhlIGZvbGxvd2luZyBpbmZvcm1hdGlvbjoNCjEpIFNoYXJlZCBt
ZW1vcnkgY29uZmlndXJhdGlvbiBhcyBhIGxpc3Qgb2Ygc2hhcmVkIG1lbW9yeSBwYWdlcy4gVGhl
eSANCndpbGwgbm90IGdvIHRvIHRoZSBDb250cm9sIGRvbWFpbiBkZXZpY2UtdHJlZS4NCjIpIFND
TUkgY29uZmlndXJhdGlvbiBmb3IgQWdlbnQtaWQgMCwgd2hpY2ggaXMgWGVuIGl0c2VsZi4gVGhp
cyBhZ2VudCBpcyANCnJlc3BvbnNpYmxlIHRvIHNldCB0aGUgZGV2aWNlIHBlcm1pc3Npb25zIGZv
ciBhY2Nlcy1jb250cm9sbGVyIGRldmljZQ0KMykgZXBhbSxzZWNvbmRhcnktYWdlbnRzIChuYW1l
IHByb2JhYmx5IHNob3VsZCBiZSBjaGFuZ2VkKSBpcyB0aGUgbGlzdCANCm9mIG9iamVjdHMgYW5k
IGNvcnJlc3BvbmRpbmcgc2htZW1zIGFuZCBzbWMtaWQgZm9yIGFnZW50cy4gUGxlYXNlIG5vdGUg
DQp0aGF0IGFsbCBhZ2VudHMgd2lsbCB1c2Ugc21jLWlkIDB4ODIwMDAwMDINCmFuZCBYZW4tTWVk
aWF0b3Igd2lsbCBtYWtlIGEgY2FsY3VsYXRpb24gYW5kIHByb3ZpZGUgYWdlbnQtc3BlY2lmaWMg
DQpzbWMtaWQgZm9yIEFSTS1URg0KNCkgTGlzdCBvZiBzY21pIHByb3RvY29scyBhbmQgYWNjZXNz
LWNvbnRyb2xsZXIgaWQsIHdoZXJlIHNjbWkgaXMgDQphY2Nzcy1jb250cm9sbGVyIGRldmljZQ0K
NSkgZG9tVSBjb25maWd1cmF0aW9uIGhhcyB4ZW4sYXJtX3NjaSA9ICJzY21pLXNtYyIgdG8gZW5h
YmxlIHNjbWkgc3VwcG9ydA0KDQotIERvbVUgRG9tYWluIGRldmljZS10cmVlDQoNCi97DQoJIHNj
bWkgeyANCg0KICAgICAgICAgICAgICAgICAgc2NtaV9yZXNldDogcHJvdG9jb2xAMTYgew0KICAg
ICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgxNj47DQogICAgICAgICAgICAgICAgICAgICAg
ICNyZXNldC1jZWxscyA9IDwweDAxPjsNCiAgICAgICAgICAgICAgICAgIH07DQogICAgICAgICB9
Ow0KCXBhc3N0aHJvdWdoIHsNCgkNCiAgICAgICAgICAgICAgICAgcGNpZXg6IHBjaWVAMTAwMDEy
MDAwMCB7DQogICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJicmNtLGJjbTI3
MTItcGNpZSI7DQogICAgICAgICAgICAgICAgICAgICAgICAgLi4uDQogICAgICAgICAgICAgICAg
ICAgICAgICAgcmVzZXRzID0gPCZzY21pX3Jlc2V0IDE+LCAmPHNjbWlfcmVzZXQgMj47DQogICAg
ICAgICAgICAgICAgICAgICAgICAgLi4uDQoNCiAgICAgICAgICAgICAgICAgfTsNCgl9DQp9Ow0K
DQpXaGVyZSBzY21pIG5vZGUgKHNpbWlsYXIgdG8gR0lDIGNvdWxkIGJlIGVpdGhlciBlbXB0eSBu
b2RlLCB3aGljaCB3aWxsIA0KYmUgcmVjcmVhdGVkIGJ5IFhFTikuIEhhcmRjb2RlZCBkZXZpY2Ut
dHJlZSBwaGFuZGxlIGFzIHdhcyBkb25lIGZvciBHSUMgDQppcyBub3Qgc3VwcG9ydGVkIGJlY2F1
c2UgZm9yIHNjbWktcGluY3RybCBwcm90b2NvbCB0aGVyZSBhcmUgbm8gc3RhdGljIA0Kc3Vibm9k
ZSBjb25maWd1cmF0aW9uLg0KRHVyaW5nIGRvbWFpbiBjcmVhdGlvbiBYZW4gbWVkaWF0b3IgY29k
ZSB3aWxsIGNyZWF0ZSBzY21pIG5vZGUgd2l0aCANCmV4aXN0aW5nIHBoYW5kbGUgYW5kIGNyZWF0
ZSBhIGNvbXBsZXRlIGRvbWFpbiBkZXZpY2UtdHJlZS4gWGVuIHdpbGwgdXNlIA0Kb3JpZ2luYWwg
eGVuIGRldmljZS10cmVlIGFzIGEgYmFzZSB0byBjcmVhdGUgc2NtaSBub2Rlcy4gSXQgY2FuIHVz
ZSBpdCANCmVpdGhlciBkaXJlY3RseSBpbiBkb20wbGVzcyBtb2RlIG9yIHRvb2xzIGNhbiByZWFk
IFhlbiBkZXZpY2UgZnJvbSBoeXBmcyANCnRvIGNyZWF0ZSBkZXZpY2UgdHJlZSBlbnRyaWVzIGZv
ciBEb21Vcy4NCg0KU2ltaWxhciBhcHByb2FjaCB3ZSBleHBlY3Qgd2hlbiBjcmVhdGluZyBkb21h
aW4gdXNpbmcgWGVuIHRvb2xzdGFjay4NCg0KDQpDb21tZW50cyBhcmUgYXBwcmVjaWF0ZWQuDQot
LSANCkJlc3QgcmVnYXJkcywNCk9sZWtzaWku

