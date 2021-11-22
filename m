Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A59EF459020
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 15:21:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228907.396150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpACL-0004ZQ-AR; Mon, 22 Nov 2021 14:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228907.396150; Mon, 22 Nov 2021 14:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpACL-0004WQ-78; Mon, 22 Nov 2021 14:21:33 +0000
Received: by outflank-mailman (input) for mailman id 228907;
 Mon, 22 Nov 2021 14:21:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJrQ=QJ=epam.com=prvs=1960b635ba=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mpACI-0004WK-S2
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 14:21:31 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b09d038-4b9f-11ec-a9d2-d9f7a1cc8784;
 Mon, 22 Nov 2021 15:21:29 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AMEE6e3014572;
 Mon, 22 Nov 2021 14:21:25 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cgcsr01xp-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 14:21:24 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AM7PR03MB6628.eurprd03.prod.outlook.com (2603:10a6:20b:1bf::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Mon, 22 Nov
 2021 14:21:21 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::b121:f602:44b6:d445]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::b121:f602:44b6:d445%3]) with mapi id 15.20.4713.025; Mon, 22 Nov 2021
 14:21:20 +0000
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
X-Inumbo-ID: 7b09d038-4b9f-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mapywL4+N23b7V2hssKXcSKxUtPc7ozIjMP1idQ67i8duCa7J7dmD4o23ukIH+yj9Chm0PtoQiYH89Fjym+iyKxwcucpjKR8zVH10DlvNuiZQKx/Ytbns4ZI5cKaYb22nNYPnHAY6ToNXLvhuh3PkyiS7f1NZipsh11WVlV0MAAiA9wI/NT84KbzpbppGwzm4WViiRCOzhIwpaciDocH9glvopTQ1gvSObJ1AlUBNopoThv+5oFItpuCcIDKE2bEIuqrrpUdDEZSBUj5ZhpYuzAAuczdELyGZ0S1+WqrRhlxA/MfzbWEjL2CIb+Sa+pvk02NREVJNN0RY8cQhea7yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2zMdDTQEv0Kb5kQfc4rZktekv3DCmMIAh+w8ywkJmM=;
 b=dXhX3reD3KmyWtjLjNJFSjJIbA35V0wElhPqzg5ASkoEnxrz1vIK/6HwbwYxZOkBosIOhFHnZJRbalfzN9YkYNDyKToi1EV4MqXftLwl+Uarh/UGTsthu6TmbOKUL6WnFG83xn+8GDWIdjlMTd9WS7vdF7nazRjky5U0fZq7t+PG5eNgBtyDzFuCndUf/iJfu35nqnyPsSztzPSh2cVD0vYAVp2JKcwHRTSXWDcV7ZKbu/9x7bU8hbUdFl4nXZnzOUnbin6ayDndmzVYMM2nBQJcHmwEcadZQfg4cmdETsRELcwAFQxLLq/iCIl3SeZwgFjHkBTAvEPTNqajcrqX7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2zMdDTQEv0Kb5kQfc4rZktekv3DCmMIAh+w8ywkJmM=;
 b=njgdbkEv0FpffXPc+xE6TJppt2IRsiMyB6N8jELNokJRC97z6JswKdB0YkutYt/3GBgakyNQcgGd2J05z85/bxivzT8dXfHg/l/SKowpMlVrGwmd8X8Q8dMztsRpH8NIQqnqrn/JMDbcgsCkP75nroJ9t1GxB8cPbtNrbf4SdDkNghBB/3vbUpgEgY5A7iDlkFOjntaN5DFqTgJG9hojIYC4aSzp+nVuxwHV56TtdBHJ1rokelA++z9sxyQhFDyO6vH+3rkwTGdlmd68GwnYx8Nz0Vyz6K7gWFU/yO65jFVDJmEoJ3E/eVsGUwI4qhfMdp1w/kSgciik9GrlDvSQgw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        "julien@xen.org" <julien@xen.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Topic: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Index: 
 AQHX0hJIYALl/D9fL0OD6N0XGDJh2awHdhMAgAGHTYCAAA1EAIAABOkAgAAF6YCAAATnAIAAQRQAgAAGPgCAAAR1gIAAAvIAgAAFxACAAAoGAIAAAXMAgAABgYCAAAVtAIAAAX+AgAAB1wCAAVryAIAAB06AgAAEPgCAAAKhAIAAApkAgATD+4A=
