Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F03AD4590CC
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 16:02:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228962.396248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpAq0-00057Z-Qj; Mon, 22 Nov 2021 15:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228962.396248; Mon, 22 Nov 2021 15:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpAq0-00054m-Mc; Mon, 22 Nov 2021 15:02:32 +0000
Received: by outflank-mailman (input) for mailman id 228962;
 Mon, 22 Nov 2021 15:02:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJrQ=QJ=epam.com=prvs=1960b635ba=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mpApz-00054g-GT
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 15:02:31 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35c76627-4ba5-11ec-a9d2-d9f7a1cc8784;
 Mon, 22 Nov 2021 16:02:29 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AMEXp3d020126;
 Mon, 22 Nov 2021 15:02:23 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cgcge8dj5-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 15:02:20 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AM5PR0301MB2356.eurprd03.prod.outlook.com (2603:10a6:203:6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Mon, 22 Nov
 2021 15:02:15 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::b121:f602:44b6:d445]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::b121:f602:44b6:d445%3]) with mapi id 15.20.4713.025; Mon, 22 Nov 2021
 15:02:15 +0000
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
X-Inumbo-ID: 35c76627-4ba5-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WvP61Spoj1l4EwaQ93ZtDEmbb72Wpq9B3TGOz5PDkwhXNLe1Fm6f+ebYsrbw7XHOHVrD/D+6BXenGRcFDlzZuOMQEzbCrLS0sZR4lDPk6HRqV/qr5tzfkhGgvk5X3f3R39fzOb3PIw3GaXvpZ81/mzmUwkcr81yRHx8GXMjhFfTaCIrjqAZw4y4peKnNR1fY+Ip1Yad72/M/gLHJNWOYkI4iESS8MM3ElLTweKHJ7fEkMgwzexOy56Y6TNzk2Id3H8z4pKEL63ogsq+tJOsAYCmcdG2fMkIYiTiSIEKthP1LoIOB9WMPqJD8PDGjL4J6hKcnY6RSJLS/dUnwspmCeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLVQnj3fVNlM3UfyJ1YZK1djM3gv8izuT/8SODHseKs=;
 b=ogNn11kb3Mg6pqUU+aLSkLHl6yHG7tHmeKzIiMAvEoD6laERacsM2dXIVdqkPYIMdAmeJQEe1SIyr/mfwcX+0x/noyjTgIfgIIQLau+wBUCdbARZLRvMRyETDQiCwAo8AT4xVYJon/xUUX+yOx1w6aU7PVdcMcXzwG0GSxldkrBa9C5gZeq4v/nmQChSMryFvRygHN64CNi+9vICVeuO2QPW6fSnceVKjPQR7Fw0nAdSISyU8psNAULvgnYGZ1GDirShV4IpG1RxTRHXdZRQBcIHpTDf2KOgY70TkYI5CXL2IUdBYtaYHUavOkUqi8UUFnjBewbMMC80OeMtTz1xvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLVQnj3fVNlM3UfyJ1YZK1djM3gv8izuT/8SODHseKs=;
 b=Mr6D6cV5PAZPYv0PhZxTzpE+LD9QE1n4SkeOWs+DWKKA6XEwuWViwt2bP7Q9RjpVNsE7/fEwDLgDWrlVVrs3DCET3vv1gD68eF4yj9EpEC6Pa+vGKKfgIjRjd2DaCQEySS7IMsnzGYhf7AAtvaDwaxCXwPj5CNQ9QypFdq6/L3lJiYlfn2gx3RUwdPAep8ciCK32h+zKVC/Eb1fyLYpJbjbflDnmIBGptGm2ouz3armlmFQFvEG011rH4qYs4wMw1qjPNt8DooRiEDzaz+XUyLUivoYXIifurAONSK6VDUrfdlhg4oF/O4Ixu0c5GD7rX9pLBSbdpkVugL47HeyAog==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
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
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        "julien@xen.org" <julien@xen.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Topic: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Index: 
 AQHX0hJIYALl/D9fL0OD6N0XGDJh2awHdhMAgAGHTYCAAA1EAIAABOkAgAAF6YCAAATnAIAAQRQAgAAGPgCAAAR1gIAAAvIAgAAFxACAAAoGAIAAAXMAgAABgYCAAAVtAIAAAX+AgAAB1wCAAVryAIAAB06AgAAEPgCAAAKhAIAAApkAgATD+4CAAARtgIAAAk+AgAADagCAAAFJAA==