Date: Mon, 22 Nov 2021 14:21:20 +0000
Message-ID: <6be4e6c0-5b54-606e-1278-e97e143e23af@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <e77ebf8d-0be2-7b4c-4169-db239bfa8e80@epam.com>
 <e17ee963-d498-00ef-a5c5-1fea73ed4898@suse.com>
 <d9692f93-a58d-1513-1f22-7d0cbc7b3b6e@epam.com>
 <b45c172d-ab51-a02a-8e29-3b31b6319f4d@suse.com>
 <17c7485a-2c44-63ec-553c-5caa9b8eb70c@epam.com>
 <YZZdU1oCaMt1HxTj@Air-de-Roger>
 <b7cb9ce7-fee9-f16d-572c-c39b3ff75d62@epam.com>
 <bf8f1c03-d872-094b-4a3c-3b15706babdf@suse.com>
 <816d3519-f007-80e2-e07f-ff285640926b@epam.com>
 <ecd83d8f-f290-295c-e073-583aa70a8c1e@suse.com>
 <2db325e9-0349-1cc3-1c4a-fefa048f181b@epam.com>
 <ac0cc710-05b9-bdae-c31c-d159b4de0105@suse.com>
 <00e78d11-8e7b-84d2-5aa0-0a7f82f13af6@epam.com>
 <7dd919b8-0e3d-30dc-302a-9964f9d94ad2@suse.com>
 <fec02ac4-1ecf-18e1-7ed6-3b1094d60890@epam.com>
 <126a2864-e7e3-b887-43ff-55b1e59151b4@suse.com>
 <5baf1199-e12d-cc41-4520-e32ed29a0436@epam.com>
 <fbc8a807-ea73-760f-8c75-df0930a5139e@suse.com>
 <4e74d5e1-f54e-3888-ada2-a38545571744@epam.com>