Date: Mon, 22 Nov 2021 15:02:15 +0000
Message-ID: <4fff5e18-f538-2a3d-c496-63c8e065abb5@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
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
 <6be4e6c0-5b54-606e-1278-e97e143e23af@epam.com>
 <2363af0e-6435-485e-8906-16a6fca7885c@suse.com>
 <d8d6cbcb-478a-a5a7-4e93-036b0f75c6d0@epam.com>
 <f16c70be-f5f6-5f80-54f1-7ba69adc114e@suse.com>
In-Reply-To: <f16c70be-f5f6-5f80-54f1-7ba69adc114e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c53d8c10-cdff-4a39-0377-08d9adc9120e
x-ms-traffictypediagnostic: AM5PR0301MB2356:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM5PR0301MB23565FF040325507AAEC3A81E79F9@AM5PR0301MB2356.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TEGFVRmE2vv6jG38vO6KKPAxievG+OZm7pYmRnw/elquhkgC9kyv8S+7T2hWRncMaT5wj2NLKAXT1bQjEyUezsiFftlwu3GRpH7K7bCbU3aYukvvXGERmVUu+3KslB5r4m4PLw4gPnzYg9kSMpsw+WnIWkE+GD45xVIE9gDOPbC/ZC2EXIMX0sbpMtkpb9yC/3XW4nYym+hmSmjcVhVGYroepz0zWqUBYuMdcR8l2gTa5o9o+n9hHLn5T12pMigAsrgzWJxcsvq6vnOZkcUsvCRl8M8kMD1oljQb+4LDXk6Tk+MKkJs7rXDhWznE/lbCAPAv0Ztl2INfoIsQfLRTZE74WYdUMkIprIS+zlpAMLNrFRnuF+U9zcFkhmGJffyhsoJV2yZikWIboYLUNob36NLqGdy974gHGFsCOSAWbHENuEceYKX4gwAr5Yz7F7olYMnOhV5Y60mXNMz1kPyd6AtQyZCXYx51nhJtxkDDi9Mxg7MyC+kaFCm6+TFvVX7389RDNA7U9nBYoga5zp5d8rckx9AnP0WmmnSDtk15m6QT9Mqw8DXwd/dCvTalNfI7+3ATUN8+pbAJf/zTfYSIJmJpyShlxNZvheyRR8vKVWicX9rFJwcf1c2uakEJ0oYvf1ynhqfttyWryilMI4MLXqgAWwHnXGc34gDTkE5ICXkZD8r6X3tqt6GRoxhk1ZqoUKo2ymAd7SK/hMtE1uuelqKlNib+NoS8rLyai8EUkCKOXkWWOYm805to+LZl1uYv
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6325.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(8936002)(508600001)(83380400001)(26005)(6916009)(71200400001)(38070700005)(122000001)(54906003)(5660300002)(38100700002)(6486002)(36756003)(316002)(53546011)(6506007)(2906002)(2616005)(64756008)(6512007)(7416002)(86362001)(8676002)(31686004)(66946007)(4326008)(76116006)(66476007)(66446008)(107886003)(31696002)(66556008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TXorekYvU0dEblNvZmozT1JZNnloU2xqem9vdmRuYzRYMkErS1RhaG9TUHVr?=
 =?utf-8?B?aGxlYXBlcENSQmNYaEFiemtGelZQd2l4TjRKME1NNHdSUzVCTGpnYkN5c3p6?=
 =?utf-8?B?K3psZ1Yyc3pXWk9ISVZJNGx0emY4N2JiMDNPdmUvNWhOcFFZaEZ1TVRXS00r?=
 =?utf-8?B?dG5MSFl2ZEpES3NlUUI5RUdhc25ZTFIvUlQ2dmpoMllReWljQ3gwVkZaa2Zr?=
 =?utf-8?B?N2p3REJMWGp4RzFDUEcxR3Zkc0pwWTloc2gyZ1RPUFBBWEtmYU9wMUhXSk8w?=
 =?utf-8?B?QURheGJCRUxOY1dBZnh0Tzk5OWI3MHhZVllJWjhicWxiMU9OZGR2dEVhbFFH?=
 =?utf-8?B?ZTBzeHpwZjh0VHY5TC9tdDR6ZzFHM2MzK1hiVnpOZ0xCcXMzOU9sM25yUm85?=
 =?utf-8?B?TVQrQ0RmbStvaUl0V3lTRjB2dis0YTc3L0tvWGxXbDF2b1FSd3pPK2RBT2FV?=
 =?utf-8?B?cVJPMnJEa0tseDhxanplWllTdnZOOVFEcUp0ZWpsT0JLb29BeXVMQnlyUFNI?=
 =?utf-8?B?VTd1bFN6cFcyRjhoRTZFS2ZycVVFaHhWeWdsTk1odWx3eUlSenE3N1dpWllC?=
 =?utf-8?B?Z3NKSUV4TVJBOHN1R0JZbjc3TjRxS0FJbnFJQVlRVldRS3QwQUdaR3hLcXJx?=
 =?utf-8?B?a0xNUXllbGFQZi9MQXRoQzFuamp1MzMvT245T2J2dHgwcEoxd1diNkYrQ0I2?=
 =?utf-8?B?dXBQcXozWVlGc2pRK3lPU01MUW1HYTF1YW1JejF6TXZUUE95d3B6cXZvYXdw?=
 =?utf-8?B?Zm5SM29pcmpPbk8xT1JXT2JUUThPUDFGdWJxVVRESnNWVFNualBiQzdXVUI2?=
 =?utf-8?B?MzB0QkRhdmxtd3hCbEVqZVFRWHl6Y2kvUHRXMXhhSS94c3RiT09CZXczNHZ1?=
 =?utf-8?B?clk1cHJOUnNISCtZczdUa0F0Vkkwajh1M1YweDBacHVLNTRMRXVnWVlqNHl2?=
 =?utf-8?B?KzdFNGZNa3FROWd2bWlGWHlIeWI3QlVyY3FvZ0ZmWHBobnpKQWg4VjZaVnpR?=
 =?utf-8?B?RGpDWUNNaDc2aEpSOVoxc3J3VmVxMG5QYmNZK05wTXdtVzAxRmFpOXVqWENy?=
 =?utf-8?B?MVI4dzI3Vk5QZzkwZ01TdXhuaFRCU3RuNEFqcU5hMGxqV0F1VzZEUHNYdHB6?=
 =?utf-8?B?Vk9Bd2l0SE9sVzdrWmt2VTBsemtEVUZTOFdkbVBSUzBxOURRbjByT2swOWJy?=
 =?utf-8?B?dGUxU0JUNCtOMzJEcVZXT3JwVkZWdGxwa0s2eVZLUmNmWDNFSG02RkJET1E3?=
 =?utf-8?B?THFtbmRWbHhnckd4RHg4UktqZnJKbUZEWDQ4WXd5YnNmL3VTUUVubTZkNGkz?=
 =?utf-8?B?SXcyQ2I2aklaRWREdzE2dkRsRjAwdXJtZ0lVd3ZPSjQ5SjZKQnMzQ3RCODV2?=
 =?utf-8?B?M2Rzak9ROWtFZVprdTJvOTdQM3ZyRGdHTlpTY1kwZVNoK2VtcHU0Ym5wVXZH?=
 =?utf-8?B?QURoaTBsb3pPWVp1WDFqU0c2Vm5TNTBkUytSVXRPN2w3M3Z3OXlhY1laNHUr?=
 =?utf-8?B?RkNCMUhzckpmK3NtYmEwVnZVOXh1TEgzMEc1N05UVDBSZ0paZnJWTGcxaUZK?=
 =?utf-8?B?NFk4Z3Y4eFlJLzJraVFOMDFiSEx3c2x5LzBXZHZtV1RvYXRuRi9zby9udEhY?=
 =?utf-8?B?V3dHMWprek0zY0lCR2txaHlrQ2NHZm9jc3gxRjNyS0hKMDRCcTFDTU4vTUhS?=
 =?utf-8?B?SU5BaU11dm5Jd25KMWVWS1VQZ0phK3J2R09weGRuRkFaVVAvdGdKWlh6bUE3?=
 =?utf-8?B?aFRTS1JoMWM1RmpReW0zNEJjbXNaVUo2RVY2bWg0cHVDaDZ4R0Y0a2hOdVNH?=
 =?utf-8?B?dmdBUm9ISkRudmxYNmtiQVlyUHlodTN4VDBMalM5L0lCenhhWUtZZFJrVkhS?=
 =?utf-8?B?N1AwSGJuRWc3NkV1cEhhVFVXeG5mL2xpUlAraWlYTEx2T2FDQyt3SFFlNGRl?=
 =?utf-8?B?akpPZlJrYU1zRVBDOWRKWUJsdE1oN3pXQm9IRmNVcG93N0gxY01KM2FtRmZh?=
 =?utf-8?B?VExRYUJJRXVvcVVkd1BtUmwyeUlxbUVHRGppVXJIOC9aMFlIRU9TRnI4WEtj?=
 =?utf-8?B?dWxqRlBMSlRSOUtTOGRURmxoTURUV29uaHNSYjVQYUlIS0hlNDhWM2ZKb2tF?=
 =?utf-8?B?bDJIb3FCRHBaTFcvWVh0YUZ2eGJSVG1vVTM5UGVyZ29iWUFQN0d4clZWMWxL?=
 =?utf-8?B?MkhNdk55dzQ1KzNsenE5VSs2UTduOG55aEdwdWpnZ3FQZkxIQ05CaHhkTEFx?=
 =?utf-8?B?WGRSckd0empIT3haSUpvbDZteHVQSW1LOWtZTVVNN21DZUp4YUpIcUpkcjl3?=
 =?utf-8?B?QkRyWmZDdDZUeEpYZzVYS2tOTFFPdGJQcHVYeXp5cXdlV3NNMG1wdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2AA51456511A2C45B0158989EE98A56A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c53d8c10-cdff-4a39-0377-08d9adc9120e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2021 15:02:15.1201
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nc+VqQoeFqn/yX2+58sTVkIFysy8ck58M2GqM7ur7zAYtdRGUrqI1BWjNhbx5E9+HIDZZ85oSMQGzINsIRcdL+AwmfXMKT6A+eUNnzIBduIH9BU7swj27ik0/S0cITye
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0301MB2356
X-Proofpoint-GUID: r3egOux2JMSL2cEd_mYY27Gh1UAfAxX8
X-Proofpoint-ORIG-GUID: r3egOux2JMSL2cEd_mYY27Gh1UAfAxX8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_07,2021-11-22_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0
 mlxscore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111220079

DQoNCk9uIDIyLjExLjIxIDE2OjU3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjIuMTEuMjAy
MSAxNTo0NSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMjIuMTEu
MjEgMTY6MzcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDIyLjExLjIwMjEgMTU6MjEsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAxOS4xMS4yMSAxNTozNCwgT2xl
a3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+PiBPbiAxOS4xMS4yMSAxNToyNSwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4gT24gMTkuMTEuMjAyMSAxNDoxNiwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+Pj4+IE9uIDE5LjExLjIxIDE1OjAwLCBKYW4gQmV1bGlj
aCB3cm90ZToNCj4+Pj4+Pj4+IE9uIDE5LjExLjIwMjEgMTM6MzQsIE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIHdyb3RlOg0KPj4+Pj4+Pj4+IFBvc3NpYmxlIGxvY2tpbmcgYW5kIG90aGVyIHdvcmsg
bmVlZGVkOg0KPj4+Pj4+Pj4+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQ0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4gMS4gcGNpZGV2c197bG9ja3x1bmxvY2t9IGlzIHRvbyBo
ZWF2eSBhbmQgaXMgcGVyLWhvc3QNCj4+Pj4+Pj4+PiAyLiBwZGV2LT52cGNpLT5sb2NrIGNhbm5v
dCBiZSB1c2VkIGFzIHZwY2kgaXMgZnJlZWQgYnkgdnBjaV9yZW1vdmVfZGV2aWNlDQo+Pj4+Pj4+
Pj4gMy4gV2UgbWF5IHdhbnQgYSBkZWRpY2F0ZWQgcGVyLWRvbWFpbiBydyBsb2NrIHRvIGJlIGlt
cGxlbWVudGVkOg0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L3hlbi9zY2hlZC5oIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgNCj4+Pj4+Pj4+PiBpbmRleCAy
ODE0NmVlNDA0ZTYuLmViZjA3MTg5M2IyMSAxMDA2NDQNCj4+Pj4+Pj4+PiAtLS0gYS94ZW4vaW5j
bHVkZS94ZW4vc2NoZWQuaA0KPj4+Pj4+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5o
DQo+Pj4+Pj4+Pj4gQEAgLTQ0NCw2ICs0NDQsNyBAQCBzdHJ1Y3QgZG9tYWluDQo+Pj4+Pj4+Pj4N
Cj4+Pj4+Pj4+PiAgICAgICDCoCNpZmRlZiBDT05GSUdfSEFTX1BDSQ0KPj4+Pj4+Pj4+ICAgICAg
IMKgwqDCoMKgIHN0cnVjdCBsaXN0X2hlYWQgcGRldl9saXN0Ow0KPj4+Pj4+Pj4+ICvCoMKgwqAg
cndsb2NrX3QgdnBjaV9yd2xvY2s7DQo+Pj4+Pj4+Pj4gK8KgwqDCoCBib29sIHZwY2lfdGVybWlu
YXRpbmc7IDwtIGF0b21pYz8NCj4+Pj4+Pj4+PiAgICAgICDCoCNlbmRpZg0KPj4+Pj4+Pj4+IHRo
ZW4gdnBjaV9yZW1vdmVfZGV2aWNlIGlzIGEgd3JpdGVyIChjb2xkIHBhdGgpIGFuZCB2cGNpX3By
b2Nlc3NfcGVuZGluZyBhbmQNCj4+Pj4+Pj4+PiB2cGNpX21taW9fe3JlYWR8d3JpdGV9IGFyZSBy
ZWFkZXJzIChob3QgcGF0aCkuDQo+Pj4+Pj4+PiBSaWdodCAtIHlvdSBuZWVkIHN1Y2ggYSBsb2Nr
IGZvciBvdGhlciBwdXJwb3NlcyBhbnl3YXksIGFzIHBlciB0aGUNCj4+Pj4+Pj4+IGRpc2N1c3Np
b24gd2l0aCBKdWxpZW4uDQo+Pj4+Pj4+IFdoYXQgYWJvdXQgYm9vbCB2cGNpX3Rlcm1pbmF0aW5n
PyBEbyB5b3Ugc2VlIGl0IGFzIGFuIGF0b21pYyB0eXBlIG9yIGp1c3QgYm9vbD8NCj4+Pj4+PiBI
YXZpbmcgc2VlbiBvbmx5IC4uLg0KPj4+Pj4+DQo+Pj4+Pj4+Pj4gZG9fcGh5c2Rldl9vcChQSFlT
REVWT1BfcGNpX2RldmljZV9yZW1vdmUpIHdpbGwgbmVlZCBoeXBlcmNhbGxfY3JlYXRlX2NvbnRp
bnVhdGlvbg0KPj4+Pj4+Pj4+IHRvIGJlIGltcGxlbWVudGVkLCBzbyB3aGVuIHJlLXN0YXJ0IHJl
bW92YWwgaWYgbmVlZCBiZToNCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IHZwY2lfcmVtb3ZlX2Rldmlj
ZSgpDQo+Pj4+Pj4+Pj4gew0KPj4+Pj4+Pj4+ICAgICAgIMKgIGQtPnZwY2lfdGVybWluYXRpbmcg
PSB0cnVlOw0KPj4+Pj4+IC4uLiB0aGlzIHVzZSBzbyBmYXIsIEkgY2FuJ3QgdGVsbCB5ZXQuIEJ1
dCBhdCBhIGZpcnN0IGdsYW5jZSBhIGJvb2xlYW4NCj4+Pj4+PiBsb29rcyB0byBiZSB3aGF0IHlv
dSBuZWVkLg0KPj4+Pj4+DQo+Pj4+Pj4+Pj4gICAgICAgwqAgcmVtb3ZlIHZQQ0kgcmVnaXN0ZXIg
aGFuZGxlcnMgPC0gdGhpcyB3aWxsIGN1dCBvZmYgUENJX0NPTU1BTkQgZW11bGF0aW9uIGFtb25n
IG90aGVycw0KPj4+Pj4+Pj4+ICAgICAgIMKgIGlmICggIXdyaXRlX3RyeWxvY2soZC0+dnBjaV9y
d2xvY2spICkNCj4+Pj4+Pj4+PiAgICAgICDCoMKgwqAgcmV0dXJuIC1FUkVTVEFSVDsNCj4+Pj4+
Pj4+PiAgICAgICDCoCB4ZnJlZShwZGV2LT52cGNpKTsNCj4+Pj4+Pj4+PiAgICAgICDCoCBwZGV2
LT52cGNpID0gTlVMTDsNCj4+Pj4+Pj4+PiB9DQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+PiBUaGVuIHRo
aXMgZC0+dnBjaV9yd2xvY2sgYmVjb21lcyBhIGRlZGljYXRlZCB2cGNpIHBlci1kb21haW4gbG9j
ayBmb3INCj4+Pj4+Pj4+PiBvdGhlciBvcGVyYXRpb25zIHdoaWNoIG1heSByZXF1aXJlIGl0LCBl
LmcuIHZpcnR1YWwgYnVzIHRvcG9sb2d5IGNhbg0KPj4+Pj4+Pj4+IHVzZSBpdCB3aGVuIGFzc2ln
bmluZyB2U0JERiBldGMuDQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+PiA0LiB2cGNpX3JlbW92ZV9kZXZp
Y2UgbmVlZHMgdG8gYmUgcmVtb3ZlZCBmcm9tIHZwY2lfcHJvY2Vzc19wZW5kaW5nDQo+Pj4+Pj4+
Pj4gYW5kIGRvIG5vdGhpbmcgZm9yIERvbTAgYW5kIGNyYXNoIERvbVUgb3RoZXJ3aXNlOg0KPj4+
Pj4+Pj4gV2h5IGlzIHRoaXM/IEknbSBub3Qgb3V0cmlnaHQgb3Bwb3NlZCwgYnV0IEkgZG9uJ3Qg
aW1tZWRpYXRlbHkgc2VlIHdoeQ0KPj4+Pj4+Pj4gdHJ5aW5nIHRvIHJlbW92ZSB0aGUgcHJvYmxl
bWF0aWMgZGV2aWNlIHdvdWxkbid0IGJlIGEgcmVhc29uYWJsZSBjb3Vyc2UNCj4+Pj4+Pj4+IG9m
IGFjdGlvbiBhbnltb3JlLiB2cGNpX3JlbW92ZV9kZXZpY2UoKSBtYXkgbmVlZCB0byBiZWNvbWUg
bW9yZSBjYXJlZnVsDQo+Pj4+Pj4+PiBhcyB0byBub3QgY3Jhc2hpbmcsDQo+Pj4+Pj4+IHZwY2lf
cmVtb3ZlX2RldmljZSBkb2VzIG5vdCBjcmFzaCwgdnBjaV9wcm9jZXNzX3BlbmRpbmcgZG9lcw0K
Pj4+Pj4+Pj4gICAgICAgdGhvdWdoLg0KPj4+Pj4+PiBBc3N1bWUgd2UgYXJlIGluIGFuIGVycm9y
IHN0YXRlIGluIHZwY2lfcHJvY2Vzc19wZW5kaW5nICpvbiBvbmUgb2YgdGhlIHZDUFVzKg0KPj4+
Pj4+PiBhbmQgd2UgY2FsbCB2cGNpX3JlbW92ZV9kZXZpY2UuIHZwY2lfcmVtb3ZlX2RldmljZSB0
cmllcyB0byBhY3F1aXJlIHRoZQ0KPj4+Pj4+PiBsb2NrIGFuZCBpdCBjYW4ndCBqdXN0IGJlY2F1
c2UgdGhlcmUgYXJlIHNvbWUgb3RoZXIgdnBjaSBjb2RlIGlzIHJ1bm5pbmcgb24gb3RoZXIgdkNQ
VS4NCj4+Pj4+Pj4gVGhlbiB3aGF0IGRvIHdlIGRvIGhlcmU/IFdlIGFyZSBpbiBTb2Z0SVJRIGNv
bnRleHQgbm93IGFuZCB3ZSBjYW4ndCBzcGluDQo+Pj4+Pj4+IHRyeWluZyB0byBhY3F1aXJlIGQt
PnZwY2lfcndsb2NrIGZvcmV2ZXIuIE5laXRoZXIgd2UgY2FuIGJsaW5kbHkgZnJlZSB2cGNpDQo+
Pj4+Pj4+IHN0cnVjdHVyZSBiZWNhdXNlIGl0IGlzIHNlZW4gYnkgYWxsIHZDUFVzIGFuZCBtYXkg
Y3Jhc2ggdGhlbS4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gSWYgdnBjaV9yZW1vdmVfZGV2aWNlIGlzIGlu
IGh5cGVyY2FsbCBjb250ZXh0IGl0IGp1c3QgcmV0dXJucyAtRVJFU1RBUlQgYW5kDQo+Pj4+Pj4+
IGh5cGVyY2FsbCBjb250aW51YXRpb24gaGVscHMgaGVyZS4gQnV0IG5vdCBpbiBTb2Z0SVJRIGNv
bnRleHQuDQo+Pj4+Pj4gTWF5YmUgdGhlbiB5b3Ugd2FudCB0byBpbnZva2UgdGhpcyBjbGVhbnVw
IGZyb20gUkNVIGNvbnRleHQgKHdoZXRoZXINCj4+Pj4+PiB2cGNpX3JlbW92ZV9kZXZpY2UoKSBp
dHNlbGYgb3IgYSBzdWl0YWJsZSBjbG9uZSB0aGVyZSBvZiBpcyBUQkQpPyAoSQ0KPj4+Pj4+IHdp
bGwgYWRtaXQgdGhvdWdoIHRoYXQgSSBkaWRuJ3QgY2hlY2sgd2hldGhlciB0aGF0IHdvdWxkIHNh
dGlzZnkgYWxsDQo+Pj4+Pj4gY29uc3RyYWludHMuKQ0KPj4+Pj4+DQo+Pj4+Pj4gVGhlbiBhZ2Fp
biBpdCBhbHNvIGhhc24ndCBiZWNvbWUgY2xlYXIgdG8gbWUgd2h5IHlvdSB1c2Ugd3JpdGVfdHJ5
bG9jaygpDQo+Pj4+Pj4gdGhlcmUuIFRoZSBsb2NrIGNvbnRlbnRpb24geW91IGRlc2NyaWJlIGRv
ZXNuJ3QsIG9uIHRoZSBzdXJmYWNlLCBsb29rDQo+Pj4+Pj4gYW55IGRpZmZlcmVudCBmcm9tIHNp
dHVhdGlvbnMgZWxzZXdoZXJlLg0KPj4+Pj4gSSB1c2Ugd3JpdGVfdHJ5bG9jayBpbiB2cGNpX3Jl
bW92ZV9kZXZpY2UgYmVjYXVzZSBpZiB3ZSBjYW4ndA0KPj4+Pj4gYWNxdWlyZSB0aGUgbG9jayB0
aGVuIHdlIGRlZmVyIGRldmljZSByZW1vdmFsLiBUaGlzIHdvdWxkIHdvcmsNCj4+Pj4+IHdlbGwg
aWYgY2FsbGVkIGZyb20gYSBoeXBlcmNhbGwgd2hpY2ggd2lsbCBlbXBsb3kgaHlwZXJjYWxsIGNv
bnRpbnVhdGlvbi4NCj4+Pj4+IEJ1dCBTb2Z0SVJRIGdldHRpbmcgLUVSRVNUQVJUIGlzIHNvbWV0
aGluZyB0aGF0IHdlIGNhbid0IHByb2JhYmx5DQo+Pj4+PiBoYW5kbGUgYnkgcmVzdGFydGluZyBh
cyBoeXBlcmNhbGwgY2FuLCB0aHVzIEkgb25seSBzZWUgdGhhdCB2cGNpX3Byb2Nlc3NfcGVuZGlu
Zw0KPj4+Pj4gd2lsbCBuZWVkIHRvIHNwaW4gYW5kIHdhaXQgdW50aWwgdnBjaV9yZW1vdmVfZGV2
aWNlIHN1Y2NlZWRzLg0KPj4+PiBEb2VzIGFueWJvZHkgaGF2ZSBhbnkgYmV0dGVyIHNvbHV0aW9u
IGZvciBwcmV2ZW50aW5nIFNvZnRJUlEgZnJvbQ0KPj4+PiBzcGlubmluZyBvbiB2cGNpX3JlbW92
ZV9kZXZpY2UgYW5kIC1FUkVTVEFSVD8NCj4+PiBXZWxsLCBhdCB0aGlzIHBvaW50IEkgY2FuIHN1
Z2dlc3Qgb25seSBhIG1hcmdpbmFsIGltcHJvdmVtZW50OiBJbnN0ZWFkIG9mDQo+Pj4gc3Bpbm5p
bmcgaW5zaWRlIHRoZSBzb2Z0aXJxIGhhbmRsZXIsIHlvdSB3YW50IHRvIHJlLXJhaXNlIHRoZSBz
b2Z0aXJxIGFuZA0KPj4+IGV4aXQgdGhlIGhhbmRsZXIuIFRoYXQgd2F5IGF0IGxlYXN0IGhpZ2hl
ciAicHJpb3JpdHkiIHNvZnRpcnFzIHdvbid0IGJlDQo+Pj4gc3RhcnZlZC4NCj4+Pg0KPj4+IEJl
eW9uZCB0aGF0IC0gbWF5YmUgdGhlIGd1ZXN0IChvciBqdXN0IGEgdmNwdSBvZiBpdCkgbmVlZHMg
cGF1c2luZyBpbiBzdWNoDQo+Pj4gYW4gZXZlbnQsIHdpdGggdGhlIHdvcmsgZGVmZXJyZWQgdG8g
YSB0YXNrbGV0Pw0KPj4+DQo+Pj4gWWV0IEkgZG9uJ3QgdGhpbmsgbXkgZWFybGllciBxdWVzdGlv
biByZWdhcmRpbmcgdGhlIHVzZSBvZiB3cml0ZV90cnlsb2NrKCkNCj4+PiB3YXMgcmVhbGx5IGFu
c3dlcmVkLiBXaGF0IHlvdSBzYWlkIGluIHJlcGx5IGRvZXNuJ3QgZXhwbGFpbiAodG8gbWUgYXQN
Cj4+PiBsZWFzdCkgd2h5IHdyaXRlX2xvY2soKSBpcyBub3QgYW4gb3B0aW9uLg0KPj4gSSB3YXMg
dGhpbmtpbmcgdGhhdCB3ZSBkbyBub3Qgd2FudCB0byBmcmVlemUgaW4gY2FzZSB3ZSBhcmUgY2Fs
bGluZyB2cGNpX3JlbW92ZV9kZXZpY2UNCj4+IGZyb20gU29mdElSUSBjb250ZXh0LCB0aHVzIHdl
IHRyeSB0byBsb2NrIGFuZCBpZiB3ZSBjYW4ndCB3ZSByZXR1cm4gLUVSRVNUQVJUDQo+PiBpbmRp
Y2F0aW5nIHRoYXQgdGhlIHJlbW92YWwgbmVlZHMgdG8gYmUgZGVmZXJyZWQuIElmIHdlIHVzZSB3
cml0ZV9sb2NrLCB0aGVuDQo+PiBTb2Z0SVJRIC0+IHdyaXRlX2xvY2sgd2lsbCBzcGluIHRoZXJl
IHdhaXRpbmcgZm9yIHJlYWRlcnMgdG8gcmVsZWFzZSB0aGUgbG9jay4NCj4+DQo+PiB3cml0ZV9s
b2NrIGFjdHVhbGx5IG1ha2VzIHRoaW5ncyBhIGxvdCBlYXNpZXIsIGJ1dCBJIGp1c3QgZG9uJ3Qg
a25vdyBpZiBpdA0KPj4gaXMgb2sgdG8gdXNlIGl0LiBJZiBzbywgdGhlbiB2cGNpX3JlbW92ZV9k
ZXZpY2UgYmVjb21lcyBzeW5jaHJvbm91cyBhbmQNCj4+IHRoZXJlIGlzIG5vIG5lZWQgaW4gaHlw
ZXJjYWxsIGNvbnRpbnVhdGlvbiBhbmQgb3RoZXIgaGVhdnkgbWFjaGluZXJ5IGZvcg0KPj4gcmUt
c2NoZWR1bGluZyBTb2Z0SVJRLi4uDQo+IEknbSBpbmNsaW5lZCB0byBhc2s6IElmIGl0IHdhc24n
dCBva2F5IHRvIHVzZSBoZXJlLCB0aGVuIHdoZXJlIHdvdWxkIGl0IGJlDQo+IG9rYXkgdG8gdXNl
PyBPZiBjb3Vyc2UgSSByZWFsaXplIHRoZXJlIGFyZSBjYXNlcyB3aGVuIGxvbmcgc3Bpbm5pbmcg
dGltZXMNCj4gY2FuIGJlIGEgcHJvYmxlbS4NCkkgY2FuJ3QgcHJvdmUsIGJ1dCBJIGhhdmUgYSBm
ZWVsaW5nIHRoYXQgd3JpdGVfbG9jayBjb3VsZCBiZSBsZXNzDQoiaGFybWZ1bCIgaW4gY2FzZSBv
ZiBhIGh5cGVyY2FsbCByYXRoZXIgdGhhbiBTb2Z0SVJRDQo+ICAgQnV0IEkgZXhwZWN0IHRoZXJl
IGFyZW4ndCBnb2luZyB0byBiZSBleGNlc3NpdmVseSBsb25nDQo+IGxvY2sgaG9sZGluZyByZWdp
b25zIGZvciB0aGlzIGxvY2ssIGFuZCBJIGFsc28gd291bGQgZXhwZWN0IGF2ZXJhZ2UNCj4gY29u
dGVudGlvbiB0byBub3QgYmUgb3Zlcmx5IGJhZC4NClllcywgdGhpcyBpcyBteSBpbXByZXNzaW9u
IGFzIHdlbGwNCj4gICBCdXQgaW4gdGhlIGVuZCB5b3Uga25vdyBiZXR0ZXIgdGhlIGNvZGUNCj4g
dGhhdCB5b3UncmUgd3JpdGluZyAoYW5kIHdoaWNoIG1heSBsZWFkIHRvIGlzc3VlcyB3aXRoIHRo
ZSBsb2NrIHVzYWdlKSB0aGFuDQo+IEkgZG8gLi4uDQpJIGFtIHByZXR0eSBtdWNoIG9rIHdpdGgg
d3JpdGVfbG9jayBhcyBpdCBkb2VzIG1ha2UgdGhpbmdzIHdheSBlYXNpZXIuDQpTbyBJJ2xsIGdv
dCB3aXRoIHdyaXRlX2xvY2sgdGhlbiBhbmQgaWYgd2Ugc3BvdCBncmVhdCBjb250ZW50aW9uIHRo
ZW4gd2UNCmNhbiBpbXByb3ZlIHRoYXQNCj4NCj4gSmFuDQo+DQpUaGFuayB5b3UhIQ0KT2xla3Nh
bmRy