In-Reply-To: <4e74d5e1-f54e-3888-ada2-a38545571744@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38114521-58ac-47a7-c23e-08d9adc35b20
x-ms-traffictypediagnostic: AM7PR03MB6628:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM7PR03MB66286A9B175167A6CECF780EE79F9@AM7PR03MB6628.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yQS4SX7bj7vDTuaukcu8chFBE/ijmLAAHEF2pNeXHYmPVNrAyTngO31gqVU8v+vfNi5x4sGue6qjotNAZAihf3mwLOPp0pYJSxdbERAMxp/yq21+lVB7M2Rz75HwOUswE29nDKhO7+lId5Hn5IDtHpHln/VbZNm6TtPTB/iNQw/Q4+JjajRQReIKvEA+D+svCfcIQvAZ2xJeznYhEFr20NlduyHpExNTIfyOfQpIGOluOeeTMszgcCasoBtQbF+knpTQ+93xV3VpbdiMD7IWwEeaw4Td8rDvTyGtcBpgR52SAb40Pm3IDojwXBJZBXsLHAcfnDq1ohI3xGwuDa2X74X/Va+fWiXE2mVtfM8aAzyzrOEafK1t7ZN9BwTFidwOne3QuYqFcfyLPJBvPl0mmdAuX1+MntXogW/90zaPz/usDOj0FsUG1mY2hrgj2o62uFFtB9uDl6gWQLphOtuqs0tfwqpyX1jh6CKqwJ0iDViC+9u4fd8X5pXY0Fm7LfFjKK3wrrxNktDizD0rYBci8r7ImVy1l/h9Yd2vqK5CSblxBzi25afcocGw7mJG+Bnr98e1/8DtXY3b0JFFUpnl8ZydXO6sJJF5wP9/21Z8nIbXSsDsLMT71qqbk1uFSqlBFwsK/m1SX9eXiZpLjrgG/nvW0uQl3/jElATlJ8Hweb42+itX/Bf4SDxwXukKky0i1YUYSaqOBaJV5GpkNUFjobb4NT528QXOOkgdS/g1KRdgyLc16PL/RE65GHHoLB5x
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6325.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(6506007)(8676002)(71200400001)(2616005)(2906002)(76116006)(186003)(6512007)(31696002)(6486002)(110136005)(54906003)(316002)(26005)(64756008)(107886003)(38100700002)(66446008)(38070700005)(66556008)(8936002)(86362001)(53546011)(66476007)(4326008)(83380400001)(5660300002)(7416002)(31686004)(508600001)(122000001)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VUMweTUra0l1WlVydkgzUTd3QjYrMUlVa1NGMkc4UWhhektFbFRuMjFVb2gv?=
 =?utf-8?B?Nklzb0xvRzJQYStSQllTTktDWmZYYTJmWFQraklMbGVtYkNkYVQ1eC8raDhH?=
 =?utf-8?B?STRGWitqcG5acldFVHpoWWhOZlppbWcvc1RpZVlWb1lTaWk2L3ZUVzBjMnR0?=
 =?utf-8?B?RmMzVmoyTlBWTXZ2VFdjdm94QjhWeHVtd3JuMTFaODV0bkpNTWNmb3ZTVWM0?=
 =?utf-8?B?N0pNSDZhMkRoRnlMNTBuMzlnSlI0S2J6ZUI2U0tyc0gwbkQ3dmV2RHMvQkRo?=
 =?utf-8?B?RVprNUlaU3pSNHZEV2w0TmlWUHEwamtqRnpOaWRiZU1YeW1SMlY2dGozYlhv?=
 =?utf-8?B?YUlxNkI0dUVRbkY4TnM4WmNCRGlZTnBMRS91MFpSYUtTTUZONllDV2lKOG9J?=
 =?utf-8?B?VjJJeHZheGFrdG9lQTR3d2VVMUR3dGFEeXUyN0NTSFE1SkVGTXRldmI0WGtI?=
 =?utf-8?B?VFNvUEVISlBRU0JzdVlQWm5OYVZtQUdLbWwxMnFtNUpwbTkvczU2UjNxdjRu?=
 =?utf-8?B?U1FOMGczbDF4b09CcG9jUFFVY1BDY2tpQXY1cDk4UU1LcVNuejdwMzlxVlFD?=
 =?utf-8?B?ZVFiK2p1QmFvTldvbUcraDNOQUdUVVlSV1ZZYldNb2lObkhjRm84S3lEOWxU?=
 =?utf-8?B?MnJoMWNMdm9TdVpQQVpZRm1qOTRQYlc4WC9jY001a0RlSStCOHVHei9ta3Zt?=
 =?utf-8?B?emYrV1ZpNERxVlRvMGZyOCtMYnRUZmR5NXZIdHVoR0wzSXNXdUd6OXZML2Fa?=
 =?utf-8?B?dG1rU1NFZ01nUVZnVzBBUlF4MWlQbkNRc0VTd2x4RW5IYjcreU1udUJVa2hX?=
 =?utf-8?B?b3YyWDNma3FVSmxCZ2NyT1JyaUd2aXRUWWVINEM2dXViRW5aQWNYV3dwRk9F?=
 =?utf-8?B?ZVJLeExZakRnUmR3YXJvWmNJOXp6a3JHc1hmb085YkFiUCtjb3hNTklWdFA0?=
 =?utf-8?B?dTRYVjMwdTl2eHZjUmM0eGttUHhzYVFWNmNHdnZnSUVYaERqZlBEbjVzMlFh?=
 =?utf-8?B?dVVpY1p6N2JKRkNDY0t2Sm0zWlNsaUI2NjYrMllGQUxQMWRBbHQ1S0lBTy8w?=
 =?utf-8?B?UC9JMjR5RHYxSW91MWFURHlYYzVkNEpRVTduN0QzTzZiNkJuMFMxdzJweDR5?=
 =?utf-8?B?eXR2N2lRUU1vVWtYRGJJL0FmVnlIWmtZSFpNazJQRTFSb2hTaEUrSWJsYWZE?=
 =?utf-8?B?amwzR3Vpa3BTNGpyL1F3R0pzamUrTXJCZ1N6RWlicnBHdTRyN2VwS01xZUli?=
 =?utf-8?B?dTBOSHZUNXE5czM3RHN3L2g4K2xxVmhUMTVIL3ozWDFGVVIvbUNLVExubnEz?=
 =?utf-8?B?aXhZVFlFaW1ScFpXeFdYSGRTb2NGWk9jbWZnOHFjWmlVdTBGY0RzZ3MrOFpy?=
 =?utf-8?B?YmZsTTR2UXpNeFdIR2dwTVNrczl0QTg4b3pjeldhempJNzJyMjZCK1RvZ0Z3?=
 =?utf-8?B?L3hnV2VJV2VMSVB5WmtyRnI5QURKb0FhS2QzRTNrOGs3RkZyVEd2TlQvVnU4?=
 =?utf-8?B?ajEwUHRxMzFmNkNPU1lDTy9xZFhwd2F2Q1pjNzlPL09TYjdOMmRxRjZ4STI3?=
 =?utf-8?B?QkVobkFFTGYvM1ZHNCt3RjJsbzhjSWxpZnVHWE5YREtZK0xJRThVRVdzZkdK?=
 =?utf-8?B?U3NjWWlQTUh0NUdiNERtQWJ5QU9PcUtsMEw1N0xwWHpuL3RaVWhZMmxWdWQ3?=
 =?utf-8?B?ZUdmSnFBbmd3dkFQZ3ZYMUR0VGVnRUptYU82ek1BV24vaHBwN1BSNnM2ZXd5?=
 =?utf-8?B?U2dIQjhEU1Vmdlozb1ZScnZVSGZsOHNmYURESjhYU0cyRld1UlpBbG5GUk9p?=
 =?utf-8?B?WXhFdjIvT2tKUUd0b3VCdy9JWS9hb2RyMG1od0dTaXlPL21PS2pGSHdFYmN3?=
 =?utf-8?B?ZFZwWHNKaXlVTVlIV2hkNGt3UEJ6R2VRVFE2RnNnREN1cUdNSTQvZjNodWto?=
 =?utf-8?B?UGR3WUEwU0dKTi96bHVqeDVzeHowcGZjV0R2UjJSMi9LTUJTSlpIc0Fsak8z?=
 =?utf-8?B?OEVRdGJDdFBIeFdBUmhzT2hwMFRORHpyT1NoYVIrdml1QjVabmRLU1JEV1lB?=
 =?utf-8?B?VzlCS2g3QXYzUXptTGRncTViazF1NHdUb0ZHb1B4RHlBSmJrT00zN1I2bnhx?=
 =?utf-8?B?MGdkNStKT2ljNWw3M3dldTV3Y1VyOWZreDc3c014bEFlV2JzR2RKR09UK21S?=
 =?utf-8?B?ekJSVnFuU1AzY3B1SFovbzR6VW9lQS9IMFpUSzVEOHd1NmdaZUJmNHFJR2RU?=
 =?utf-8?B?Y1RuVC8xVmJkT0ZrNnhiMXMxTkl5bjJJMXloZGlEWURXNVE3b1IrZWdiSDhC?=
 =?utf-8?B?YWwwTHpodm5PeExxZXNJKzA5SWhPM3VTejlpc1NRbmxRMkJiMHFzZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B20A3907DBD42643946968732783C602@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38114521-58ac-47a7-c23e-08d9adc35b20
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2021 14:21:20.6895
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lgBhJNIgj+6ZyxmlaPowjS77mXOa4/2rFsoTC+fMdmZrqcyHEqPSrgQ+UKimXaGK7UtephXrnxwtnsOGS3h4dYTPT6WE1CBRv6fxNBm+08mMptzNBpC+NWTqeKTQW3GI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6628
X-Proofpoint-ORIG-GUID: cc2E5U_M_XzxTw_uahzmflv1G7ossJIN
X-Proofpoint-GUID: cc2E5U_M_XzxTw_uahzmflv1G7ossJIN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_07,2021-11-22_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111220076

DQoNCk9uIDE5LjExLjIxIDE1OjM0LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4N
Cj4gT24gMTkuMTEuMjEgMTU6MjUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMTkuMTEuMjAy
MSAxNDoxNiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4gT24gMTkuMTEuMjEg
MTU6MDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+PiBPbiAxOS4xMS4yMDIxIDEzOjM0LCBPbGVr
c2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+IFBvc3NpYmxlIGxvY2tpbmcgYW5kIG90
aGVyIHdvcmsgbmVlZGVkOg0KPj4+Pj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09DQo+Pj4+Pg0KPj4+Pj4gMS4gcGNpZGV2c197bG9ja3x1bmxvY2t9IGlzIHRvbyBoZWF2
eSBhbmQgaXMgcGVyLWhvc3QNCj4+Pj4+IDIuIHBkZXYtPnZwY2ktPmxvY2sgY2Fubm90IGJlIHVz
ZWQgYXMgdnBjaSBpcyBmcmVlZCBieSB2cGNpX3JlbW92ZV9kZXZpY2UNCj4+Pj4+IDMuIFdlIG1h
eSB3YW50IGEgZGVkaWNhdGVkIHBlci1kb21haW4gcncgbG9jayB0byBiZSBpbXBsZW1lbnRlZDoN
Cj4+Pj4+DQo+Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmggYi94ZW4v
aW5jbHVkZS94ZW4vc2NoZWQuaA0KPj4+Pj4gaW5kZXggMjgxNDZlZTQwNGU2Li5lYmYwNzE4OTNi
MjEgMTAwNjQ0DQo+Pj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaA0KPj4+Pj4gKysr
IGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgNCj4+Pj4+IEBAIC00NDQsNiArNDQ0LDcgQEAgc3Ry
dWN0IGRvbWFpbg0KPj4+Pj4NCj4+Pj4+ICAgICDCoCNpZmRlZiBDT05GSUdfSEFTX1BDSQ0KPj4+
Pj4gICAgIMKgwqDCoMKgIHN0cnVjdCBsaXN0X2hlYWQgcGRldl9saXN0Ow0KPj4+Pj4gK8KgwqDC
oCByd2xvY2tfdCB2cGNpX3J3bG9jazsNCj4+Pj4+ICvCoMKgwqAgYm9vbCB2cGNpX3Rlcm1pbmF0
aW5nOyA8LSBhdG9taWM/DQo+Pj4+PiAgICAgwqAjZW5kaWYNCj4+Pj4+IHRoZW4gdnBjaV9yZW1v
dmVfZGV2aWNlIGlzIGEgd3JpdGVyIChjb2xkIHBhdGgpIGFuZCB2cGNpX3Byb2Nlc3NfcGVuZGlu
ZyBhbmQNCj4+Pj4+IHZwY2lfbW1pb197cmVhZHx3cml0ZX0gYXJlIHJlYWRlcnMgKGhvdCBwYXRo
KS4NCj4+Pj4gUmlnaHQgLSB5b3UgbmVlZCBzdWNoIGEgbG9jayBmb3Igb3RoZXIgcHVycG9zZXMg
YW55d2F5LCBhcyBwZXIgdGhlDQo+Pj4+IGRpc2N1c3Npb24gd2l0aCBKdWxpZW4uDQo+Pj4gV2hh
dCBhYm91dCBib29sIHZwY2lfdGVybWluYXRpbmc/IERvIHlvdSBzZWUgaXQgYXMgYW4gYXRvbWlj
IHR5cGUgb3IganVzdCBib29sPw0KPj4gSGF2aW5nIHNlZW4gb25seSAuLi4NCj4+DQo+Pj4+PiBk
b19waHlzZGV2X29wKFBIWVNERVZPUF9wY2lfZGV2aWNlX3JlbW92ZSkgd2lsbCBuZWVkIGh5cGVy
Y2FsbF9jcmVhdGVfY29udGludWF0aW9uDQo+Pj4+PiB0byBiZSBpbXBsZW1lbnRlZCwgc28gd2hl
biByZS1zdGFydCByZW1vdmFsIGlmIG5lZWQgYmU6DQo+Pj4+Pg0KPj4+Pj4gdnBjaV9yZW1vdmVf
ZGV2aWNlKCkNCj4+Pj4+IHsNCj4+Pj4+ICAgICDCoCBkLT52cGNpX3Rlcm1pbmF0aW5nID0gdHJ1
ZTsNCj4+IC4uLiB0aGlzIHVzZSBzbyBmYXIsIEkgY2FuJ3QgdGVsbCB5ZXQuIEJ1dCBhdCBhIGZp
cnN0IGdsYW5jZSBhIGJvb2xlYW4NCj4+IGxvb2tzIHRvIGJlIHdoYXQgeW91IG5lZWQuDQo+Pg0K
Pj4+Pj4gICAgIMKgIHJlbW92ZSB2UENJIHJlZ2lzdGVyIGhhbmRsZXJzIDwtIHRoaXMgd2lsbCBj
dXQgb2ZmIFBDSV9DT01NQU5EIGVtdWxhdGlvbiBhbW9uZyBvdGhlcnMNCj4+Pj4+ICAgICDCoCBp
ZiAoICF3cml0ZV90cnlsb2NrKGQtPnZwY2lfcndsb2NrKSApDQo+Pj4+PiAgICAgwqDCoMKgIHJl
dHVybiAtRVJFU1RBUlQ7DQo+Pj4+PiAgICAgwqAgeGZyZWUocGRldi0+dnBjaSk7DQo+Pj4+PiAg
ICAgwqAgcGRldi0+dnBjaSA9IE5VTEw7DQo+Pj4+PiB9DQo+Pj4+Pg0KPj4+Pj4gVGhlbiB0aGlz
IGQtPnZwY2lfcndsb2NrIGJlY29tZXMgYSBkZWRpY2F0ZWQgdnBjaSBwZXItZG9tYWluIGxvY2sg
Zm9yDQo+Pj4+PiBvdGhlciBvcGVyYXRpb25zIHdoaWNoIG1heSByZXF1aXJlIGl0LCBlLmcuIHZp
cnR1YWwgYnVzIHRvcG9sb2d5IGNhbg0KPj4+Pj4gdXNlIGl0IHdoZW4gYXNzaWduaW5nIHZTQkRG
IGV0Yy4NCj4+Pj4+DQo+Pj4+PiA0LiB2cGNpX3JlbW92ZV9kZXZpY2UgbmVlZHMgdG8gYmUgcmVt
b3ZlZCBmcm9tIHZwY2lfcHJvY2Vzc19wZW5kaW5nDQo+Pj4+PiBhbmQgZG8gbm90aGluZyBmb3Ig
RG9tMCBhbmQgY3Jhc2ggRG9tVSBvdGhlcndpc2U6DQo+Pj4+IFdoeSBpcyB0aGlzPyBJJ20gbm90
IG91dHJpZ2h0IG9wcG9zZWQsIGJ1dCBJIGRvbid0IGltbWVkaWF0ZWx5IHNlZSB3aHkNCj4+Pj4g
dHJ5aW5nIHRvIHJlbW92ZSB0aGUgcHJvYmxlbWF0aWMgZGV2aWNlIHdvdWxkbid0IGJlIGEgcmVh
c29uYWJsZSBjb3Vyc2UNCj4+Pj4gb2YgYWN0aW9uIGFueW1vcmUuIHZwY2lfcmVtb3ZlX2Rldmlj
ZSgpIG1heSBuZWVkIHRvIGJlY29tZSBtb3JlIGNhcmVmdWwNCj4+Pj4gYXMgdG8gbm90IGNyYXNo
aW5nLA0KPj4+IHZwY2lfcmVtb3ZlX2RldmljZSBkb2VzIG5vdCBjcmFzaCwgdnBjaV9wcm9jZXNz
X3BlbmRpbmcgZG9lcw0KPj4+PiAgICAgdGhvdWdoLg0KPj4+IEFzc3VtZSB3ZSBhcmUgaW4gYW4g
ZXJyb3Igc3RhdGUgaW4gdnBjaV9wcm9jZXNzX3BlbmRpbmcgKm9uIG9uZSBvZiB0aGUgdkNQVXMq
DQo+Pj4gYW5kIHdlIGNhbGwgdnBjaV9yZW1vdmVfZGV2aWNlLiB2cGNpX3JlbW92ZV9kZXZpY2Ug
dHJpZXMgdG8gYWNxdWlyZSB0aGUNCj4+PiBsb2NrIGFuZCBpdCBjYW4ndCBqdXN0IGJlY2F1c2Ug
dGhlcmUgYXJlIHNvbWUgb3RoZXIgdnBjaSBjb2RlIGlzIHJ1bm5pbmcgb24gb3RoZXIgdkNQVS4N
Cj4+PiBUaGVuIHdoYXQgZG8gd2UgZG8gaGVyZT8gV2UgYXJlIGluIFNvZnRJUlEgY29udGV4dCBu
b3cgYW5kIHdlIGNhbid0IHNwaW4NCj4+PiB0cnlpbmcgdG8gYWNxdWlyZSBkLT52cGNpX3J3bG9j
ayBmb3JldmVyLiBOZWl0aGVyIHdlIGNhbiBibGluZGx5IGZyZWUgdnBjaQ0KPj4+IHN0cnVjdHVy
ZSBiZWNhdXNlIGl0IGlzIHNlZW4gYnkgYWxsIHZDUFVzIGFuZCBtYXkgY3Jhc2ggdGhlbS4NCj4+
Pg0KPj4+IElmIHZwY2lfcmVtb3ZlX2RldmljZSBpcyBpbiBoeXBlcmNhbGwgY29udGV4dCBpdCBq
dXN0IHJldHVybnMgLUVSRVNUQVJUIGFuZA0KPj4+IGh5cGVyY2FsbCBjb250aW51YXRpb24gaGVs
cHMgaGVyZS4gQnV0IG5vdCBpbiBTb2Z0SVJRIGNvbnRleHQuDQo+PiBNYXliZSB0aGVuIHlvdSB3
YW50IHRvIGludm9rZSB0aGlzIGNsZWFudXAgZnJvbSBSQ1UgY29udGV4dCAod2hldGhlcg0KPj4g
dnBjaV9yZW1vdmVfZGV2aWNlKCkgaXRzZWxmIG9yIGEgc3VpdGFibGUgY2xvbmUgdGhlcmUgb2Yg
aXMgVEJEKT8gKEkNCj4+IHdpbGwgYWRtaXQgdGhvdWdoIHRoYXQgSSBkaWRuJ3QgY2hlY2sgd2hl
dGhlciB0aGF0IHdvdWxkIHNhdGlzZnkgYWxsDQo+PiBjb25zdHJhaW50cy4pDQo+Pg0KPj4gVGhl
biBhZ2FpbiBpdCBhbHNvIGhhc24ndCBiZWNvbWUgY2xlYXIgdG8gbWUgd2h5IHlvdSB1c2Ugd3Jp
dGVfdHJ5bG9jaygpDQo+PiB0aGVyZS4gVGhlIGxvY2sgY29udGVudGlvbiB5b3UgZGVzY3JpYmUg
ZG9lc24ndCwgb24gdGhlIHN1cmZhY2UsIGxvb2sNCj4+IGFueSBkaWZmZXJlbnQgZnJvbSBzaXR1
YXRpb25zIGVsc2V3aGVyZS4NCj4gSSB1c2Ugd3JpdGVfdHJ5bG9jayBpbiB2cGNpX3JlbW92ZV9k
ZXZpY2UgYmVjYXVzZSBpZiB3ZSBjYW4ndA0KPiBhY3F1aXJlIHRoZSBsb2NrIHRoZW4gd2UgZGVm
ZXIgZGV2aWNlIHJlbW92YWwuIFRoaXMgd291bGQgd29yaw0KPiB3ZWxsIGlmIGNhbGxlZCBmcm9t
IGEgaHlwZXJjYWxsIHdoaWNoIHdpbGwgZW1wbG95IGh5cGVyY2FsbCBjb250aW51YXRpb24uDQo+
IEJ1dCBTb2Z0SVJRIGdldHRpbmcgLUVSRVNUQVJUIGlzIHNvbWV0aGluZyB0aGF0IHdlIGNhbid0
IHByb2JhYmx5DQo+IGhhbmRsZSBieSByZXN0YXJ0aW5nIGFzIGh5cGVyY2FsbCBjYW4sIHRodXMg
SSBvbmx5IHNlZSB0aGF0IHZwY2lfcHJvY2Vzc19wZW5kaW5nDQo+IHdpbGwgbmVlZCB0byBzcGlu
IGFuZCB3YWl0IHVudGlsIHZwY2lfcmVtb3ZlX2RldmljZSBzdWNjZWVkcy4NCkRvZXMgYW55Ym9k
eSBoYXZlIGFueSBiZXR0ZXIgc29sdXRpb24gZm9yIHByZXZlbnRpbmcgU29mdElSUSBmcm9tDQpz
cGlubmluZyBvbiB2cGNpX3JlbW92ZV9kZXZpY2UgYW5kIC1FUkVTVEFSVD8NCj4+IEphbg0KPj4N
Cj4gVGhhbmsgeW91LA0KPiBPbGVrc2FuZHINClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

